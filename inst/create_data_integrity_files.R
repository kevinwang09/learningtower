message("This script will check if the intended data files exists and verify those against a json file.")

library(here)
source(here::here("inst/data_integrity_utils.R"))
FULLDATA_PATH <- here::here("full_data")

full_student_data_path <- file.path(FULLDATA_PATH, "student.rds")
full_student_data_hash_path <- here::here("inst/student_hash.json")
handle_hash_file(full_student_data_path, full_student_data_hash_path)

full_school_data_path <- file.path(FULLDATA_PATH, "school.rds")
full_school_data_hash_path <- here::here("inst/school_hash.json")
handle_hash_file(full_school_data_path, full_school_data_hash_path)
