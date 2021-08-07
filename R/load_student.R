#'@title load_student function allows the user to extract the PISA scores for any desired year
#'from 2000-2018
#'
#'@description load_student function was created to extract the data of student's scores in any
#'years from 2000-2018, the function requires any of the year as it argument or a string "all"
#'that will return the all the PISA scores of the student from 2000-2018.
#'
#'@param year is the required parameter for the function to display the
#'dataset the user wants to view the PISA scores for the selected year else the entire student
#'data will be available to the user
#'
#'@importFrom dplyr bind_rows
#'@importFrom tibble tibble
#'
#'@return A dataset of PISA scores of students that took the test in the selected year as per user
#'from 2000-2018
#'
#'@usage load_student(year = "2000")
#'
#'@examples
#' ##load_student("2000")
#' ##load_student("all")
#' ##load_student(c("2000", "2003"))
#'
#' @examples
#' ## student_full = load_student("all")
#' ## student_subset_2000 = student_full %>%
#' ## dplyr::filter(year = 2000)
#' ## dplyr::group_by(country) %>%
#' ## dplyr::sample_n(50)
#' ## save(student_subset_2000,
#' ## file = "student_subset_2000.rda",
#' ## compress = "xz")
#'
#' #' @examples
#' ## student_full = load_student("all")
#' ## student_subset_2018 = student_full %>%
#' ## dplyr::filter(year = 2018)
#' ## dplyr::group_by(country) %>%
#' ## dplyr::sample_n(50)
#' ## save(student_subset_2018,
#' ## file = "student_subset_2018.rda",
#' ## compress = "xz")
#'
#'@export
load_student <- function(year = "2000"){

  year <- as.character(year)
  stopifnot(all(year %in% c("2000", "2003",
                            "2006", "2009",
                            "2012", "2015",
                            "2018", "all")))

  ## If "all" is in the year vector, we will download everything
  if("all" %in% year){
    year = c("2000", "2003", "2006", "2009", "2012", "2015", "2018")
  }

  result = tibble::tibble()

  for(this_year in year){
    message("Downloading year ", this_year, "...\n")
    this_data = download_single_student(year = this_year)
    result = dplyr::bind_rows(result, this_data)
  }
  return(result)
}

download_single_student <- function(year){
  url_git = base::paste0("https://github.com/kevinwang09/learningtower/raw/master/student_full_data/student_", year, ".rds")
  tmp <- tempfile()
  utils::download.file(url = url_git, destfile = tmp)
  return(base::readRDS(file = tmp))
}
