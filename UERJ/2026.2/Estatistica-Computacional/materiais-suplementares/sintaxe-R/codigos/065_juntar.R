regioes <- tibble(region = c("northeast", "northwest", "southeast", "southwest"),
                  nome = c("Nordeste", "Noroeste", "Sudeste", "Sudoeste"))
seguro |> left_join(regioes, by = "region") |>
  count(nome)
