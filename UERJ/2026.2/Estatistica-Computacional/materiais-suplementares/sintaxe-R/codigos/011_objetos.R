x <- 5                # atribuição (use <- )
y <- x * 2
x; y
curso <- "UERJ"       # texto entre aspas
ls(pattern = "^(x|y|curso)$")   # objetos na memória (filtrados)
rm(curso)             # remove um objeto
exists("curso")
