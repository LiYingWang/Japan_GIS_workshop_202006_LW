# Create a simple dataframe with lat/long values
df <- data.frame(lon = c(135.412, 135.521, 135.674, 135.911, 135.552, 135.951, 135.821, 135.635, 135.741, 135.475,
                         135.906, 135.801, 135.712, 135.522, 135.498, 135.611, 135.703, 135.741, 135.915, 135.690),
                 lat = c(34.351, 34.382, 34.405, 34.482, 34.355, 34.349, 34.407, 34.883, 34.410, 34.424,
                         34.438, 34.662, 34.762, 34.856, 34.566, 34.923, 34.621, 34.542, 34.824, 34.516),
                 Name= c("A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10",
                         "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10"),
                 Period= c("Kofun", "Kofun", "Kofun", "Kofun", "Kofun", "Kofun", "Kofun", "Kofun", "Kofun", "Kofun",
                           "Yayoi", "Yayoi", "Yayoi", "Yayoi", "Yayoi", "Yayoi", "Yayoi", "Yayoi", "Yayoi", "Yayoi"))

# Convert the dataframe to a spatial object. Note that the
# crs= 4326 parameter assigns a WGS84 coordinate system to the 
# spatial object
sites_example <- st_as_sf(df, coords = c("lon", "lat")) #crs = "+proj=lcc +lat_1=41.03333333333333 +lat_2=40.66666666666666 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs") 

s.sp <- as(sites_example, "Spatial")
class(s.sp)

raster::shapefile(s.sp, "sites_example.shp", overwrite = TRUE)
