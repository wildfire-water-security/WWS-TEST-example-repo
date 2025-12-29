# Messy example R script

library(dplyr)
library(ggplot2)

data <- read.csv("C:/Users/Katie/Documents/WWS/Data/example-csv.csv")

data$value2 <- data$value - 2
data$value3 <- data$value - 4
data$value3 <- data$value - 10

ggplot(data, aes(x = value, y = value2)) +
  geom_line() + ggtitle("value minus a constant")
ggsave("C:/Users/Katie/Documents/WWS/figures/value_minus_2.png")

ggplot(data, aes(x = value, y = value3)) +
  geom_line() + ggtitle("value minus a constant")
ggsave("C:/Users/Katie/Documents/WWS/figures/value_minus_4.png")

ggplot(data, aes(x = value, y = value3)) +
  geom_line() + ggtitle("value minus a constant")
ggsave("C:/Users/Katie/Documents/WWS/figures/value_minus_10.png")