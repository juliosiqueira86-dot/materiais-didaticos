g <- ggplot(seguro, aes(age, charges, colour = smoker)) +
  geom_point(size = 0.6, alpha = 0.6) +
  facet_wrap(~ region, nrow = 1) +
  scale_colour_manual(values = c(no = "#3333B2", yes = "#F9423A")) +
  labs(x = "Idade", y = "Custo (US$)", colour = "Fumante") +
  theme_bw(base_size = 8)
ggsave("imagens/gg_facet.pdf", g, width = 6.6, height = 2.4)
