seguro$fuma <- as.integer(seguro$smoker == "yes")
mg <- glm(fuma ~ charges + age, family = binomial, data = seguro)
round(summary(mg)$coefficients, 5)
exp(coef(mg)["charges"] * 1000) |> round(3)   # razão de chances por US$ 1.000
