#Ryan Keeney

#Required libraries for package
library(sp)
library(rgdal)
library(rgeos)
library(maptools)
library(plotKML)

#Poly Centroid Example



#Read in the polygon shapefile
parcels <- readOGR("data", "parcels")

#Generate centroid SpatialPoints of the polygon
centroids_temp <- gCentroid(parcels, byid = TRUE)

#Convert the centroid SpatialPoints to a SpatialPointsDataframe
##Spatially join the spatial points to the parcels to create a generic dataframe
centroids_temp2 <- over(centroids_temp, parcels)
##Get the coordinates and projection information of the points.
coords <- data.frame(centroids_temp2$x, centroids_temp2$y)
prj <- CRS("+proj=lcc +lat_1=38.45 +lat_2=39.75 +lat_0=37.83333333333334 +lon_0=-105.5 +x_0=914401.8288999999 +y_0=304800.6096 +datum=NAD83 +units=us-ft +no_defs +ellps=GRS80 +towgs84=0,0,0")
##Create a SpatialPointsDataFrame of the centroids.
centroids <- SpatialPointsDataFrame(coords, data = centroids_temp2, proj4string = prj )


#--------------------------------


sidewalks <- readOGR("data", "sidewalks")















