for (i in 1:10) {
  if (i %% 2 == 0) next          # pula os pares
  if (i > 7) break               # interrompe o laço
  cat(i, "")
}
cat("\n")
fat <- function(n) if (n <= 1) 1 else n * fat(n - 1)   # recursiva
fat(6)
k <- 0
repeat { k <- k + 1; if (2^k > 1000) break }   # menor k com 2^k > 1000
k
