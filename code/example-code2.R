# example code file for learning how to use Git and GitHub

#make a dummy figure
  library(ggplot2)
  data <- read.csv("data/example-csv.csv")
  data$X <- c(rep("Group 1", 4), rep("Group 2", 4))
  ggplot(data, aes(x=site, y=value)) + geom_point() + geom_line()

  ggsave("figures/figure1.png")
