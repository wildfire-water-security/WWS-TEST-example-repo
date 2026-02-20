## script used to demonstrate different methods of working easily with large files 

#load libraries you'll need 
  remotes::install_github("r-box/boxrdrive")
  library(boxrdrive)
  library(terra)
  library(nhdplusTools)
  library(dplyr)
  
# section 1: loading large files from Box ------ 
  #load using Box Drive 
  #boxrdrive locates where your box files live which can be used to load files
    box_drive()
    
  #let's load a dataset directly from Box using boxrdrive
    data <- read.csv(file.path(box_drive(),
                               "Wildfire_Water_Security/02_Nodes/01_Empirical/06_Projects/data-management",
                               "data-management-workshop/example-large-data.csv"))

  #we can also load spatial data 
    dem <- terra::rast(file.path(box_drive(),
                                 "Wildfire_Water_Security/02_Nodes/01_Empirical/06_Projects/data-management",
                                 "data-management-workshop/example-large-raster.tif"))
    plot(dem)
    
# section 2: subsetting the data ------ 
  #getting only the data you need 
    #let's say we only want data for a few stations 
      subdata <- data[data$station_id %in% c("STN_047", "STN_050", "STN_007"),]
  
      write.csv(subdata, "data/example-data-STN-047-050-007.csv", row.names = FALSE)    
      
    #maybe we only need elevation data for the McKenzie basin 
      MK <- nhdplusTools::get_huc(id = "17090004", type="huc08", t_srs =crs(dem)) #get McKenzie basin to clip
      sub_dem <- terra::crop(dem, MK, mask=TRUE) #clip DEM to McKenzie
  
      plot(sub_dem)    
      writeRaster(sub_dem, "data/example-raster-MK.tif") #save
      
    #let's preserve all the stations but save separately 
      dir.create("data/example-dataset") #create folder to store each data file
      
      #create a unique file for each station
      for(x in unique(data$station_id)){
        subdata <- data[data$station_id == x,]
        write.csv(subdata, paste0("data/example-dataset/example-data-",x, ".csv"), row.names=FALSE)
      }
      
      #read back in and merge 
      files <- list.files("data/example-dataset", full.names = TRUE)
      data2 <- lapply(files, read.csv) %>% dplyr::bind_rows()
      
      