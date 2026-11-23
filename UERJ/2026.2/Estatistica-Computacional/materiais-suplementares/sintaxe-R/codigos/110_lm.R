m <- lm(charges ~ age + bmi + smoker, data = seguro)
summary(m)
