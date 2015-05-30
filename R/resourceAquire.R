#'@title Download the Resource from \url{http://data.taipei}
#'@param resourceId (character). The id of the resource.
#'@seealso \code{\link{getResources}}
#'@references \url{http://tpeodck.gitbooks.io/data-taipei-developer-guide/content/chapter2section3.html}
#'@return A data.frame. The downloaded table of the resource.
#'@examples
#'\dontrun{
#'rs <- dataSetMetadataSearch(q = "youbike")
#'rid <- getResources(rs, 1)
#'suppressWarnings(df <- resourceAquire(rid$resourceId[1]))
#'}
#'@export
resourceAquire <- function(resourceId) {
  response <- dataTaipeiGET(scope = "resourceAquire", rid = resourceId, limit = NULL, format = "csv")
  dataTaipeiCheck(response)
  resourceParse(response)
  
}
