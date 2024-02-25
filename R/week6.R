#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(stringi)



#Data Import
citations <- stri_read_lines('../data/citations.txt', encoding = 'latin1')
citations_txt <- stri_subset(citations, regex = '.+')
length(citations) - length(citations_txt)
mean(stri_length(citations_txt))

#Data Cleaning
citations_tbl <- tibble(citations_txt) %>% 
  sample_n(20) %>% View()
citations_tbl <- tibble(line = 1:length(citations_txt), cite = citations_txt)

