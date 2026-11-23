medida <- function(x, tipo = "media") {
  stopifnot(is.numeric(x))                # valida a entrada
  switch(tipo,
         media = mean(x),
         mediana = median(x),
         amplitude = diff(range(x)),
         stop("tipo desconhecido: ", tipo))
}
medida(c(2, 4, 9), "mediana")
medida(c(2, 4, 9), "amplitude")
try(medida(c(2, 4, 9), "moda"), silent = TRUE) |> cat()
