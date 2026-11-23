email <- c("ana@uerj.br", "bruno@gmail.com", "carla(at)uerj.br")
grepl("@uerj\\.br$", email)              # termina com @uerj.br?
sub("@.*", "", email)                     # tudo antes do @
gsub("[aeiou]", "", "estatistica")        # remove vogais
regmatches("CEP 20550-900, RJ", regexpr("[0-9]{5}-[0-9]{3}", "CEP 20550-900, RJ"))
trimws("   espaços   ")
formatC(1234567.891, format = "f", digits = 2, big.mark = ".", decimal.mark = ",")
