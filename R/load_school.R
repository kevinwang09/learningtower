#' @title load_school() function downloads the entire PISA school data
#'
#' @description The load_school() function downloads the complete PISA school dataset.
#' Unlike the load_student() function, this function only allows downloading
#' the full dataset (all years combined).
#'
#' @param year School data across all the years are downloaded,
#' regardless of the input value of "year".
#'
#' @importFrom dplyr bind_rows
#' @importFrom tibble tibble
#'
#' @return A dataset containing all PISA school data across all years.
#'
#' @usage load_school(year="all")
#'
#' @examples
#' \dontrun{
#' library(learningtower)
#' school_data <- load_school()
#' }
#'
#' @export
load_school <- function(year = "all") {
  # Restrict the function to only support "all"
  if (year != "all"){
    warning("The whole school data will always be downloaded")
  }

  url_git <- base::paste0("https://github.com/kevinwang09/learningtower/raw/master/full_data/school.rds")
  tmp <- tempfile()
  utils::download.file(url = url_git, destfile = tmp, quiet = TRUE)
  return(base::readRDS(file = tmp))
}
