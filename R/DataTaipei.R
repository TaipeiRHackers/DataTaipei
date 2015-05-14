#'@export
get_url <- function() {
  "http://data.taipei"
}

dataTaipei_GET <- function(path, ...) {
  req <- httr::GET("http://data.taipei/opendata", path = path, auth, ...)
  dataTaipei_check(req)
}

dataTaipei_check <- function(req) {
  httr::stop_for_status(req)
  dataTaipei_parse(req)
}

dataTaipei_parse <- function(req) {
  text <- content(req, as = "text")
  if (identical(text, "")) stop("Not output to parse", call. = FALSE)
  jsonlite::fromJSON(text, simplifyVector = FALSE)
}
