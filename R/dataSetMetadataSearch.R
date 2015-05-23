#'@param q (character). Keyword of datasets, what you want to know. Please see the details for more information.
#'@param limit (integer). Limit of returned records, if you just need the part of results.
#'q has advanced usage.
#'@details q has advanced usage, such as q=title:youbike cost:free, which will return the result's title contains "youbike" and cost contains "free". Please see the references for more information.
#'@references \url{http://data.taipei/opendata/developer;jsessionid=4197BA531430955C04015CD2F2CF3699}
#'@export
dataSetMetadataSearch <- function(q=NULL,limit=1000,offset=0) {
  response <- dataTaipeiGET("datasetMetadataSearch",q,limit,offset)
  dataTaipeiCheck(response)
  searchParse(response)
}
