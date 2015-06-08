#'@title Download the Resource from \url{http://data.taipei}
#'@param resourceId (character). The id of the resource.
#'@param format (character). the format for downloading the resource content.
#'@seealso \code{\link{getResources}}
#'@references \url{http://tpeodck.gitbooks.io/data-taipei-developer-guide/content/chapter2section3.html}
#'@return A data.frame. The downloaded table of the resource.
#'@examples
#'\dontrun{
#'rs <- dataSetMetadataSearch(q = "youbike")
#'rid <- getResources(rs, 1)
#'suppressWarnings(df <- resourceAquire(rid$resourceId[1],"xml")
#'}
#'@export
resourceAquire <- function(resourceId, format = c("csv", "json", "xml")) {
  response <- dataTaipeiGET(scope = "resourceAquire", rid = resourceId, format = format[1], limit = NULL)
  dataTaipeiCheck(response)
  resourceParse(response)
}
