
# Add in the rallf keys to the NIR data

library(tidyverse)

source("rallf_keys.R",
       local=F)

# read in data
# summarise across multiple observations of a code so there is only one observation per code
# add in the treatment keys associated with the code plot and year. 

read.csv(
  "rallf_nirData_5Apr2023.csv"
) %>% 
  group_by(code) %>% 
  # glimpse()
  summarise(
    across(
      .cols = 4:22,
      .fns = mean
    )) %>% 
  left_join(key3) %>%
  left_join(key2) %>%
  left_join(key1) -> dat
