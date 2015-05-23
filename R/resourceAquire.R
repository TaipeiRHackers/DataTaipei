#'@title resourceAquire
#'@param resourceId which is one column of query result by using getResources(). Please read seealso to get more information.
#'@seealso getResources()
#'@references 2.3 of \url{http://data.taipei/opendata/developer;jsessionid=4197BA531430955C04015CD2F2CF3699}
#'@export
resourceAquire <- function(rid) {
  response <- dataTaipeiGET(scope = "resourceAquire", resourceId = resourceId, format = "csv")
  dataTaipeiCheck(response)
  resourceParse(response)
  
}
