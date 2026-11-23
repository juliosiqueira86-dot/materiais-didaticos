pdf("imagens/r_base.pdf", width = 6.4, height = 2.4)
par(mfrow = c(1, 3), mar = c(4, 4, 1.5, 0.5), cex.main = 0.9)
hist(mtcars$mpg, main = "hist()", xlab = "mpg", col = "#C9C9E8")
boxplot(mpg ~ cyl, data = mtcars, main = "boxplot()",
        col = "#C9C9E8", xlab = "cilindros")
plot(mpg ~ wt, data = mtcars, main = "plot()", pch = 19, col = "#3333B2")
abline(lm(mpg ~ wt, data = mtcars), col = "#F9423A")
invisible(dev.off())
