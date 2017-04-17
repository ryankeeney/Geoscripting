
#load the library, get country coses
library(raster)
raster::getData("ISO3")


#Fuction definition
country.adm<- function(a,b) {
  dir.create("Exercise1data",showWarnings = FALSE)
  country<- raster::getData("GADM", country = a, 
                            level=b, path=datdir)
  plot(country)
}

#Call the fuction to map Turkey's 1st level admin boundaries.
country.adm("TUR",1)
