library(ggplot2)
g <- ggplot(mpg, aes(x = displ, y = hwy)) +   # dados + mapeamento
  geom_point(colour = "#3333B2") +            # camada geométrica
  labs(x = "Cilindrada (L)", y = "Consumo (mpg)") +
  theme_gray(base_size = 12)
ggsave("imagens/gg_basico.pdf", g, width = 4.0, height = 2.6)
