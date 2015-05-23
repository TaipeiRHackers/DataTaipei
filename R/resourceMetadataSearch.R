#'@title resourceMetadataSearch
#'@param q (character). Keyword of datasets. Read the details for more information.
#'@param limit (integer). Limit quanty of returned records to set a proper scale of data output.
#'@param offset (integer). The start position to show of query output.  read the details for more information.
#'@details This is the example of q advanced usage. Such as q="title:youbike cost:free", which will return the result's title contains "youbike" and cost contains "free". The method is "condition-1 condition-2 ...", which uses one blank space to separate each condition, and you can input one or more conditions to query.
#'
#'Please read the references for more information.
#'   
#'   This is the example of offset usage. Such as offset = 5, which will return the 1 + 5 = 6th dataset. 
#'   
#'   Please read the references for more information.
#'@references \url{http://tpeodck.gitbooks.io/data-taipei-developer-guide/content/chapter2section2.html}
#'@export
resourceMetadataSearch <- function(q=NULL,limit=1000,offset=0) {
  response <- dataTaipeiGET("resourceMetadataSearch",q,limit,offset)
  dataTaipeiCheck(response)
  searchParse(response)
}
