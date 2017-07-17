library(jsonlite)
library(xml2)
library(googlesheets)

# read data from a json file
jsonlite::fromJSON('mtcars.json')

# read xml data 
xm <- xmlParse("sample_xml")
class(xm)
xmlRoot(xm)
c_child <- xmlChildren(xm)
c_child[[1]]
c_child[[1]][1]
xmlAttrs("Computer", c_child[[1]][1])

sapply(c_child[[1]][1], names)
sapply(c_child[[1]][1], xmlValue)

getNodeSet(xm, "//book")
getNodeSet(xm, "//author")


j <- xmlToDataFrame(
  getNodeSet(xm, "//book")
)

# read xml data from the web
# cd <- read_xml("http://www.xmlfiles.com/examples/cd_catalog.xml")


# read html data
xml2::read_html("http://had.co.nz")

# googlesheets
# step 1: authentication and authorization (gs_auth())
# list goolge sheets
mysheets <- gs_ls()
mysheets %>% glimpse()

# practice sheets
gs_gap() %>%
  gs_copy(to = "Gapminder")
gs_ls('Gapminder')

# register sheet
gap <- gs_title('Gapminder')
gap

# get worksheet names
gs_ws_ls(gap)

# read data in one worksheet
oceania <- gap %>%
  gs_read(ws = "Oceania")

# read certain cells
gap %>% gs_read(ws = 2, range = "A1:D8")
