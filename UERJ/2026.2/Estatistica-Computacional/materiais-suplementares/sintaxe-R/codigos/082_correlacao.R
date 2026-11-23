round(cor(seguro[, c("age", "bmi", "children", "charges")]), 3)
cor(seguro$age, seguro$charges, method = "spearman") |> round(3)
