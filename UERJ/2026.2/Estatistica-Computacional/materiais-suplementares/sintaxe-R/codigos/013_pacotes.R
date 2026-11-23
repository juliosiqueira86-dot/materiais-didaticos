# install.packages("dplyr")   # instala (uma vez por computador)
library(dplyr)                # carrega (a cada sessão)
packageVersion("dplyr")
# dplyr::filter() chama a função sem carregar o pacote
"package:dplyr" %in% search()  # o pacote está carregado?
