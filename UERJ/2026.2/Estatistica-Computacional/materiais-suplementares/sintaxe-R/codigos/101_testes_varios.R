prop.test(sum(seguro$smoker == "yes"), nrow(seguro), p = 0.25)$p.value
chisq.test(table(seguro$sex, seguro$smoker))$p.value
shapiro.test(sample(seguro$bmi, 500))$p.value      # normalidade
wilcox.test(charges ~ sex, data = seguro)$p.value  # não paramétrico
