
# Package info
#' {incidence2} https://www.reconverse.org/incidence2/
#' {ggplot2} https://ggplot2.tidyverse.org/

# Load packages
library(tidyverse)
library(incidence2)

# Read data
ebola_dat <- read_rds("data/derived-data/linelist_clean.rds")

# Create incidence2 object
ebola_onset <- 
  incidence2::incidence(
    x = ebola_dat,
    date_index = c("date_of_onset")
  )

# Plot incidence data
plot(ebola_onset)

# Write ggplot as figure
ggsave("figures/02-plot_incidence.png",height = 3,width = 5)
