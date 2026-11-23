g <- ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  geom_smooth(aes(group = 1), method = "lm", se = FALSE,
              colour = "black", linewidth = 0.6) +
  labs(x = "Cilindrada (L)", y = "mpg (estrada)", colour = "Classe") +
  theme_minimal(base_size = 9)
ggsave("imagens/gg_cor.pdf", g, width = 4.8, height = 2.6)
