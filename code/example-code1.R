# example code file for learning how to use Git and GitHub

file <- file.path("data/example-csv.csv")
print(file)

#read and edit .csv
  df <- read.csv(file)
  df$value <- sample(1:100, size=4)
  write.csv(df, file, row.names=FALSE)
