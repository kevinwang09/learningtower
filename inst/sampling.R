# This is the code to generate the subset of full student dataset to go into package

library(here)
library(haven)
library(skimr)
library(tidyverse)

# Set seed for reproducibility
set.seed(2024)

## Load full dataset
student_2022 <- readRDS(here("student_full_data/student_2022.rds"))

## Create subset dataset
student_subset_2022 <- student_2022 %>%
  group_by(country) %>%
  sample_n(size = 50)

# Repeat process for previous years
sampling <- function(folder_path) {
  # List all .rds files in the folder
  rds_files <- list.files(folder_path, pattern = "\\.rds$", full.names = TRUE)

  # Initialize an empty list to store the subsets
  dataset_subsets <- list()

  # Loop through each file
  for (file in rds_files) {

    # Get the dataset name from the file path (without extension)
    dataset_name <- gsub(".*/|\\.rds$", "", file)

    # Skip the 2022 dataset to avoid overwriting
    if (dataset_name == "student_2022") {
      next
    }

    # Load the dataset
    student_data <- readRDS(file)

    # Create a subset dataset, sampling 50 students per country
    student_subset <- student_data %>%
      group_by(country) %>%
      sample_n(size = 50)

    # Create the new subset name with the format "student_subset_<year>"
    subset_name <- paste0("student_subset_", sub("student_", "", dataset_name))

    # Assign the subset dataset to the global environment with the new name
    assign(subset_name, student_subset, envir = .GlobalEnv)

    message(paste("Subset created for:", subset_name))
  }
}

sampling(folder_path = here("student_full_data/"))

# Save the dataset file
save(student_subset_2000, file = "data/student_subset_2000.rda")
save(student_subset_2003, file = "data/student_subset_2003.rda")
save(student_subset_2006, file = "data/student_subset_2006.rda")
save(student_subset_2009, file = "data/student_subset_2009.rda")
save(student_subset_2012, file = "data/student_subset_2012.rda")
save(student_subset_2015, file = "data/student_subset_2015.rda")
save(student_subset_2018, file = "data/student_subset_2018.rda")
save(student_subset_2022, file = "data/student_subset_2022.rda")
