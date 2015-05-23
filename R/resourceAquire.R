#'@title resourceAquire
#'@param resourceId which is one column of query result by using getResources(). Please read seealso to get more information.
#'@seealso getResources()
#'@references \url{http://tpeodck.gitbooks.io/data-taipei-developer-guide/content/chapter2section3.html}
#'@export
resourceAquire <- function(resourceId) {
  response <- dataTaipeiGET(scope = "resourceAquire", rid = resourceId, format = "csv")
  dataTaipeiCheck(response)
  resourceParse(response)
  
}
