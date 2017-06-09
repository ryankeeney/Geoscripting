#Example Using Sample Data

#Required libraries for package.
#I've tried to get them installed automatically by using roxygen to edit the 
#NAMESPACE folder but I would always get error. Including them in DESCRIPTION is 
#not sufficient. Therefore they must be installed manually.
library(sp)
library(rgeos)
library(rgdal)
library(maptools)
library(plotKML)

#Read in the sample data
parcels <- readOGR("data", "parcels")
sidewalks <-readOGR("data", "sidewalks")

#Run the PolyCentroids function to generate parcel centroids with the parcel
#attribute data.
centroids <- PolyCentroid(parcels)

#Run ConnectPointsToLines to generate lines connecting the parcel centroids to
#sidewalk lines. 
connector_lines <- ConnectPointsToLines(centroids, sidewalks)

plot(parcels)
plot(sidewalks, add = TRUE)
plot(centroids, add = TRUE)
plot(connector_lines, add = TRUE)

# #Run Integrate Lines to combine the datasets
# connected_lines <- IntegrateLines(sidewalks,connector_lines)


















