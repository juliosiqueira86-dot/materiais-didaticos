d <- as.Date("2026-11-23")
d + 30                        # 30 dias depois
format(d, "%d/%m/%Y")
weekdays(d)
as.numeric(as.Date("2027-04-17") - d)   # dias até o fim do período
seq(d, by = "month", length.out = 3)
