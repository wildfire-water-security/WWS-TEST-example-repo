#example of script providing details on how a large dataset was subset prior to use for replicability 
  #make dummy dataset [don't touch this section]-------
    site <- sample(paste0("site_", 1:27), size=8000, replace = TRUE)
    analyte <- sample(c("doc", "nitrate", "TKN", "TP", "TN", "phosphate", "TSS"), size=8000, replace=TRUE)
    result <- sample(seq(from=1, to=100, by=0.01), size=8000, replace=TRUE)
    date <- sample(seq(from=as.Date("2000-01-01"), to=as.Date("2025-12-31"), by="day"), size=8000, replace=TRUE)
  
    df <- data.frame(site=site, analyte=analyte, result = result, date=date)
  
  #perform cleaning steps ------ 
    ## FIX THE CODE TO PERFORM THE FOLLOWING SUBSETTING STEPS BEFORE SAVING
    
    #get only nitrate and TKN data 
      df <- df[df$analyte %in% c(),]
      
    #we only want sample collected after 2010 
      df <- df[df$date >= as.Date(2010-01-01),]
      
    #save using the relative path to the example folder 
      name <- ""
      filename <- paste0("subset-vlarge-data-", name, ".csv")
      write.csv(df, )