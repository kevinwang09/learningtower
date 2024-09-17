# This is the code to generate the subset of full student dataset to go into package

library(here)
library(tidyverse)

student_2022 <- readRDS(here("student_full_data/student_2022.rds"))

student_subset_2022 <- student_2022 %>%
  group_by(country_iso3c) %>%  # Group by country
  sample_n(size = 50)          # Randomly sample 50 students from each country

save(student_subset_2022, file = "data/student_subset_2022.rda")
