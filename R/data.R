#' @title Sample Student data from 2000-2018 PISA OECD data
#'
#' @description A sample dataset containing scores and other information
#' from the triennial testing of 15 year olds around
#' the globe. Original data available from
#'  \url{https://www.oecd.org/pisa/data/}.
#'
#' @format A tibble of the following variables
#' \itemize{
#'     \item \code{year}: Year of the PISA data. Factor.
#'     \item \code{country}: Country 3 character code. Note that some regions/territories are coded as country for ease of input. Factor.
#'     \item \code{school_id}: The school identification number, unique for each country and year combination. Factor.
#'     \item \code{student_id}: The student identification number, unique for each school, country and year combination. Factor.
#'     \item \code{mother_educ}: Highest level of mother's education. Ranges from "less than ISCED1" to "ISCED 3A". Factor.
#'     Note that in 2000, all entries are missing.
#'     \item \code{father_educ}: Highest level of father's education. Ranges from "less than ISCED1" to "ISCED 3A". Factor.
#'     Note that in 2000, all entries are missing.
#'     \item \code{gender}: Gender of the student. Only "male" and "female" are recorded. Factor.
#'     \item \code{computer}: Possession of computer. Only "yes" and "no" are recorded. Factor.
#'     \item \code{internet}: Access to internet. Only "yes" and "no" are recorded. Factor.
#'     \item \code{math}: Simulated score in mathematics. Numeric.
#'     \item \code{read}: Simulated score in reading. Numeric.
#'     \item \code{science}: Simulated score in science. Numeric.
#'     \item \code{stu_wgt}: The final survey weight score for the student score. Numeric.
#'     \item \code{desk}: Possession of desk to study at. Only "yes" and "no" are recorded. Factor.
#'     \item \code{room}: Possession of a room of your own. Only "yes" and "no" are recorded. Factor.
#'     \item \code{dishwasher}: Possession of a dishwasher. Only "yes" and "no" are recorded. Factor.
#'     Note that in 2015 and 2018, all entries are missing.
#'     \item \code{television}: Number of televisions.
#'     "0", "1", "2" are code for no, one and two TVs in the house. "3+" codes for three or more TVs. Factor.
#'     Note that in 2003, all entries are missing.
#'     \item \code{computer_n}: Number of computers.
#'     "0", "1", "2" are code for no, one and two computers in the house. "3+" codes for three or more computers. Factor.
#'     Note that in 2003, all entries are missing.
#'     \item \code{car}: Number of cars.
#'     "0", "1", "2" are code for no, one and two cars in the house. "3+" codes for three or more cars Factor.
#'     Note that in 2003, all entries are missing.
#'     \item \code{book}: Number of books. Factor.
#'     Note that encodings are different in 2000 and 2003 compare to all other years. Factor.
#'     Evalute \code{table(student$book, student$year)} for a demo.
#'     \item \code{wealth}: Family wealth. Numeric.
#'     Note that in 2003, all entries are missing.
#'     \item \code{escs}: Index of economic, social and cultural status. Numeric.
#'     }
#' @docType data
#' @name student_subset_2000
#' @rdname student
#' @importFrom dplyr bind_rows
#' @examples
#' library(dplyr)
#' data(student_subset_2000)
#' data(student_subset_2003)
#' dplyr::bind_rows(
#' student_subset_2000,
#' student_subset_2003
#' )
NULL


#' @docType data
#' @name student_subset_2000
#' @rdname student
NULL

#' @docType data
#' @name student_subset_2003
#' @rdname student
NULL

#' @docType data
#' @name student_subset_2006
#' @rdname student
NULL

#' @docType data
#' @name student_subset_2009
#' @rdname student
NULL

#' @docType data
#' @name student_subset_2012
#' @rdname student
NULL

#' @docType data
#' @name student_subset_2015
#' @rdname student
NULL

#' @docType data
#' @name student_subset_2018
#' @rdname student
NULL

#' School data from 2000-2018 PISA OECD data
#'
#' A dataset containing school weight and other information
#' from the triennial testing of 15 year olds around
#' the globe. Original data available from
#'  \url{https://www.oecd.org/pisa/data/}.
#'
#' @format A tibble of the following variables
#' \itemize{
#'     \item \code{year}: Year of the PISA data. Factor.
#'     \item \code{country_iso3c}: Country 3 character code. Note that some regions/territories are coded as country for ease of input. Factor.
#'     \item \code{school_id}: The school identification number, unique for each country and year combination. Factor.
#'     \item \code{fund_gov}: Percentage of total funding for school year from government. Numeric.
#'     \item \code{fund_fees}: Percentage of total funding for school year from student fees or school charges paid by parents. Numeric.
#'     \item \code{fund_donation}: Percentage of total funding for school year from
#'     benefactors, donations, bequests, sponsorships, parent fundraising. Numeric.
#'     \item \code{enrol_boys}: Number of boys in the school. Numeric.
#'     \item \code{enrol_girls}: Number of girls in the school. Numeric.
#'     \item \code{stratio}: Student-Teacher ratio. Numeric.
#'     \item \code{public_private}: Is the school a public or private school. Factor.
#'     \item \code{staff_shortage}: Shortage of staff. Numeric.
#'     \item \code{sch_wgt}: The final survey weight score for the schools. Numeric.
#'     \item \code{school_size}: The school size. Numeric.
#'     }
#' @docType data
#' @name school
NULL

#' Country iso3c and name mapping for PISA OECD countries [participants](http://www.oecd.org/pisa/aboutpisa/pisa-participants.htm)
#'
#' A dataset containing mapping of the [country ISO code to the country name](https://www.oecd.org/pisa/sitedocument/PISA-2015-Technical-Report-Readers-Guide.pdf).
#'
#'
#' @format A tibble of the following variables
#' \itemize{
#'     \item \code{country}: Country 3 character code. Note that some regions/territories are coded as country for ease of input. Character.
#'     \item \code{country_name}: Country name. Note that some regions/territories are coded as country for ease of input. Character.
#'     }
#' @docType data
#' @name countrycode
NULL

