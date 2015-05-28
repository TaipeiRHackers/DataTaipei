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
    print("Email the error message to Taipei City Government?")
    input<-readline("Please give your choice: Y or N ")
    if(input=="Y"){
      if(!require("mailR")){
        print("Please install package 'mailR' first")
      }else{
        account<-readline("Please give your Gmail account name :")
        pwd<-readline("Please give your Gmail password :")
        dataTaipeiEmail(account,pwd)
      }
    }
    stop("Connection to Taipei City Government Open Data Plateform failed, please try again.")
  }
}

dataTaipeiEmail <- function(account=NULL,pwd=NULL){
  mailR::send.mail(from = paste0(account,"@gmail.com"),
            to = "taipeirhacker@gmail.com", # change to services@mail.taipei.gov.tw when confirmed
            subject = "Taipei Open Data API Connection failed",
            body = "Dear Sir, there is a problem for your reference that Taipei City Open Data API (resourceAquire) didn't work. ",
            smtp = list(host.name = "smtp.gmail.com", port = 465, user.name = account, passwd = pwd , ssl = TRUE),
            authenticate = TRUE,
            send = TRUE)
  print("the email has sent !")
}

