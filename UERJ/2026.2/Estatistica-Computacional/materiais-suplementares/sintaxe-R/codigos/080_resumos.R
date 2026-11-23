x <- seguro$charges
c(media = mean(x), mediana = median(x), dp = sd(x),
  cv = 100 * sd(x) / mean(x)) |> round(1)
quantile(x, c(0.25, 0.5, 0.75, 0.9)) |> round(0)
range(x); IQR(x)
