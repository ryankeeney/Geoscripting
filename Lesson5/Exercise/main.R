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

#Save the w1947 rasterstack as a single .grd file.
#32,768 is just one number above the max value for INT2S
#Therefore INT4S is needed.
writeRaster(x=wl5, filename='data/wl5.grd', datatype='INT4S')

#Save the .grd file as a brick variable
WL5 <- brick('data/wl5.grd')

# Repeat all the above steps for the landsat 8 image.
# The image is from Janurary 9th, 2014
untar("data/LC81970242014109-SC20141230042441.tar.gz", exdir = "data/wl8")
list <- list.files(pattern = glob2rx('*.tif'), path = "data/wl8", full.names = TRUE)
wl8 <- stack(list)
writeRaster(x=wl8, filename='data/wl8.grd', datatype='INT4S')
WL8 <- brick('data/wl8.grd')


#Next Steps:
#1: Remove clouds from both.
#2: Generate NDVI images from both.
#3: Crop their extents to where they both overlap. How do you crop images based
#their intersection?
#4: Subtract the 2014 one from the 1990 one and save as a new file. 