f <- read.csv2("dados/funcionarios_br.csv", fileEncoding = "latin1")
str(f)              # ; separador e , decimal: read.csv2
f$admissao <- as.Date(f$admissao, format = "%d/%m/%Y")
mean(f$salario)
g <- read.table("dados/funcionarios_br.csv", header = TRUE, sep = ";",
                dec = ",", fileEncoding = "latin1")
identical(f$salario, g$salario)
