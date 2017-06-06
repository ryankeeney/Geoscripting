#' ConnectPointsToLines
#' For every point, a new line is created connecting it to the closest line.
#' @param centroids Centroids generated from the PolyCentroid function.
#' @param lines A spatiallines dataset or a spatiallinesdataframe.
#' @return "snapped_points" A spatialpointsdataframe of the points on the line
#' nearest to each point.
#' @return "connector_lines" A spatiallinesdata frame. Each line connects the
#' snapped_points to the centroids.



ConnectPointsToLines <- function(centroids, lines){
  #Snap the centroids to the nearest line.
  snapped_points <<- snapPointsToLines(centroids, lines)
  #Create dataframes of point coordinates to be used to create the lines.
  begin_coord <- data.frame(centroids$centroids_temp2.x, centroids$centroids_temp2.y)
  end_coord <- data.frame(snapped_points$X, snapped_points$Y)
  #Change the column headers so they are the same for the beginning and the end
  names(begin_coord) <- c("x", "y")
  names(end_coord) <- c("x", "y")
  #Create spatial lines from the two coordinates dataframes. There is a loop but I don't entirely understand how it works.
  #Credit: https://stackoverflow.com/questions/20531066/convert-begin-and-end-coordinates-into-spatial-lines-in-r
  l <- vector("list", nrow(begin_coord))
  for (i in seq_along(l)) {
    l[[i]] <- Lines(list(Line(rbind(begin_coord[i, ], end_coord[i,]))), as.character(i))
  }
  connector_lines <<- SpatialLines(l)
}




