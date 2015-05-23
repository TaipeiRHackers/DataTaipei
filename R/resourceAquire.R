#'@title resourceAquire
#'@param resourceId which is one column of query result by using getResources(). Please read seealso to get more information.
#'@seealso getResources()
#'@export
resourceAquire <- function(rid) {
  response <- dataTaipeiGET(scope = "resourceAquire", resourceId = resourceId, format = "csv")
  dataTaipeiCheck(response)
  resourceParse(response)
  
}
