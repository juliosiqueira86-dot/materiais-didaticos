tab <- table(seguro$sex, seguro$smoker)
tab
prop.table(tab, margin = 1) |> round(3)   # % por linha
addmargins(tab)
