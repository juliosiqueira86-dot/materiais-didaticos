library(purrr)
map_dbl(mtcars[, 1:4], median)        # resultado numérico
map_chr(iris, class)                  # resultado em texto
mtcars |> split(mtcars$cyl) |>
  map(\(d) lm(mpg ~ wt, data = d)) |>
  map_dbl(\(m) coef(m)[2])            # inclinação por grupo
