#'@export
dataSetMetadataSearch <- function(req) {
  
  qty     <- length(content(req)$result$results)
  q.frame <- data.frame(title=character(),id=character());
  
  for(i in 1:qty){
    title <- content(req)$result$results[[i]]$title;
    id    <- content(req)$result$results[[i]]$id;
    q.frame <- rbind(q.frame, data.frame(title=title, id=id));
  }
  
  # 查詢結果可能會有多筆 dataset，目前先取出處理第一筆(單筆)
  id <- q.frame[1,2]
    
  urlGetRid <- paste0("http://data.taipei/opendata/datalist/apiAccess?scope=datasetMetadataSearch&q=id:",id)
  req <- httr::GET(urlGetRid)
  dataTaipeiCheck(req)
  
  rid <- content(req)$result$results[[1]]$resources[[1]]$resourceId
  did <- content(req)$result$results[[1]]$resources[[1]]$datasetId
  
  if(is.null(rid)){
    rid <- did;
  }
  
  resourceAquire(rid)
  
}