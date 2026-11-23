aluno <- list(nome = "Ana", notas = c(7.5, 8, 9), aprovado = TRUE)
str(aluno)
aluno$notas            # elemento pelo nome
aluno[["nome"]]
mean(aluno$notas)
aluno$curso <- "Atuária"   # acrescenta elemento
names(aluno)
