M <- matrix(1:6, nrow = 2)      # preenche por coluna
M
dim(M); t(M)                    # dimensão e transposta
M[2, 3]; M[, 2]                 # elemento e coluna
A <- matrix(c(2, 1, 1, 3), 2)
solve(A)                        # inversa
A %*% solve(A)                  # produto matricial
