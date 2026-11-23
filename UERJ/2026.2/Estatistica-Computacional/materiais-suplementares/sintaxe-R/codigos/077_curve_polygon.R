pdf("imagens/r_normal_area.pdf", width = 4.6, height = 2.4)
par(mar = c(4, 4, 0.5, 0.5))
curve(dnorm(x), -3.5, 3.5, lwd = 2, col = "#3333B2", ylab = "densidade", xlab = "z")
z <- seq(-1.96, 1.96, length.out = 200)
polygon(c(-1.96, z, 1.96), c(0, dnorm(z), 0), col = adjustcolor("#3333B2", 0.25), border = NA)
text(0, 0.15, "95%")
invisible(dev.off())
pnorm(1.96) - pnorm(-1.96)        # a área sombreada
