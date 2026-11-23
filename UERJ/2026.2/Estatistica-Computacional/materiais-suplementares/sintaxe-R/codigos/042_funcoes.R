cv <- function(x, na.rm = FALSE) {
  # coeficiente de variação em %
  100 * sd(x, na.rm = na.rm) / mean(x, na.rm = na.rm)
}
cv(mtcars$mpg)
cv(airquality$Ozone, na.rm = TRUE)
padroniza <- function(x) (x - mean(x)) / sd(x)
round(head(padroniza(mtcars$mpg)), 3)
