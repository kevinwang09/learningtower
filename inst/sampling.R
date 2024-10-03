# This is the code to generate the subset of full student dataset to go into package
library(here)
library(tidyverse)

FOLDER_PATH = here("student_full_data/")

# List all the full RDS file names
rds_files <- list.files(FOLDER_PATH, pattern = "\\.rds$", full.names = TRUE) %>%
  sort()

# Set seed for reproducibility
set.seed(2024)
for (file in rds_files) {

  year <- basename(file) %>%
    stringr::str_remove("student_") %>%
    stringr::str_remove(".rds")

  student_data <- readRDS(file)

  student_subset <- student_data %>%
    dplyr::group_by(country) %>%
    dplyr::sample_n(size = 50)

  cat("Saving data for the year: ", year, "\n")
  save(student_subset, file = here::here(paste0("data/student_subset_", year, ".rda")))
}
