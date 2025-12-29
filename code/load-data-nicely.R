#Examples of loading in data into scripts nicely so anyone can use them 

#example 1: load a csv directly from the web -------- 
  link <- "https://andlter.forestry.oregonstate.edu/data/register/dataaccess.aspx?docid=HF00402_v14.csv"
  web_csv <- read.csv(link)
  
  head(web_csv)
  
#example 2: download a file from the web and read it in from a temporary folder ------- 
  tmp <- tempdir() #gets temporary directory that deletes when R closes
  
  url <- "https://andlter.forestry.oregonstate.edu/data/register/dataaccess.aspx?docid=HF00402_v14.csv"
  download.file(url, destfile=file.path(tmp, "HJ-daily-flow.csv"))
  
  dlwd_csv <- read.csv(file.path(tmp, "HJ-daily-flow.csv"))
  head(dlwd_csv)
  
#example 3: load in data from an R package ------ 
  #load package
  if (!requireNamespace("dataRetrieval", quietly = TRUE)) install.packages("dataRetrieval")
  library(dataRetrieval)

  #get flow data from USGS for Lookout Creek
  site <-  "USGS-14161500"
  pckg_csv <- read_waterdata_daily(monitoring_location_id = site,
                                       parameter_code = "00060", 
                                       time = c("2021-01-01", "2022-01-01"))
  head(pckg_csv)
  
  #make hydrograph plot
  p <- ggplot(pckg_csv, aes(x=time, y=value)) + geom_line()
  
  #save plot
  png("figures/hydrograph.png", res=300, unit="cm", height=13, width=13)
  p
  dev.off()