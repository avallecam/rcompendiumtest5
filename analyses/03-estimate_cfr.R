
# Package info
#' {incidence2} https://www.reconverse.org/incidence2/
#' {cfr} https://epiverse-trace.github.io/cfr/
#' {epiparameter} https://epiverse-trace.github.io/epiparameter/

# Load packages
library(tidyverse)
library(incidence2)
library(epiparameter)
library(cfr)

# Read data
ebola_dat <- read_rds("data/derived-data/linelist_clean.rds")


# Create outcome time series data for CFR package -------------------------


## Use incidence2 to arrange data ------------------------------------------

#' Compute the incidence of 
#' onset and outcome events
#' grouped by outcome
ebola_outcome <- 
  incidence2::incidence(
    x = ebola_dat,
    date_index = c("date_of_onset","date_of_outcome"),
    groups = "outcome"
  )

ebola_outcome


## Drop unknown outcome counts to estimate CFR -----------------------------

ebola_filter <- 
  
  ebola_outcome %>% 
  
  # keep only the incidence rows with known outcome
  # to avoid censoring bias of denominator
  filter(!is.na(outcome)) %>%
  
  #' keep only [known outcomes]
  #' - date of onset of "deaths" and "recover" events [cases]
  #' - date of outcome of "death" events [deaths]
  #' or
  #' drop only [unknown outcomes]
  #' - date of outcome of "recover" events [not useful for CFR]
  filter(!(outcome == "Recover" & count_variable == "date_of_outcome"))

ebola_filter

# Verify the data output
ebola_filter %>% count(outcome,count_variable)

#' Now all date_of_outcome are only counting "death" events
#' We can remove the "outcome" variable

# Regroup incidence2 object to remove the grouped variable "outcome"
ebola_regroup <- incidence2::regroup(ebola_filter)

ebola_regroup

## Prepare data from incidence2 to CFR input format ------------------------

# Prepare incidence2 to cfr
ebola_prepare <- 
  
  cfr::prepare_data(
    data = ebola_regroup,
    cases_variable = "date_of_onset",
    deaths_variable = "date_of_outcome",
    fill_NA = TRUE
  )

ebola_prepare %>% as_tibble()


# Estimate static CFR -----------------------------------------------------

cfr::estimate_static(data = ebola_prepare)


# Correct static CFR by delays --------------------------------------------


## Get onset to death delay ------------------------------------------------

# Get delay by disease, distribution, and paper authorship
onset_to_death_ebola <- 
  
  epiparameter::epidist_db(
    disease = "Ebola Virus Disease",
    epi_dist = "onset_to_death",
    author = "Barry_etal"
  )

onset_to_death_ebola


# Estimate CFR corrected by delay -----------------------------------------

cfr::estimate_static(
  data = ebola_prepare,
  correct_for_delays = TRUE,
  epidist = onset_to_death_ebola
)
