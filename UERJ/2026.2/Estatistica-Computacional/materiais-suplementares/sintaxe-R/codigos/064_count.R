seguro |> count(region, sort = TRUE)
seguro |> count(smoker) |> mutate(prop = n / sum(n))
seguro |> distinct() |> nrow()     # remove duplicatas
