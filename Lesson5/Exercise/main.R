# Exercise 3
# Ryan Keeney
#5/15/2017

#load raster library
library(raster)

#Decompress the first file. Untar is used instead of unzip due to the file type.
#Looking at the name, it is a Landsat 5 image from September 8th, 1990
untar("data/LT51980241990098-SC20150107121947.tar.gz", exdir = "data/wl5")

#Load the bands into raster layers
band1 <- raster("data/wl5/LT51980241990098KIS00_sr_band1.tif")
band2 <- raster("data/wl5/LT51980241990098KIS00_sr_band2.tif")
band3 <- raster("data/wl5/LT51980241990098KIS00_sr_band3.tif")
band4 <- raster("data/wl5/LT51980241990098KIS00_sr_band4.tif")
band5 <- raster("data/wl5/LT51980241990098KIS00_sr_band5.tif")
band7 <- raster("data/wl5/LT51980241990098KIS00_sr_band7.tif")

#Create a rasterstack of the raster layers.
wl5_16bit <- stack(band1,band2,band3,band4,band5,band7)

#convert the 16bit raster to 8 bit so it can be displayed with plotRGB
#I found this code at: "http://stackoverflow.com/questions/31953180/rasterlayer-16-bits-into-a-rasterlayer-8-bits"
wl5 <- calc(wl5_16bit, fun=function(x){((x - min(x)) * 255)/(max(x)- min(x)) + 0})

#Display a true color image.
plotRGB(wl5, 3,2,1)


# Repeat all the above steps for the landsat 8 image.
# The image is from Janurary 9th, 2014
untar("data/LC81970242014109-SC20141230042441.tar.gz", exdir = "data/wl8")
band1 <- raster("data/wl8/LC81970242014109LGN00_sr_band1.tif")
band2 <- raster("data/wl8/LC81970242014109LGN00_sr_band2.tif")
band3 <- raster("data/wl8/LC81970242014109LGN00_sr_band3.tif")
band4 <- raster("data/wl8/LC81970242014109LGN00_sr_band4.tif")
band5 <- raster("data/wl8/LC81970242014109LGN00_sr_band5.tif")
wl8_16bit <- stack(band1,band2,band3,band4,band5)
wl8 <- calc(wl8_16bit, fun=function(x){((x - min(x)) * 255)/(max(x)- min(x)) + 0})
plotRGB(wl8, 4,3,2)

#Generate and plot the NVDI from the landsat 5 image. 
ndvi_wl5 <- (wl5[[4]] - wl5[[3]]) / (wl5[[4]] + wl5[[3]])
plot(ndvi_wl5)

#Generate and plot the NVDI from the landsat 8 image. 
ndvi_wl8 <- (wl8[[5]] - wl8[[4]]) / (wl8[[5]] + wl8[[4]])
plot(ndvi_wl8)

# #Load cloud mask for both
# #When looking at the NVDI outputs, it looks like the clouds are already masked.
# #Very obvious in wl8 image. 
# wl5cloud <- raster("data/wl5/LT51980241990098KIS00_cfmask.tif")
# plot(wl5cloud)
# wl8cloud <- raster("data/wl8/LC81970242014109LGN00_cfmask.tif")
# plot(wl8cloud)
# #Apply the cloud mask to the NDVI's
# ndvi_wl5[wl5cloud != 0] <- NA
# ndvi_wl8[wl8cloud != 0] <- NA

#Crop both images to their intersection extent.
intersect1 <- intersect(ndvi_wl5,ndvi_wl8)
e <- extent(intersect1)
ndvi_wl5crop <- crop(ndvi_wl5, e)
ndvi_wl8crop <- crop(ndvi_wl8, e)
plot(ndvi_wl5crop)
plot(ndvi_wl8crop)

#Subtract the cropped NDVI's and plot the result
ndvi_change <- (ndvi_wl5crop - ndvi_wl8crop)
plot(ndvi_change)

#fin

