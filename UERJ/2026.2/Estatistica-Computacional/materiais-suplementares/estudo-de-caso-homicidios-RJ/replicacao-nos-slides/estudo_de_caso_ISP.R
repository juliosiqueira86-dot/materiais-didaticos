# =====================================================================
# Estudo de caso: homicídios no RJ (ISP, 2000-2019) -- replicação em R
# Material original cedido por Marcello M. Provenza (Provenza et al., 2022).
# Estatística Computacional -- UERJ 2026.2 -- Prof. Julio C. Siqueira
# Pacotes: install.packages(c("readxl", "lmtest", "car"))
# Coloque este script na mesma pasta de taxa_hd.xlsx e rode tudo.
# =====================================================================
library(readxl); library(lmtest); library(car)

# 1. Leitura e descrição
crimes <- as.data.frame(read_excel("taxa_hd.xlsx")[, 1:4])
crimes$ano <- 2000:2019                    # série anual 2000-2019
round(sapply(crimes[, 1:4], function(v)
  c(media = mean(v), dp = sd(v), min = min(v), max = max(v))), 2)
round(cor(crimes[, 1:4]), 3)               # correlações

# 2. Séries
matplot(crimes$ano, crimes[, c("hd", "th", "ar", "lat")], type = "l", lty = 1,
        lwd = 1.5, col = c("black", "#3333B2", "#F9423A", "#2E8B57"),
        xlab = "Ano", ylab = "Taxa por 100 mil hab.", ylim = c(0, 60))
legend("topright", c("Homicídio doloso", "Tentativa de homicídio",
       "Auto de resistência", "Latrocínio"), lty = 1, lwd = 1.5, cex = 0.7,
       col = c("black", "#3333B2", "#F9423A", "#2E8B57"), bty = "n")

# 3. Sete modelos candidatos: R2 ajustado, AIC e BIC
form <- c("hd ~ lat", "hd ~ th", "hd ~ ar", "hd ~ lat + th",
          "hd ~ lat + ar", "hd ~ th + ar", "hd ~ lat + th + ar")
mods <- lapply(form, function(f) lm(as.formula(f), data = crimes))
data.frame(modelo = form,
  R2aj = round(sapply(mods, function(m) summary(m)$adj.r.squared), 3),
  AIC = round(sapply(mods, AIC), 3), BIC = round(sapply(mods, BIC), 3))

# 4. Modelo completo e multicolinearidade
fit7 <- lm(hd ~ lat + th + ar, data = crimes)
round(summary(fit7)$coefficients, 4)
vif(fit7)

# 5. Modelo escolhido
fit <- lm(hd ~ lat + th, data = crimes)
summary(fit)

# 6. Pressupostos
r <- resid(fit)
round(c(Shapiro_Wilk = shapiro.test(r)$p.value,
  KS = ks.test(r, "pnorm", 0, sd(r))$p.value,
  Breusch_Pagan = unname(bptest(fit)$p.value),
  Goldfeld_Quandt = unname(gqtest(fit)$p.value),
  Durbin_Watson = unname(dwtest(fit)$p.value)), 4)
outlierTest(fit)                           # Bonferroni

# 7. Gráficos de resíduos
par(mfrow = c(1, 3))
qqnorm(r, main = "QQ dos resíduos"); qqline(r, col = "red")
plot(fitted(fit), r, main = "Resíduos x ajustados", xlab = "Ajustados",
     ylab = "Resíduos"); abline(h = 0, lty = 2)
plot(crimes$ano, r, type = "b", main = "Resíduos x ano", xlab = "Ano",
     ylab = "Resíduos"); abline(h = 0, lty = 2)
par(mfrow = c(1, 1))
