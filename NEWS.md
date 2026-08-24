# learningtower 2.0.0

* Hardened `load_student()` with robust `tryCatch` error and timeout handling for remote RDS downloads and parsing to comply with CRAN internet resource policies.
* Added `skip_on_cran()` and `skip_if_offline()` to remote data unit tests.
* Added PISA 2022 dataset support and expanded school datasets.
* Added missing value summary visualizations in `man/figures/`.
* Implemented verified MD5 data transfer pipeline for package dataset management.
* Schema alignment across student and school datasets.

# learningtower 1.1.1

* Gracefully handle internet resource unavailability during `load_student()` by skipping downloads instead of throwing errors to comply with CRAN checks.

# learningtower 1.1.0

* Added 2022 data set. 
* Updates to the README and contributor information. 
* Added a `NEWS.md` file to track changes to the package.
* `year` column in both the `student` and the `school` datasets are changed from a factor column to an integer column. 
* `school_id` column in both the `student` and the `school` datasets are changed from a factor column to a character column. 
