# example code file for learning how to use Git and GitHub 

#read and edit .csv 
  #df <- read.csv("C:/Users/wampleka/Documents/WWS-Node1-TEST-example-repo/data/example-csv.csv")
  df <- read.csv("data/example-csv.csv")
  df$value <- sample(1:100, size=4)
  write.csv(df, "data/example-csv.csv")  
