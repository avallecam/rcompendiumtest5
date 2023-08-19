
#' Install a package
# pak::pak("readxl")
# pak::pak("tidyverse")

#' Load packages
library(readxl)
library(tidyverse)

#' Read raw data
dat <- readxl::read_xlsx("data/raw-data/linelist_20140701.xlsx")

#' Clean raw data
dat_clean <- dat %>% 
  select(case_id,date_of_onset,date_of_outcome,outcome) %>% 
  mutate(across(.cols = c(date_of_onset,date_of_outcome),
                .fns = as.Date)) %>% 
  mutate(outcome = as.factor(outcome))

# Write clean data
dat_clean %>% 
  write_rds("data/derived-data/linelist_clean.rds")
