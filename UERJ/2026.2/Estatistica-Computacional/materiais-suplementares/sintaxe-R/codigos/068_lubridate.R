library(lubridate)
d <- dmy("23/11/2026")
year(d); month(d, label = TRUE); wday(d, label = TRUE)
d + months(5)
interval(d, dmy("17/04/2027")) / weeks(1)   # semanas do período
