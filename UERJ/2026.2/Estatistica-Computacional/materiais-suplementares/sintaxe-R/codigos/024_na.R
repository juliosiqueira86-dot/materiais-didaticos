w <- c(5, NA, 7, 10, NA)
mean(w)                  # NA "contamina" a conta
mean(w, na.rm = TRUE)    # ignora os NA
sum(is.na(w))            # quantos faltantes
w[!is.na(w)]             # só os observados
complete.cases(airquality)[1:6]
