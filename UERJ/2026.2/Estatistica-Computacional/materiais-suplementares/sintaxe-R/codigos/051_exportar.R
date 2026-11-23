dir.create("saida_exemplos", showWarnings = FALSE)
write_csv(head(seguro), "saida_exemplos/seguro_amostra.csv")
writexl::write_xlsx(head(seguro), "saida_exemplos/seguro_amostra.xlsx")
saveRDS(seguro, "saida_exemplos/seguro.rds")     # formato do R
dim(readRDS("saida_exemplos/seguro.rds"))   # lê de volta
list.files("saida_exemplos")
