esc <- c("médio", "superior", "médio", "fundamental", "superior")
f <- factor(esc, levels = c("fundamental", "médio", "superior"),
            ordered = TRUE)
f
table(f)
levels(f); as.integer(f)
f[2] > f[1]          # ordem faz sentido em fator ordenado
