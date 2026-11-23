modelo <- aov(len ~ supp * factor(dose), data = ToothGrowth)
summary(modelo)
TukeyHSD(aov(len ~ factor(dose), data = ToothGrowth))$`factor(dose)` |>
  round(3)
