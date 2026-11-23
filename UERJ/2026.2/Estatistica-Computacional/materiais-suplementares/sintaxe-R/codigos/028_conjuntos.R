x <- c(23, 4, 15, 42, 8, 15, 16)
sort(x); sort(x, decreasing = TRUE)
order(x)                     # posições que ordenam x
rank(x)                      # postos (empates = média)
unique(x); which.max(x); x[which.min(x)]
a <- c("R", "Python", "Excel"); b <- c("Python", "SAS")
union(a, b); intersect(a, b); setdiff(a, b)
"SAS" %in% a
