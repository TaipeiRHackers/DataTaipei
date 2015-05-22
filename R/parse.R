searchParse <- function(...) {
  
}

resourceParse <- function(req) {
  
  # 簡單parse以確認收到的req有抓出資料，可修改下列內容
  ccc <- content(req)
  print(ccc)
  print("resource parsed test ok")
  
}