# This is the code to generate the subset of full student dataset to go into package
library(here)
library(tidyverse)
library(usethis)

FULLDATA_PATH = here::here("student_full_data")
SUBSETDATA_PATH = here::here("data")

years = c(2000, 2003, 2006, 2009, 2012, 2015, 2018, 2022)

sampling_full_data = function(full_data_path){

  stopifnot(file.exists(full_data_path))
  set.seed(2024)
  # Set seed for reproducibility
  full_data <- readRDS(full_data_path)

  subset_data <- full_data %>%
    dplyr::group_by(country) %>%
    dplyr::sample_n(size = 50) %>%
    dplyr::ungroup()

  return(subset_data)
}

for (y in years) {
  this_year_full_data_path = paste0(FULLDATA_PATH, "/student_", y, ".rds")
  this_year_subset_data_name = paste0("student_subset_", y)
  this_year_subset_data_fullname = paste0(SUBSETDATA_PATH, "/", this_year_subset_data_name, ".rda")
  assign(this_year_subset_data_name, sampling_full_data(this_year_full_data_path))

  cat("Saving data for the year: ", y, "\n")
  save(list = this_year_subset_data_name, file = this_year_subset_data_fullname, compress = "xz")
}

