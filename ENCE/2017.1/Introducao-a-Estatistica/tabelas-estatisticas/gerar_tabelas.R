# =====================================================================
# Tabelas estatísticas -- Prof. Julio C. Siqueira
# Valores exatos das distribuições, calculados no R (pnorm, qt, qchisq, qf)
# e arredondados para o número de casas usual das tabelas impressas.
# Gera tabelas_estatisticas.tex (compilar com pdflatex).
# =====================================================================
fmt <- function(x, d) formatC(x, format = "f", digits = d, decimal.mark = ",")
gl_inf <- function(g) ifelse(is.infinite(g), "$\\infty$", as.character(g))
linhas <- function(m) paste0(apply(m, 1, paste, collapse = " & "), " \\\\")

# 1. Normal padrão: P(0 < Z < k)
k_lin <- seq(0, 3.9, by = 0.1); k_col <- 0:9 / 100
N <- outer(k_lin, k_col, function(a, b) pnorm(a + b) - 0.5)
tab_normal <- cbind(fmt(k_lin, 1), matrix(fmt(N, 4), nrow = nrow(N)))

# 2. t de Student: valor t com área p na cauda superior
p_t <- c(0.10, 0.05, 0.025, 0.01, 0.005)
gl_t <- c(1:30, 40, 60, 120, Inf)
Tt <- sapply(p_t, function(p) qt(p, gl_t, lower.tail = FALSE))
tab_t <- cbind(gl_inf(gl_t), matrix(fmt(Tt, 3), nrow = nrow(Tt)))

# 3. Qui-quadrado: valor y tal que P(Y > y) = p
p_q <- c(0.99, 0.98, 0.975, 0.95, 0.90, 0.80, 0.70, 0.50, 0.30, 0.20, 0.10,
         0.05, 0.04, 0.025, 0.02, 0.01, 0.002, 0.001)
Q <- sapply(p_q, function(p) qchisq(p, 1:30, lower.tail = FALSE))
tab_q <- cbind(1:30, matrix(fmt(Q, 3), nrow = 30))

# 4. F: valor f tal que P(F > f) = alfa
f_fmt <- function(x) ifelse(x >= 100, fmt(x, 1), fmt(x, 2))
gl2 <- c(1:30, 40, 60, 120, Inf)
F5_g1 <- c(1:10, 12, 14, 15, 16, 18, 20, 24, 30, 40, 60, 120, Inf)
F25_g1 <- c(1:10, 12, 15, 20, 24, 30, 40, 60, 120, Inf)
tabF <- function(alfa, g1) {
  # qf aceita graus de liberdade infinitos (limite da distribuição)
  M <- outer(gl2, g1, function(b, a) qf(alfa, a, b, lower.tail = FALSE))
  cbind(gl_inf(gl2), matrix(f_fmt(M), nrow = nrow(M)))
}
tab_F5 <- tabF(0.05, F5_g1); tab_F25 <- tabF(0.025, F25_g1)

pct <- function(p) sapply(p, function(v)
  paste0(fmt(100 * v, ifelse(abs(100 * v - round(100 * v)) < 1e-9, 0, 1)), "\\%"))
tex <- c(
"\\documentclass[10pt]{article}",
"\\usepackage[T1]{fontenc}\\usepackage[utf8]{inputenc}\\usepackage[brazilian]{babel}",
"\\usepackage{lmodern}\\usepackage{tgheros}\\renewcommand{\\familydefault}{\\sfdefault}",
"\\usepackage[a4paper,margin=1.4cm]{geometry}\\usepackage{booktabs,lscape,array}",
"\\pagestyle{empty}\\setlength{\\tabcolsep}{4pt}",
"\\begin{document}",
"\\begin{center}{\\Large\\bfseries Tabelas Estatísticas}\\\\[2pt]",
"{\\small Prof. Julio C. Siqueira \\textperiodcentered{} valores calculados no R 4.3 (\\texttt{pnorm}, \\texttt{qt}, \\texttt{qchisq}, \\texttt{qf})}\\end{center}",
"\\subsection*{1. Distribuição Normal padrão: $P(0 < Z < k)$}",
"{\\small Linha: $k$ até a 1ª casa decimal; coluna: 2ª casa decimal. Ex.: $P(0 < Z < 1{,}96) = 0{,}4750$.}\\\\[4pt]",
"\\centering\\footnotesize",
paste0("\\begin{tabular}{c", strrep("r", 10), "}\\toprule"),
paste0("$k$ & ", paste(fmt(k_col, 2), collapse = " & "), " \\\\ \\midrule"),
linhas(tab_normal), "\\bottomrule\\end{tabular}",
"\\newpage",
"\\subsection*{2. Distribuição $t$ de Student: valor $t$ com área $p$ na extremidade superior}",
"{\\small Ex.: com 10 graus de liberdade e área 0,05 na extremidade superior, $t_{0{,}05} = 1{,}812$.}\\\\[4pt]",
"\\centering\\small",
"\\begin{tabular}{crrrrr}\\toprule",
paste0("Graus de liberdade & \\multicolumn{5}{c}{Área da extremidade superior} \\\\ & ",
       paste(fmt(p_t, 3), collapse = " & "), " \\\\ \\midrule"),
linhas(tab_t), "\\bottomrule\\end{tabular}",
"\\begin{landscape}\\global\\pdfpageattr{/Rotate 90}   % páginas deitadas aparecem na horizontal na tela",
"\\subsection*{3. Distribuição Qui-quadrado: valor $y$ tal que $P(Y > y) = p$, $Y \\sim \\chi^2(\\nu)$}",
"{\\small Para $\\nu > 30$, use a aproximação normal.}\\\\[4pt]",
"\\centering\\footnotesize",
paste0("\\begin{tabular}{c", strrep("r", length(p_q)), "}\\toprule"),
paste0("$\\nu$ $\\backslash$ $p$ & ", paste(pct(p_q), collapse = " & "), " \\\\ \\midrule"),
linhas(tab_q), "\\bottomrule\\end{tabular}",
"\\newpage",
"\\subsection*{4. Distribuição $F$: valor $f$ tal que $P(F > f) = 0{,}05$}",
"{\\small Colunas: graus de liberdade do numerador ($\\nu_1$); linhas: do denominador ($\\nu_2$).}\\\\[4pt]",
"\\centering\\scriptsize\\setlength{\\tabcolsep}{2.6pt}",
paste0("\\begin{tabular}{c", strrep("r", length(F5_g1)), "}\\toprule"),
paste0("$\\nu_2$ $\\backslash$ $\\nu_1$ & ", paste(gl_inf(F5_g1), collapse = " & "), " \\\\ \\midrule"),
linhas(tab_F5), "\\bottomrule\\end{tabular}",
"\\newpage",
"\\subsection*{5. Distribuição $F$: valor $f$ tal que $P(F > f) = 0{,}025$}",
"{\\small Colunas: graus de liberdade do numerador ($\\nu_1$); linhas: do denominador ($\\nu_2$).}\\\\[4pt]",
"\\centering\\scriptsize\\setlength{\\tabcolsep}{3.2pt}",
paste0("\\begin{tabular}{c", strrep("r", length(F25_g1)), "}\\toprule"),
paste0("$\\nu_2$ $\\backslash$ $\\nu_1$ & ", paste(gl_inf(F25_g1), collapse = " & "), " \\\\ \\midrule"),
linhas(tab_F25), "\\bottomrule\\end{tabular}",
"\\end{landscape}\\global\\pdfpageattr{}",
"\\end{document}")
writeLines(tex, "tabelas_estatisticas.tex", useBytes = TRUE)
# conferências rápidas
c(z196 = pnorm(1.96) - 0.5, t10_05 = qt(0.95, 10), qq1_05 = qchisq(0.95, 1),
  F5_1_1 = qf(0.95, 1, 1), F25_1_1 = qf(0.975, 1, 1))
