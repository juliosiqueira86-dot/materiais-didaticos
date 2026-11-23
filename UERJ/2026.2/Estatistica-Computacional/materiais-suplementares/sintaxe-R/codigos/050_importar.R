library(readr)
seguro <- read_csv("dados/insurance.csv", show_col_types = FALSE)
dim(seguro)
spec(seguro)          # tipos detectados
base <- read.csv("dados/insurance.csv")   # R base: data.frame
class(base)
