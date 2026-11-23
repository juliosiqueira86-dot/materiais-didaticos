nota <- 6.4
if (nota >= 7) {
  "aprovado"
} else if (nota >= 4) {
  "prova final"
} else {
  "reprovado"
}
notas <- c(8, 5.5, 3)
ifelse(notas >= 7, "AP", ifelse(notas >= 4, "PF", "RP"))   # vetorizado
