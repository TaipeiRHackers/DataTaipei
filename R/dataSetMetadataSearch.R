#'@title dataSetMetadataSearch
#'@param q (character). Keyword of datasets. see the details for more information.
#'@param limit (integer). Limit quanty of returned records to set a proper scale of data output.
#'@param offset (integer). the start position to show of query output.  see the details for more information.
#'@details This is the example of q advanced usage. Such as q=title:youbike cost:free, which will return the result's title contains "youbike" and cost contains "free". The method is "condition-1 condition-2 ...", which uses one blank space to separate each condition, and you can input two and more conditions to query. Please see the references for more information.
#'   
#'   This is the example of offset usage. Such as offset = 5, which will return the 1 + 5 = 6th dataset. Please see the references for more information.
#'@references \url{http://tpeodck.gitbooks.io/data-taipei-developer-guide/content/chapter2section1.html}
#'@export
dataSetMetadataSearch <- function(q=NULL,limit=1000,offset=0) {
  response <- dataTaipeiGET("datasetMetadataSearch",q,limit,offset)
  dataTaipeiCheck(response)
  searchParse(response)
}
