context("youbike")

test_that("check the commands in vignette", {
  rs <- dataSetMetadataSearch(q = "youbike")
  rid <- getResources(rs, 1)
  suppressWarnings(df <- resourceAquire(rid$resourceId[1]))
})
