dataTaipeiGET <- function(scope=NULL,q=NULL,limit=1000,offset=0,sort=NULL, ...) {
  url <- "http://data.taipei/opendata/datalist/apiAccess"
  if (!is.null(q)) {
    if (Sys.info()["sysname"] %>% tolower == "windows") {
      q <- iconv(q, from = "BIG-5", to = "UTF-8")
    }
  }
  response <- httr::GET(url,query=list(scope=scope,q=q,limit=limit,offset=offset,sort=sort, ...)) 
  dataTaipeiCheck(response)
  response
}

dataTaipeiCheck <- function(response, url) {
  browser()
  if(response$status==500){
    stop(sprintf("
Taipei City Government Open Data Plateform replys the system can't deliver service temporarily.
Please contact services@mail.taipei.gov.tw if you need further support.
The accessed url is: %s
", response$url))
  }
  httr::stop_for_status(response)
}
