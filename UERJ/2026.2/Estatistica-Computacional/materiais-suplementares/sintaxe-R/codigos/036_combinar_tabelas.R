a <- data.frame(id = 1:3, nome = c("Ana", "Bruno", "Carla"))
b <- data.frame(id = c(1, 3, 4), nota = c(8.5, 9.0, 7.0))
rbind(a, data.frame(id = 4, nome = "Diego"))   # empilha linhas
cbind(a, curso = "Atuária")                    # acrescenta coluna
merge(a, b, by = "id")                  # só ids comuns
merge(a, b, by = "id", all = TRUE)      # todos (NA onde falta)
subset(mtcars, mpg > 30, select = c(mpg, hp))
