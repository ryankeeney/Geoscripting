#Lesson 6 Exercise: Vector
#Ryan Keeney
# 5/8/2017

#Load needed libraries.
library(rgdal)
library(rgeos)
library(raster)

#Read shapefiles into R
places <- readOGR("data", "places")
railways <- readOGR("data", "railways")

#Select only the industrial railways.
industrial_railways <- subset(railways, type == "industrial")

#Reproject industrial railways to meter based coordinate system in preperation for buffering.
#The coordinate system is Amersfoort/RD New, the Netherland's national projection
#It's epsg number is 28992
RD_ind_rail <- spTransform(industrial_railways, crs("+init=epsg:28992"))

#Buffer industrial railways by 1000m
buff_RD_ind_rail <- gBuffer(RD_ind_rail, byid = TRUE,
                         width = 1000)