seguro |>
  group_by(smoker, sex) |>
  summarise(n = n(), media = mean(charges),
            mediana = median(charges), .groups = "drop")
