# Tabelas estatísticas — Introdução à Estatística (ENCE 2017.1)

- [Tabelas_Estatisticas.pdf](Tabelas_Estatisticas.pdf) (5 páginas)

| Página | Tabela | O que dá |
|---|---|---|
| 1 | Normal padrão | $P(0 < Z < k)$, $k$ de 0,00 a 3,99 |
| 2 | $t$ de Student | valor $t$ com área 0,10; 0,05; 0,025; 0,01; 0,005 na cauda superior; 1 a 30, 40, 60, 120 e ∞ graus de liberdade |
| 3 | Qui-quadrado | valor $y$ tal que $P(Y > y) = p$, $p$ de 99% a 0,1%; 1 a 30 graus de liberdade |
| 4 | $F$ (5%) | valor $f$ tal que $P(F > f) = 0{,}05$ |
| 5 | $F$ (2,5%) | valor $f$ tal que $P(F > f) = 0{,}025$ |

Os valores são os das próprias distribuições de probabilidade, calculados no R 4.3 (`pnorm`, `qt`, `qchisq`, `qf`)
e arredondados para o número de casas usual das tabelas impressas. O script [gerar_tabelas.R](gerar_tabelas.R)
reproduz o PDF.

Em relação às tabelas impressas usadas antes, a tabela Normal difere em 3 valores, sempre na 4ª casa decimal, porque
aqui o arredondamento é feito sobre o valor exato: $k = 0{,}68$ dá 0,2517; $k = 0{,}71$ dá 0,2611; $k = 3{,}00$ dá 0,4987.

[Voltar](../README.md)
