set.seed(2026)
amostra <- seguro[sample(nrow(seguro), 5), c("age", "sex", "charges")]
amostra
seguro |> slice_sample(n = 3) |> select(age, smoker)   # dplyr
