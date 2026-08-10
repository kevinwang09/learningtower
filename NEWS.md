# learningtower 2.0.0

* **PISA 2022 Dataset Release**: Fully integrated the 2022 OECD PISA survey cycle. The full dataset now contains 3,543,365 student records across 8 triennial cycles (2000–2022), 131,385 schools, and 109 countries/regions.
* **ELT Architecture Migration**: Updated dataset harmonization pipeline in `learningtower_masonry` to follow an ELT ("Transform Late") architecture using centralized long-format schema matrices (`PISA_variable_curation_student.csv` and `PISA_variable_curation_school.csv`).
* **Automated Metadata Extraction & Validation**: Introduced Python-based codebook extraction (LlamaCloud/Pandas) and automated CSV-to-JSON validation (`validate_curation.py`) for reproducible variable mapping.
* **2022 Variable Handling**:
  * `wealth`: Populated as `NA` for 2022 as it was omitted from the survey. `escs` is recommended for socioeconomic status comparisons.
  * `desk` & `dishwasher`: Populated as `NA` for 2022 as these item possessions were not surveyed.
* **Documentation & Vignette Updates**: Updated all package vignettes (`learningtower_student.Rmd`, `learningtower_school.Rmd`, `exploring_time.Rmd`, `Australia_trends.Rmd`), documentation (`?student`, `?school`), and README to reflect the 2000–2022 survey range and include missing values summary figures.

# learningtower 1.1.1

* Gracefully handle internet resource unavailability during `load_student()` by skipping downloads instead of throwing errors to comply with CRAN checks.

# learningtower 1.1.0

* Added 2022 data set.
* Updates to the README and contributor information.
* Added a `NEWS.md` file to track changes to the package.
* `year` column in both the `student` and the `school` datasets are changed from a factor column to an integer column.
* `school_id` column in both the `student` and the `school` datasets are changed from a factor column to a character column.
