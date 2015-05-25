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

dataTaipeiCheck <- function(response) {
  if(response$status==500){
    print("Warning : Taipei City Government Open Data Plateform replys the system can't deliver service temporarily ,")
    mailR::send.mail(from = "taipeirhacker@gmail.com",
              to = "taipeirhacker@gmail.com", # change to services@mail.taipei.gov.tw when confirmed
              subject = "Taipei Open Data API Connection failed",
              body = "Dear Sir, there is a problem for your reference that Taipei City Open Data API (resourceAquire) didn't work. ",
              smtp = list(host.name = "smtp.gmail.com", port = 465, user.name = "taipeirhacker", passwd = "hacker20150523", ssl = TRUE),
              authenticate = TRUE,
              send = TRUE)  
    print("We have send an email to Taipei City Government to inform the situation , please wait and try again !")
    
  }
  httr::stop_for_status(response)
}

