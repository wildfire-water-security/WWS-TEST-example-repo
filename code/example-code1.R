# example code file for learning how to use Git and GitHub

username <- "nussdore"
file <- file.path("C:/Users", username, "Documents/Github/WWS-TEST-example-repo/data/example-csv.csv")
print(file)

#read and edit .csv
  df <- read.csv(file)
  df$value <- sample(1:100, size=4)
  write.csv(df, file, row.names=FALSE)
  library(usethis)
  repo <- file.path(fs::path_home(), "Documents/Github/WWS-TEST-example-repo/")
  usethis::create_project(repo)
g  