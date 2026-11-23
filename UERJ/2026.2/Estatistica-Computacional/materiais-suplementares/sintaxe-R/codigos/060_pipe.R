# sem pipe: funções aninhadas, lidas de dentro para fora
round(mean(sqrt(c(4, 9, 16))), 2)
# com pipe |> : lido da esquerda para a direita
c(4, 9, 16) |> sqrt() |> mean() |> round(2)
