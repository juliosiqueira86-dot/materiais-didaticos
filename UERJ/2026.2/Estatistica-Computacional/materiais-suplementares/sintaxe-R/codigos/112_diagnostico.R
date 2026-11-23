pdf("imagens/r_diag.pdf", width = 6.4, height = 2.4)
par(mfrow = c(1, 3), mar = c(4, 4, 1.8, 0.5), cex.main = 0.85)
plot(m, which = c(1, 2, 4), pch = 19, cex = 0.4, col = "#3333B2")
invisible(dev.off())
