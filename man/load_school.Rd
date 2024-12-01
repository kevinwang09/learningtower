% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_school.R
\name{load_school}
\alias{load_school}
\title{load_school() function downloads the entire PISA school data}
\usage{
load_school(year="all")
}
\arguments{
\item{year}{School data across all the years are downloaded,
regardless of the input value of "year".}
}
\value{
A dataset containing all PISA school data across all years.
}
\description{
The load_school() function downloads the complete PISA school dataset.
Unlike the load_student() function, this function only allows downloading
the full dataset (all years combined).
}
\examples{
\dontrun{
library(learningtower)
school_data <- load_school()
}

}
