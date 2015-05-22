#'@export
resourceAquire <- function(q=NULL,limit=1000,offset=0) {
  response <- dataTaipeiGET("datasetMetadataSearch",q,limit,offset)
  dataTaipeiCheck(response)
  
  # qty>=1 means more than one results have been selected and stored to data frame
  # should we create a new process to let user choose which title for further query
  
  qty     <- length(content(response)$result$results)
  q.frame <- data.frame(title=character(),id=character());
  
  for(i in 1:qty){
    title <- content(response)$result$results[[i]]$title;
    id    <- content(response)$result$results[[i]]$id;
    q.frame <- rbind(q.frame, data.frame(title=title, id=id));
  }
  
  # here just pick first selected id for further query
  id <- q.frame[1,2]
  
  urlGetRid <- paste0("http://data.taipei/opendata/datalist/apiAccess?scope=datasetMetadataSearch&q=id:",id)
  response <- httr::GET(urlGetRid)
  dataTaipeiCheck(response)
  
  rid <- content(response)$result$results[[1]]$resources[[1]]$resourceId
  did <- content(response)$result$results[[1]]$resources[[1]]$datasetId
  
  # some resources have datasetId but without resourceId
  if(is.null(rid)){
    rid <- did;
  }
  
  urlAquire <- paste0("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=",rid)
  response <- httr::GET(urlAquire)
  dataTaipeiCheck(response)
  resourceParse(response)
  
}