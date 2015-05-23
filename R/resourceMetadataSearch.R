#'@title Search Resource of \url{http://data.taipei} via Metadata
#'@param q (character). Keyword of the datasets. Please read the details for more information.
#'@param limit (integer). Limit the number of returned records.
#'@param offset (integer). The start position of the returned records.  Please read the details for more information.
#'@details 
#'  You could directly put the keyword into \code{q}. For example, \code{dataSetMetadataSearch(q = "youbike")}. 
#'  \code{q} also accept advanced usage such as \code{q="title:youbike cost:free"} which will return the records whose title contains "youbike" and cost contains "free". The schema is "field-1:condition-1 field-2:condition-2 ...". The blank space separates each condition. For more details, please check the reference.
#'
#'  For {offset}, here is an example. If \code{offset = 5}, the \code{dataSetMetadataSearch} will return the \code{1 + 5 = 6}th row. 
#'   
#'@return A data.table. A table of related resources.
#'@seealso \code{\link{getResources}}
#'@references \url{http://tpeodck.gitbooks.io/data-taipei-developer-guide/content/chapter2section2.html}
#'@example
#'\dontrun{
#'rs <- dataSetMetadataSearch(q = "youbike")
#'rid <- getResources(rs, 1)
#'suppressWarnings(df <- resourceAquire(rid$resourceId[1]))
#'}
#'@export
resourceMetadataSearch <- function(q=NULL,limit=1000,offset=0) {
  response <- dataTaipeiGET("resourceMetadataSearch",q,limit,offset)
  dataTaipeiCheck(response)
  searchParse(response)
}
