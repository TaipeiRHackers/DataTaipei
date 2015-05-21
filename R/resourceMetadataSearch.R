#'@export
resourceMetadataSearch <- function(q=NULL,limit=1000,offset=0) {
  response <- dataTaipeiGET("resourceMetadataSearch",q,limit,offset)
  dataTaipeiCheck(response)
  response
}