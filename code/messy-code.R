# Messy example R script

library(dplyr)
library(ggplot2)

#Read in data
data <- read.csv("Data/example-csv.csv")

#create new values based on the first value
data$value2 <- data$value - 2
data$value3 <- data$value - 4
data$value3 <- data$value - 10

#plot and save
ggplot(data, aes(x = value, y = value2)) +
  geom_line() + ggtitle("value minus a constant")
ggsave("figures/value_minus_2.png")

ggplot(data, aes(x = value, y = value3)) +
  geom_line() + ggtitle("value minus a constant")
ggsave("figures/value_minus_4.png")

ggplot(data, aes(x = value, y = value3)) +
  geom_line() + ggtitle("value minus a constant")
ggsave("figures/value_minus_10.png")
