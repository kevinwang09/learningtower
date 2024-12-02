#'@title load_student() function allows the user to extract the PISA student scores for any desired year
#'from 2000-2022
#'
#'@description load_student() function was created to extract the data of student's scores in any
#'years from 2000-2022, the function requires any of the year as it argument or a string "all"
#'that will return all the PISA scores of the students from the years 2000-2022.
#'
#'@param year is the required parameter for the function to display the
#'dataset the user wants to view the PISA scores for the selected year else the entire student
#'data will be available to the user
#'
#'@importFrom dplyr bind_rows
#'@importFrom tibble tibble
#'
#'@return A dataset of PISA scores of students that took the test in the selected year as per user
#'from the years 2000-2018
#'
#'@usage load_student(year = "2000")
#'
#'@examples
#' \dontrun{
#' library(learningtower)
#' student_all <- load_student("all")
#' student_2000 <- load_student("2000")
#' }
#'
#'@export
load_student <- function(year = "2000"){

  year <- as.character(year)
  stopifnot(all(year %in% c("2000", "2003",
                            "2006", "2009",
                            "2012", "2015",
                            "2018", "2022",
                            "all")))

  ## If "all" is in the year vector, we will download everything
  if("all" %in% year){
    year = c("2000", "2003", "2006", "2009", "2012", "2015", "2018", "2022")
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
