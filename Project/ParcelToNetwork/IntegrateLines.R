#IntegrateLines
# #Failed attempt to split all the lines at their intersections
# line_substring <- function(spgeom, pos1=0, pos2=1) {
# 
#   stopifnot(inherits(spgeom, "SpatialLines") ||
#               inherits(spgeom, "SpatialLinesDataFrame"))
# 
#   val_line <- gProject(spgeom, as(spgeom, "SpatialPoints"), normalized=TRUE)
#   ind <- (val_line >= pos1) & (val_line <= pos2)
# 
#   res <- list(gInterpolate(spgeom, pos1, normalized=TRUE),
#               as(spgeom, "SpatialPoints")[ind, ],
#               gInterpolate(spgeom, pos2, normalized=TRUE))
#   as(do.call(rbind, res), "SpatialLines")
# }
# 
# 
# # list `res` contains the resulting lines
# res <- list()
# for (i in seq_len(length(snapped_points)-1)) {
#   res[[i]] <- line_substring(sidewalks, snapped_points[i], snapped_points[i+1])
# }



