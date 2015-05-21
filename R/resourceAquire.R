#'@export
resourceAquire <- function(rid) {
  
  urlAquire <- paste0("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=",rid)
  
  req <- httr::GET(urlAquire)
  
  dataTaipeiCheck(req)
  
  resourceParse(req)
  
}