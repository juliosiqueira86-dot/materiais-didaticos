seguro |>
  select(age, bmi, charges) |>             # colunas
  mutate(obeso = bmi >= 30,                # cria variáveis
         custo_mil = round(charges / 1000, 1)) |>
  head(4)
