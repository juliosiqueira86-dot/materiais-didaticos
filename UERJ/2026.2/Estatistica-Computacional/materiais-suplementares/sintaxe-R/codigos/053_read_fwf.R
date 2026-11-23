# largura fixa: UF(2) sexo(1) idade(3) renda(8, com 2 decimais implícitas)
p <- read.fwf("dados/pessoas_fwf.txt", widths = c(2, 1, 3, 8),
              col.names = c("uf", "sexo", "idade", "renda"))
p$renda <- p$renda / 100
p
tapply(p$renda, p$uf, mean)
