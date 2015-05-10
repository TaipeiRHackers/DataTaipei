#'@title Dataset Metadata Search Test
#'
#'Description of this function
#'
#'@param keyword (character vector). Filter the result by keyword.
#'@return (data.frame) Search result
#'@export
dataSetMetadataSearch <- function(keyword = NULL, filter = character(0), limit = 100L, offset = 0L) {
  # construct url
  url <- paste0(
    "http://data.taipei/opendata/datalist/apiAccess?scope=datasetMetadataSearch&q=", 
    keyword)
  # use the api in DataTaipei.R to return the result
  response <- httr::GET(url)
  result <- httr::content(response, "parsed")
  # make result as table
  data.frame(tag = result[[1]])
}