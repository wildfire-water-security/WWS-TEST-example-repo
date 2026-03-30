# Messy example R script

#load in libraries
library(dplyr)
library(ggplot2)

#read in data
data <- read.csv("data/example-csv.csv")

#subtract value by constant
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
