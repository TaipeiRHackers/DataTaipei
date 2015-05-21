dataTaipeiGET <- function(scope=NULL,q=NULL,limit=1000,offset=0) {
  
  # 輸入查詢範例 dataTaipeiGET("datasetMetadataSearch","youbike")
  
  url <- "http://data.taipei/opendata/datalist/apiAccess"
  
  req <- httr::GET(url,query=list(scope=scope,q=q,offset=offset,limit=limit)) 
  dataTaipeiCheck(req)
  
  if(scope=="datasetMetadataSearch"){
    dataSetMetadataSearch(req)
  }else{
    resourceMetadataSearch(req)
  }
}

dataTaipeiCheck <- function(req) {
  httr::stop_for_status(req)
}

