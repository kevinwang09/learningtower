# This is the code to generate the subset of full student dataset to go into package

library(here)
library(haven)
library(skimr)
library(tidyverse)

# Set seed for reproducibility
set.seed(2024)

# Load full dataset
student_2022 <- readRDS(here("student_full_data/student_2022.rds"))

# Create subset dataset
student_subset_2022 <- student_2022 %>%
  group_by(country) %>%  # Group by country
  sample_n(size = 50)    # Randomly sample 50 students from each country

# Save the dataset file
save(student_subset_2022, file = "data/student_subset_2022.rda")
