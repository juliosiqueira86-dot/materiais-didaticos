df <- data.frame(nome = c("Ana", "Bruno", "Carla"),
                 idade = c(20, 23, 21),
                 atuaria = c(TRUE, FALSE, TRUE))
df
str(df)
df$idade            # uma coluna (vetor)
df[2, ]             # uma linha
df[df$idade > 20, c("nome", "idade")]
nrow(df); ncol(df); names(df)
