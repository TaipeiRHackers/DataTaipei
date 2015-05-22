# DataTaipei
R Client for http://data.taipei/

## 安裝

## 範例

```r
library(DataTaipei)
tb <- dataSetMetadataSearch(limit = 5)
tb # Show the search result
getResources(tb, 1) # Show the resources of the first dataset
rid <- getResources(tb, 1)$resourceId[1]
df <- resourceAquire(rid)
```
