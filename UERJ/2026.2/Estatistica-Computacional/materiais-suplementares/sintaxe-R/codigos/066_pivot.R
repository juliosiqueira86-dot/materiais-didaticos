library(tidyr)
largo <- seguro |> group_by(region, smoker) |>
  summarise(media = round(mean(charges)), .groups = "drop") |>
  pivot_wider(names_from = smoker, values_from = media)
largo
largo |> pivot_longer(c(no, yes), names_to = "fumante", values_to = "media") |>
  head(4)
