v <- c(4, 8, 15, 16, 23, 42)
v[2]            # 2º elemento
v[c(1, 3)]      # 1º e 3º
v[-1]           # tudo menos o 1º
v[v > 15]       # condição lógica
which(v > 15)   # posições que atendem
names(v) <- letters[1:6]
v["c"]
