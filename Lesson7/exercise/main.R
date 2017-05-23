# Exercise 7: Raster-Vector
#Ryan Keeney
#5/27/2017

#Load libraries
library(raster)
library(rgdal)

#Load the MODIS data and boundary data
rawmodis <- brick("data/MOD13A3.A2014001.h18v03.005.grd")
nlMunicip <- getData('GADM',country='NLD', level=2)
nlCountry <- getData('GADM',country='NLD', level=1)

#Project the boundary data to the same projection as the modis data.
pnlMunicip <- spTransform(nlMunicip, CRS(proj4string(rawmodis)))
pnlCountry <- spTransform(nlCountry, CRS(proj4string(rawmodis)))

#Plot raster and boundaries to see how their extents relate
plot(rawmodis, 2)
plot(pnlMunicip, add = TRUE)

#Mask the rawmodis data with the country outline.
nlmodis <- mask(rawmodis, pnlCountry)

plot(nlmodis, 1)

#Why does the data range from >8,000 to -2,000 instead of +1 to-1?

#Q. Find greenest municipality in Janurary?
#Steps:
#1. Find the average pixel value for each municipality.
#2. Find the municipality with the highest average. 


#Q. Find greenest municipality in August?
#Q. Find greenest municipality year average?



