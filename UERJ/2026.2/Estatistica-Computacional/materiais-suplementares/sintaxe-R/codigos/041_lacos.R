for (i in 1:3) {
  cat("Iteração", i, ": quadrado =", i^2, "\n")
}
soma <- 0; k <- 0
while (soma < 20) {        # repete enquanto a condição valer
  k <- k + 1; soma <- soma + k
}
c(k = k, soma = soma)
