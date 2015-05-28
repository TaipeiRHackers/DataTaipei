#'@title Download the Resource from \url{http://data.taipei}
#'@param resourceId (character). The id of the resource.
#'@seealso \code{\link{getResources}}
#'@references \url{http://tpeodck.gitbooks.io/data-taipei-developer-guide/content/chapter2section3.html}
#'@return A data.frame. The downloaded table of the resource.
#'@examples
#'\dontrun{
#'rs <- dataSetMetadataSearch(q = "youbike")
#'rid <- getResources(rs, 1)
#'suppressWarnings(df <- resourceAquire(rid$resourceId[1]))
#'}
#'@export
resourceAquire <- function(resourceId) {
  print("Which format do you want the resource data be output ?")
  input<-readline("Please give your choice: 1.csv, 2.xml, 3.json (1/2/3) ")
  if(input=="1"){
    format="csv"
  }else if(input=="2"){
    format="xml"
  }else{
    format="json"
  }
  response <- dataTaipeiGET(scope = "resourceAquire", rid = resourceId, format = format)
  dataTaipeiCheck(response)
  resourceParse(response)
}
