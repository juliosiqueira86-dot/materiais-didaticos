set.seed(2026)                       # torna a simulação reprodutível
sample(1:6, 10, replace = TRUE)      # 10 lançamentos de dado
z <- rnorm(10000, mean = 50, sd = 10)
c(media = mean(z), dp = sd(z)) |> round(2)
mean(z > 70)                         # aproxima P(X > 70)
1 - pnorm(70, 50, 10)                # valor exato
