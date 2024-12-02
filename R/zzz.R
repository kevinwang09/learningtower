
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("The learningtower package provides data from OECD PISA database.
For package size reasons, only a small subset is provided in the package.
Use the function `load_student()` and `load_school()` to access the full data.")
}
