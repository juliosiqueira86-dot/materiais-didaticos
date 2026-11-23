g1 <- ggplot(seguro, aes(charges)) +
  geom_histogram(bins = 30, fill = "#3333B2", colour = "white") +
  labs(x = "Custo", y = "Frequência") + theme_minimal(base_size = 10)
g2 <- ggplot(seguro, aes(smoker, charges)) +
  geom_boxplot(fill = "#C9C9E8") +
  labs(x = "Fumante", y = "Custo") + theme_minimal(base_size = 10)
g3 <- ggplot(seguro, aes(region)) + geom_bar(fill = "#3333B2") +
  labs(x = "Região", y = "n") + theme_minimal(base_size = 10) +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
ggsave("imagens/gg_hist.pdf", g1, width = 2.3, height = 2.2)
ggsave("imagens/gg_box.pdf", g2, width = 2.3, height = 2.2)
ggsave("imagens/gg_bar.pdf", g3, width = 2.3, height = 2.2)
