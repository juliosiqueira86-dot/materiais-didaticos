idade <- c(19, 23, 31, 38, 44, 47, 52, 58, 61, 64, 27, 35)
classes <- cut(idade, breaks = seq(15, 65, by = 10), right = FALSE)
table(classes)                       # [15,25) [25,35) ...
cut(idade, breaks = c(0, 30, 50, Inf),
    labels = c("jovem", "adulto", "sênior"), right = FALSE)
