#' PolyCentroid
#'
#' Take a spatialpolygonsdataframe object and generate a spatialpointsdataframe
#' of their spatial centers. Preserve the attributes of the parcels in each
#' point.
#' @param A spatialpolygonsdataframe.
#' @return A spatialpointsdataframe of the centerspoints of the polygons.
#' @export



PolyCentroid <- function(polygon){
  #Generate centroids from the polygons as spatialpoints
  centroids_temp <- gCentroid(polygon, byid =TRUE)
  #Create a dataframe of the attributes of the polygons spatially joined with
  # the locational info of the centroids that overlap them.
  centroids_temp2 <- over(centroids_temp, polygon)
  #Get coordinates from the centroids_temp2 dataframe
  coords <- data.frame(centroids_temp2$x, centroids_temp2$y)
  #Get the coordinate reference system from the polygons
  coordrefsys <- getCRS(polygon)
  prj <- CRS(coordrefsys)
  #Using the previously obtained info, generate a final spatialpointsdataframe
  #from the centroids_temp2 dataframe.
  centroids <- SpatialPointsDataFrame(coords, data = centroids_temp2,
                                      proj4string = prj )
  return(centroids)
}




