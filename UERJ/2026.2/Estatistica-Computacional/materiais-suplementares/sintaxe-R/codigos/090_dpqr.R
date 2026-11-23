dbinom(3, size = 10, prob = 0.2)     # P(X = 3)
pbinom(3, size = 10, prob = 0.2)     # P(X <= 3)
qnorm(0.975)                         # quantil
pnorm(1.96) - pnorm(-1.96)           # P(-1,96 < Z < 1,96)
ppois(2, lambda = 4, lower.tail = FALSE)   # P(X > 2)
