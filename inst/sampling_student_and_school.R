# This is the code to generate the subset of full student and school dataset to go into package.
# This sampling is performed due to CRAN's policy on package size.

library(here)
library(dplyr)
library(tibble)

source(here::here("inst/data_integrity_utils.R"))

PKGDATA_PATH = here::here("data")

# Number of years for which the data is available in this package.
YEARS = c(2000, 2003, 2006, 2009, 2012, 2015, 2018, 2022)

full_student_data = readRDS(here::here("student_full_data/student.rds"))
full_school_data = readRDS(here::here("school_full_data/school.rds"))

sampling_student_data = function(full_data_path){

  stopifnot(file.exists(full_data_path))
  set.seed(2024)
  # Set seed for reproducibility
  full_data <- readRDS(full_data_path)

  subset_data <- full_data %>%
    dplyr::group_by(country) %>%
    dplyr::sample_n(size = 30) %>%
    dplyr::ungroup()

  return(subset_data)
}

all_subset_student_data = tibble::tibble()
for (y in YEARS){
  message("Processing student data for the year: ", y, "\n")

  this_year_full_student_data = full_student_data |>
    dplyr::filter(year == y)
  ## Preventing issues with how factor is handle
  stopifnot(nrow(this_year_full_student_data) < nrow(full_student_data))

  message("Saving the full student data for the year: ", y, "\n")
  this_year_full_student_data_path = here::here("student_full_data/student_", y, ".rds")
  saveRDS(object = this_year_full_student_data,
          file = this_year_full_student_data_path,
          compress = "xz")

  message("Saving the subset student data for the year: ", y, "\n")
  this_year_subset_student_data_basename = paste0("student_subset_", y)
  ssd = sampling_student_data(this_year_full_student_data_path)
  all_subset_student_data = dplyr::bind_rows(all_subset_student_data, ssd)
  assign(this_year_subset_student_data_basename,
         ssd)
  save(list = this_year_subset_student_data_basename,
       file = paste0(PKGDATA_PATH, "/", this_year_subset_student_data_basename, ".rda"),
       compress = "xz")
}


school_subset = dplyr::semi_join(
  full_school_data,
  all_subset_student_data,
  by = c("year", "country", "school_id")
)

save(school_subset,
     file = paste0(PKGDATA_PATH, "/school_subset.rda"),
     compress = "xz")
