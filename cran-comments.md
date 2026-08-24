## Test environments

* ubuntu 16.04 (GitHub Actions), R devel
* MacOS (GitHub Actions), R devel
* Windows (GitHub Actions), R devel
* win-builder (devel)

## R CMD check results

There were no ERRORs or WARNINGs.

## Response to CRAN Maintainer Note on Internet Resources

In response to the CRAN policy reminder:
> 'Packages which use Internet resources should fail gracefully with an informative message if the resource is not available or has changed (and not give a check warning nor error).'

We have updated the package with the following safeguards:
* `load_student()` and `download_single_student()` now wrap both `download.file()` and `readRDS()` inside `tryCatch()` with strict timeout limits (`options(timeout = 15)`) and automatic temporary file cleanup.
* When offline, unreachable, or receiving an unexpected HTTP status/payload, functions emit an informative `message()` and return `invisible(NULL)` without throwing check warnings or unhandled R errors.
* Added `testthat::skip_on_cran()` and `testthat::skip_if_offline()` to all unit tests testing remote downloads in accordance with CRAN test policies.
* Merging tests (`test-merge.R`) now use the built-in package dataset (`student_subset_2000`) for fully offline, reproducible test execution.
* Vignettes and package documentation examples fail gracefully without error if remote internet resources cannot be reached.
