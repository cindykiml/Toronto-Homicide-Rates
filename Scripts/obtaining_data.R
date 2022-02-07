## Name: Cindy Ly
## Date: February 6th, 2022
## Purpose: This script downloads Police Annual Statistics Report - Homicide from Toronto Open Data

install.packages("opendatatoronto")
install.packages("janitor")
library(opendatatoronto)
library(janitor)

# get package from Toronto Open Data
package <- show_package("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")

# get all resources for this package
resources <- list_package_resources("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

write.csv(data, "Inputs/data/raw_data.csv")
