
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("The learningtower package provides data from OECD PISA database.
For size reasons only a small subset is provided in the package.
Use the function load_student() to access the full data.")
}
