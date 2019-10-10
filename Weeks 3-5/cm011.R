library("tidyverse")
library("here")
library("readxl")

data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"
file_name <- "GreatestGivers.xls"
  
download.file(url = data_url, destfile = here::here("STAT545","test", file_name))

# here here avoids interface-specific syntax

library(readxl)

philantropists <- read_excel(here::here("STAT545", "test", file_name), trim_ws= TRUE)
# trim_ws = trims white space 
View(philantropists)

# MRI example

mri_file = here::here("STAT545", "test", "Firas-MRI.xlsx")

mri_file

mri <- read_excel(mri_file, range = "A1:L12")
view(mri)


mri <- mri[,-10]


mri %>%
  pivot_longer(cols = `Slice 1`:`Slice 8`,
               names_to = 'sloce_no',
               values_to = 'value')
