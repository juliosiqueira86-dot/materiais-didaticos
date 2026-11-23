library(dplyr)
seguro |>
  filter(smoker == "yes", age >= 60) |>    # linhas
  arrange(desc(charges)) |>                # ordena
  head(4)
