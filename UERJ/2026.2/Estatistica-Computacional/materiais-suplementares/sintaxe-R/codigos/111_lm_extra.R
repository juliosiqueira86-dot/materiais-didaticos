round(confint(m), 1)
novo <- data.frame(age = 40, bmi = 30, smoker = c("no", "yes"))
predict(m, novo, interval = "prediction") |> round(0)
