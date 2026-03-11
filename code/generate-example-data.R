#code used to generate example data (dataframe)
  library(boxrdrive)

  output_file <- file.path(box_drive(), 
                           "Wildfire_Water_Security/02_Nodes/01_Empirical/06_Projects",
                           "data-management/data-management-workshop/",
                           "example-large-data.csv")
  
  #create dummy stations
  stations <- data.frame(
    station_id = paste0("STN_", sprintf("%03d", 1:50)),
    latitude = runif(50, 35.0, 45.0),
    longitude = runif(50, -120.0, -80.0),
    stringsAsFactors = FALSE
  )
  
  # Function to generate one batch
  generate_batch <- function(n, start_id) {
    
    station_idx <- sample(1:nrow(stations), n, replace = TRUE)
    base_time <- as.POSIXct("2020-01-01 00:00:00", tz = "UTC")
    
    data.frame(
      record_id = start_id + seq_len(n),
      station_id = stations$station_id[station_idx],
      sample_datetime = base_time + runif(n, 0, 365*24*3600*3),  # 3 years range
      latitude = round(stations$latitude[station_idx] + rnorm(n, 0, 0.001), 6),
      longitude = round(stations$longitude[station_idx] + rnorm(n, 0, 0.001), 6),
      
      water_temp_c = round(rnorm(n, mean = 15, sd = 5), 2),            # °C
      ph = round(rnorm(n, mean = 7.5, sd = 0.3), 2),                   # pH
      dissolved_oxygen_mg_l = round(rnorm(n, mean = 8, sd = 1.5), 2),  # mg/L
      turbidity_ntu = round(abs(rnorm(n, mean = 5, sd = 3)), 2),       # NTU
      conductivity_us_cm = round(rnorm(n, mean = 400, sd = 50), 1),    # µS/cm
      nitrate_mg_l = round(abs(rnorm(n, mean = 2, sd = 1)), 3),        # mg/L
      phosphate_mg_l = round(abs(rnorm(n, mean = 0.1, sd = 0.05)), 3), # mg/L
      chlorophyll_ug_l = round(abs(rnorm(n, mean = 10, sd = 5)), 2),   # µg/L
      
      stringsAsFactors = FALSE
    )
  }
  
  df <- generate_batch(1000000, 0)
  
  write.csv(df, output_file, row.names = FALSE)
  
  
#another example file, a raster 
  library(elevatr)
  library(usmap)
  library(terra)
  
  OR <- us_map(include="OR")
  large_rast <- get_elev_raster(OR, z=9)
  large_rast <- rast(large_rast)
  output_file <- file.path(box_drive(), 
                           "Wildfire_Water_Security/02_Nodes/01_Empirical/06_Projects",
                           "data-management/data-management-workshop/",
                           "example-large-raster.tif")
  
  writeRaster(large_rast2, output_file, overwrite =TRUE)
  