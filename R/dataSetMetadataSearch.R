#'@param q (character). 
#'@param limit (integer). Limit of returned records.
#'@export
dataSetMetadataSearch <- function(q=NULL,limit=1000,offset=0) {
  response <- dataTaipeiGET("datasetMetadataSearch",q,limit,offset)
  dataTaipeiCheck(response)
  searchParse(response)
}