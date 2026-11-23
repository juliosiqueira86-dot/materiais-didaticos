library(stringr); library(forcats)
str_detect(c("UERJ", "UFRJ", "UFF"), "^UF")
str_replace_all("custo-anual-2026", "-", "_")
str_to_title("estatística computacional")
f <- factor(seguro$region)
fct_infreq(f) |> levels()               # ordena por frequência
fct_recode(factor(c("no", "yes")), "não" = "no", sim = "yes")
