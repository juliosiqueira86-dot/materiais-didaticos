# Estudo de caso: homicídios no Rio de Janeiro (ISP-RJ, 2000–2019)

## Agradecimento

Agradecemos, com muita gratidão, a **Marcello Montillo Provenza** (UERJ), que gentilmente cedeu este material
para uso nas aulas de Estatística Computacional. O artigo, a apresentação, o script e a planilha abaixo são de sua
autoria (com os coautores do artigo) e foram a base do estudo de caso de regressão linear múltipla apresentado nos slides
da disciplina. Muito obrigado pela generosidade em compartilhar o trabalho com os alunos!

## Como citar

PROVENZA, M. M.; SANTOS, J. V. J. dos; SIMÕES, P. H. C.; LIMA, A. A.; LIMA, I. C. de A.; RIBEIRO, P. P. O. de S.
A relação entre os homicídios consumados e tentados, latrocínios e autos de resistência no Rio de Janeiro.
In: *Anais do III CoBICET – Congresso Brasileiro Interdisciplinar em Ciência e Tecnologia*, 2022.
Disponível em: <https://www.even3.com.br/anais/cobicet2022/507523-a-relacao-entre-os-homicidios-consumados-e-tentados-latrocinios-e-autos-de-resistencia-no-rio-de-janeiro>.

Dados: Instituto de Segurança Pública do Estado do Rio de Janeiro (ISP) — <http://www.ispdados.rj.gov.br>.

## Material original (cedido por Marcello M. Provenza)

| Arquivo | Conteúdo |
|---|---|
| [Provenza_et_al_2022_artigo_CoBICET.pdf](material-original/Provenza_et_al_2022_artigo_CoBICET.pdf) | artigo completo publicado nos anais do III CoBICET (2022) |
| [Provenza_apresentacao_estudo_de_caso.pdf](material-original/Provenza_apresentacao_estudo_de_caso.pdf) | apresentação do estudo de caso: regressão, seleção de modelos (AIC/BIC), pressupostos e conclusões |
| [Taxa_HD.R](material-original/Taxa_HD.R) | script R original da análise |
| [taxa_hd.xlsx](material-original/taxa_hd.xlsx) | taxas anuais por 100 mil habitantes, RJ, 2000–2019: `hd` homicídio doloso, `lat` latrocínio, `ar` auto de resistência, `th` tentativa de homicídio |

Observações para rodar o script original:

- ajuste o `setwd()` da primeira linha para a pasta onde você salvou a planilha;
- o arquivo foi salvo com acentuação do Windows: no RStudio, use *File → Reopen with Encoding → WINDOWS-1252* se os acentos aparecerem trocados;
- o pacote `alr3`, usado no teste de falta de ajuste, foi retirado do CRAN; as demais etapas rodam com `readxl`, `ggplot2`, `lmtest`, `car` e `gridExtra`.

## Replicação nos slides da disciplina

Scripts completos e independentes que refazem a análise como apresentada nos slides de Estatística Computacional
(seção "Estudo de caso: crimes no RJ"): leitura, correlações, sete modelos candidatos (R² ajustado, AIC, BIC),
multicolinearidade (VIF), modelo final e pressupostos (Shapiro-Wilk, Breusch-Pagan, Goldfeld-Quandt, Durbin-Watson,
Bonferroni). Baixe o script e a planilha para a mesma pasta e rode.

- [estudo_de_caso_ISP.R](replicacao-nos-slides/estudo_de_caso_ISP.R)
- [estudo_de_caso_ISP.py](replicacao-nos-slides/estudo_de_caso_ISP.py)
- [taxa_hd.xlsx](replicacao-nos-slides/taxa_hd.xlsx)

[Voltar](../README.md)
