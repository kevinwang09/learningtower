#'@title student_data function allows the user to extract the PISA scores for any desired year
#'from 2000-2018
#'
#'@description student_data function was created to extract the data of student's scores in any
#'years from 2000-2018, the function requires any of the year as it argument or a string "all"
#'that will return the all the PISA scores of the student from 2000-2018.
#'
#'@param year is the required parameter for the function to display the
#'dataset the user wants to view the PISA scores for the selected year else the entire student
#'data will be available to the user
#'
#'@import dplyr
#'
#'@return A dataset of PISA scores of students that took the test in the selected year as per user
#'from 2000-2018
#'
#'@usage student_data(year)
#'
#'@examples student_data(2018)
#'student_data("all")
#'student_data(2009)
#'
#'@export
student_data <- function(year){


data("student_year_2000")
data("student_year_2003")
data("student_year_2006")
data("student_year_2009")
data("student_year_2012")
data("student_year_2015")
data("student_year_2018")

student_full_data <- dplyr::bind_rows(student_year_2000,
                                      student_year_2003,
                                      student_year_2006,
                                      student_year_2009,
                                      student_year_2012,
                                      student_year_2015,
                                      student_year_2018)


if (x == "all")
{
  return(student_full_data)
}
else if (x == 2000)
{
  student_data_year_2000 <- student_full_data %>%
    dplyr::filter(year == 2000)
  return(student_data_year_2000)
}
else if (x == 2003)
{
  student_data_year_2003 <- student_full_data %>%
    dplyr::filter(year == 2003)
  return(student_data_year_2003)
}
else if (x == 2006)
{
  student_data_year_2006 <- student_full_data %>%
    dplyr::filter(year == 2006)
  return(student_data_year_2006)
}
else if (x == 2009)
{
  student_data_year_2009 <- student_full_data %>%
    dplyr::filter(year == 2009)
  return(student_data_year_2009)
}
else if (x == 2012)
{
  student_data_year_2012 <- student_full_data %>%
    dplyr::filter(year == 2012)
  return(student_data_year_2012)
}
else if (x == 2015)
{
  student_data_year_2015 <- student_full_data %>%
    dplyr::filter(year == 2015)
  return(student_data_year_2015)
}
else if (x == 2018)
{
  student_data_year_2018 <- student_full_data %>%
    dplyr::filter(year == 2018)
  return(student_data_year_2018)
}
else
{
  stop("Sorry! Check if PISA was conducted in the inserted year.")
}
  }
