# Sintaxe R com exemplos aplicados — material de apoio

Estatística Computacional (IME05-14142) — UERJ 2026.2 — Prof. Julio C. Siqueira

- [Sintaxe_R_com_Exemplos_Aplicados.pdf](Sintaxe_R_com_Exemplos_Aplicados.pdf) — 96 slides, cada um com o código e a saída real.
- [codigos/](codigos/) — os 68 scripts dos slides, numerados na ordem em que aparecem.
- [dados/](dados/) — arquivos de exemplo (fictícios) usados na importação: `funcionarios_br.csv` (`;` e vírgula decimal, latin1)
  e `pessoas_fwf.txt` (largura fixa).

## Conteúdo

1. Primeiros passos: RStudio, objetos, ajuda, pacotes; funções matemáticas e combinatória (`factorial`, `choose`)
2. Vetores e tipos: indexação, vetorização, `NA`, fatores, datas, textos; ordenação (`sort`, `order`, `rank`) e conjuntos
3. Estruturas: matrizes, listas, data frames, tibbles; classes com `cut()`; `rbind`, `cbind`, `merge`, `subset`
4. Programação: `if`/`else`, `switch`, `stop`/`stopifnot`, `for`/`while`/`repeat`, `next`/`break`, recursão, funções,
   família `apply`, `purrr`
5. Importar e exportar: `read.csv2`/`read.table` (codificação), `read.fwf` (largura fixa), `readr`, `readxl`, `writexl`,
   `save`/`load`, `saveRDS`
6. Manipulação: pipe `|>`, `dplyr` (filter, select, mutate, summarise, joins), `tidyr` (pivot), `stringr`, expressões
   regulares (`grepl`, `sub`, `gsub`, `regmatches`), `formatC`, `forcats`, `lubridate`
7. Gráficos: R base em camadas (`points`, `lines`, `abline`, `text`, `legend`, `layout`), `curve` e `polygon` (áreas sob
   a densidade), `ggplot2` (camadas, cores, painéis, salvar)
8. Estatística descritiva, probabilidade (`d`/`p`/`q`/`r`) e simulação (`sample` com `prob`, `replicate`)
9. Inferência (testes t, proporção, qui-quadrado, ANOVA) e regressão (`lm`, `glm`, diagnóstico)
10. Boas práticas, reprodutibilidade e erros comuns

## Como rodar os scripts

1. Crie um projeto no RStudio e copie as pastas `codigos/` e `dados/` para dentro dele.
2. Instale os pacotes (uma vez): `install.packages(c("tidyverse", "readxl", "writexl"))`.
3. Os exemplos usam bases que já vêm com o R (`mtcars`, `iris`, `airquality`, `ToothGrowth`, `ggplot2::mpg`), os arquivos
   fictícios de `dados/` e a base *Medical Cost Personal* do Kaggle: baixe `insurance.csv` em
   <https://www.kaggle.com/datasets/mirichoi0218/insurance> e salve em `dados/insurance.csv`.
4. Rode os scripts em ordem (a partir do `050`, eles usam o objeto `seguro` criado na importação). Os gráficos são salvos na
   pasta `imagens/` (crie-a antes).

## Referências

Organização dos tópicos baseada em TEETOR, P. *R Cookbook* (O'Reilly, 2011; 2.ª ed. em <https://rc2e.com>) e WICKHAM, H.;
GROLEMUND, G. *R for Data Science* (O'Reilly, 2017; 2.ª ed. em <https://r4ds.hadley.nz>). Textos, dados e exemplos próprios,
executados no R 4.3.

[Voltar](../README.md)
