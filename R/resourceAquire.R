#'@export
resourceAquire <- function(rid) {

  urlAquire <- paste0("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=",rid)
  response <- httr::GET(urlAquire)
  dataTaipeiCheck(response)
  resourceParse(response)
  
}