#'@export
resourceAquire <- function(rid) {
  response <- dataTaipeiGET(scope = "resourceAquire", rid = rid, format = "csv")
  dataTaipeiCheck(response)
  resourceParse(response)
  
}