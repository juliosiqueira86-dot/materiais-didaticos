tab <- table(mtcars$cyl)
pdf("imagens/r_barras.pdf", width = 4.4, height = 2.4)
par(mar = c(4, 4, 0.5, 0.5))
barplot(tab, col = "#3333B2", xlab = "Cilindros", ylab = "Frequência")
invisible(dev.off())
tab
