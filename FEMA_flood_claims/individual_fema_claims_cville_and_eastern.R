#'Description of file: take csv filter the regions out by year, summaries are not needed
#'By: Jordan House

library(tidyverse)
library(mosaic)

# Define localities of interest
cvillefips <- c("51540", "51003", "51065", "51079", "51109", "51125")
eastfips <- c("51001", "51131")

# Get data
claims <- read_csv("https://www.fema.gov/api/open/v1/FimaNfipClaims.csv")

# Filter to relevant regions, years, and variables
# Filters by county code
cville_individual_claims <- claims %>% 
  filter(countyCode %in% cvillefips)

eastern_individual_claims <- claims %>% 
  filter(countyCode %in% eastfips)

# Save to csv
write_csv(cville_individual_claims, file = "fema_nfip_cville.csv")
write_csv(eastern_individual_claims, file = "fema_nfip_eastern.csv")