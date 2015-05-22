dataTaipeiGET <- function(scope=NULL,q=NULL,limit=1000,offset=0) {
  url <- "http://data.taipei/opendata/datalist/apiAccess"
  response <- httr::GET(url,query=list(scope=scope,q=q,limit=limit,offset=offset)) 
  dataTaipeiCheck(response)
  response
}

dataTaipeiCheck <- function(response) {
  httr::stop_for_status(response)
}

