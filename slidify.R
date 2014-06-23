# library(devtools)
# install_github('slidify', 'ramnathv')
# install_github('slidifyLibraries', 'ramnathv')

library(slidify)

# author("first_deck")

slidify("index.Rmd")
browseURL("index.html")

publish_github("DevelopingDataProductsCourseProject", "snaga")

