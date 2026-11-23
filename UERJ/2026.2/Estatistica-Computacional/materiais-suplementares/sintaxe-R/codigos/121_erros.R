r <- try(log(-1), silent = TRUE); r            # NaN com aviso
r <- try(sqrt("4"), silent = TRUE)
cat(r)                                          # mensagem de erro
tryCatch(as.numeric("x"), warning = function(w) "aviso capturado")
