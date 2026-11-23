
setwd("G:/Meu Drive/Artigos/RLM Homicidio")

library(readxl)
base = read_excel("taxa_hd.xlsx")

# Grafico
tiff(filename = "Figura1.tiff", width = 16, height = 8, 
     units = "cm", pointsize = 7, "lzw", res = 1200)
ts.plot(base$hd,
        main = "",
        ylim = c(0,60),
        ylab = "Taxa", xlab = "Anos")
lines(base$lat, col="blue")
lines(base$ar, col="red")
lines(base$th, col="darkgreen")
legend("topright",
       legend = c("Homicídio Doloso", "Latrocínio",
                  "Auto de Resistência", "Tentativa de Homicídio"),
       col = c("black", "blue", "red", "darkgreen"),
       lty = 1, cex = 1.2)
dev.off()

fit = lm(hd ~ lat + th + ar, data = base)
summary(fit)
anova(fit)

mod1 = lm(hd ~ lat, data = base)
mod2 = lm(hd ~ th, data = base)
mod3 = lm(hd ~ ar, data = base)
mod4 = lm(hd ~ lat+th, data = base)
mod5 = lm(hd ~ lat+ar, data = base)
mod6 = lm(hd ~ th+ar, data = base)
mod7 = lm(hd ~ lat+th+ar, data = base)

selecao = data.frame(R2a=rep(NA,7),AIC=NA,BIC=NA)

selecao$R2a = c(summary(mod1)$adj.r.squared,summary(mod2)$adj.r.squared,
                summary(mod3)$adj.r.squared,summary(mod4)$adj.r.squared,
                summary(mod5)$adj.r.squared,summary(mod6)$adj.r.squared,
                summary(mod7)$adj.r.squared)

selecao$AIC = c(AIC(mod1),AIC(mod2),AIC(mod3),AIC(mod4),AIC(mod5),AIC(mod6),
                AIC(mod7))

selecao$BIC = c(BIC(mod1),BIC(mod2),BIC(mod3),BIC(mod4),BIC(mod5),BIC(mod6),
                BIC(mod7))

selecao
# mod4 é o melhor modelo, pois tem R2 igual ao mod6, mas AIC e BIC menor


fit = lm(hd ~ lat + th, data = base)
ajustados = as.vector(fit$fitted.values)
residuos = as.vector(fit$residuals)
df = data.frame(ajustados,residuos)

library(ggplot2) # QQ plot
ggplot(df, aes(sample = residuos)) + stat_qq() + stat_qq_line() +
  xlab("Modelo Teórico") +
  ylab("Amostra")


shapiro.test(residuos)
# residuos normais para alfa = 5%

ks.test(residuos, "pnorm", mean = 0, sd = sd(residuos))
# residuos normais para alfa = 5%

ggplot(df, aes(x = ajustados, y = residuos)) + geom_point() + 
  geom_hline(yintercept = 0, color = "red") +
  xlab("Ajustados") +
  ylab("Resíduos")
# o gráfico dos resíduos versus valores ajustados do modelo escolhido 
# parece apresentar um comportamento aletório

library(lmtest)
bptest(fit) # Teste de Breusch-Pagan
# como p-valor maior que qualquer alfa usual, não rejeitamos 
# a hipótese de que as variâncias dos erros são iguais.

gqtest(fit) # Teste de Goldfeld-Quandt
# como p-valor maior que qualquer alfa usual, não rejeitamos 
# a hipótese de que as variâncias dos erros são iguais.


ggplot(df, aes(x=1:length(residuos), y = residuos)) +
  geom_line() +
  xlab("Ordem de Coleta") +
  ylab("Resíduos")

dwtest(fit) # Teste de Durbin-Watson
# para alfa = 1% rejeitamos a hipótese de que os resíduos são independentes


library(car)
outlierTest(fit) # teste de Bonferroni
# a observação 3, segundo o teste de Bonferroni, apresenta valor extremo


library(alr3)
pureErrorAnova(fit) # Teste da falta de ajuste (lack of fit)
# não rejeitamos a hipótese de que o modelo é adequado


X = data.frame(lat=base$lat,th=base$th,ar=base$ar)
cor(X)
# nenhuma variavel apresenta alta correlacao


library(car)
fit = lm(hd ~ th + lat + ar, data = base)
vif(fit)
# como não existem variáveis com VIF maior que 10, 
# podemos dizer que não há multicolinearidade.


fit = lm(hd ~ lat + th, data = base) # melhor modelo
summary(fit)
anova(fit)


# Graficos em janela unica com ggplot2
library(ggplot2)

QQplot = ggplot(df, aes(sample = residuos)) + stat_qq() + stat_qq_line() +
           xlab("Valores Teóricos") + ylab("Amostra") + 
           labs(title ="QQ Plot") + 
           theme(plot.title = element_text(hjust = 0.5))

ResAj = ggplot(df, aes(x = ajustados, y = residuos)) + geom_point() + 
           geom_hline(yintercept = 0, color = "red") +
           xlab("Valores Ajustados") + ylab("Resíduos") + 
           labs(title ="Resíduos x Ajustados") + 
           theme(plot.title = element_text(hjust = 0.5))

ResCol = ggplot(df, aes(x=1:length(residuos), y = residuos)) +
           geom_line() +
           xlab("Ordem de Coleta") + ylab("Resíduos") + 
           labs(title ="Resíduos x Ordem de Coleta") + 
           theme(plot.title = element_text(hjust = 0.5))

library(gridExtra)
tiff(filename = "Figura4.tiff", width = 24, height = 12, 
     units = "cm", pointsize = 6, "lzw", res = 1200)
grid.arrange(QQplot, ResAj, ResCol, ncol = 3)
dev.off()
