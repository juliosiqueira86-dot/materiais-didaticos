sapply(mtcars[, 1:4], mean)          # aplica em cada coluna
apply(as.matrix(mtcars[, 1:3]), 2, sd)  # 2 = colunas
tapply(iris$Sepal.Length, iris$Species, mean)   # por grupo
lapply(split(mtcars$mpg, mtcars$cyl), range)    # lista
