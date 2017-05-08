# Exercise 3
# Ryan Keeney
#5/1/2017

#load raster library
library(raster)

#Decompress the first file. Untar is used instead of unzip due to the file type.
#Looking at the name, it is a Landsat 5 image from September 8th, 1990
untar("data/LT51980241990098-SC20150107121947.tar.gz", exdir = "data/wl5")

#Create a list of all the .tif file names of the wl5 image.
list <- list.files(pattern = glob2rx('*.tif'), path = "data/wl5", full.names = TRUE)

#Create a rasterstack of wl5
wl5 <- stack(list)

# Repeat all the above steps for the landsat 8 image.
# The image is from Janurary 9th, 2014
untar("data/LC81970242014109-SC20141230042441.tar.gz", exdir = "data/wl8")
list <- list.files(pattern = glob2rx('*.tif'), path = "data/wl8", full.names = TRUE)
wl8 <- stack(list)


#Generate and plot the NVDI from the landsat 5 image. 
ndvi_wl5 <- (wl5[[4]] - wl5[[3]]) / (wl5[[4]] + wl5[[3]])
plot(ndvi_wl5)

#Generate and plot the NVDI from the landsat 8 image. 
ndvi_wl8 <- (wl8[[5]] - wl8[[4]]) / (wl8[[5]] + wl8[[4]])
plot(ndvi_wl8)

#Next Steps:
#1: Remove clouds from both.
#2: Crop their extents to where they both overlap. How do you crop images based
#their intersection?
#3: Subtract the 2014 one from the 1990 one and save as a new file. 