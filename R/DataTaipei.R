#'@export
get_url <- function() {
  "http://data.taipei"
}

query_server <- function(url) {
  response <- httr::GET(url)
  httr::stop_for_status(response)
  result <- httr::content(response)
  # make the result be a data.frame
}

#'@export
print.DataTaipeiResult <- function(x, ...) {
  # implement the print function
}