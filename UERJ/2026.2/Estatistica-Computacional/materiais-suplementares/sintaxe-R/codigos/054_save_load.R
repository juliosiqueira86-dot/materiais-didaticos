dir.create("saida_exemplos", showWarnings = FALSE)
a1 <- 1:5; a2 <- "texto"
save(a1, a2, file = "saida_exemplos/objetos.RData")   # vários objetos
rm(a1, a2)
load("saida_exemplos/objetos.RData")                  # volta com os nomes
a1; a2
