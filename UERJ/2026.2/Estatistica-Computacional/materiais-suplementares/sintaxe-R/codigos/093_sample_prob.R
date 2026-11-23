set.seed(2026)
dado_viciado <- sample(1:6, 6000, replace = TRUE, prob = c(1, 1, 1, 1, 1, 5) / 10)
round(prop.table(table(dado_viciado)), 3)
# Monte Carlo: probabilidade de pelo menos dois 6 em 4 lançamentos de um dado honesto
sim <- replicate(20000, sum(sample(1:6, 4, replace = TRUE) == 6) >= 2)
c(simulada = mean(sim), exata = 1 - pbinom(1, 4, 1/6))
