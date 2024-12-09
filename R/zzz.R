data_range <- function(){
  return("2000 - 2022")
}

.onAttach <- function(libname, pkgname) {
  m = paste0(
    "The learningtower package (version 1.1.0)",
    " provides data from OECD PISA database between ", data_range(), ".",
    " For package size reasons, only a small subset is provided in the package. Use the function `load_student()` to access the full data.")
  packageStartupMessage(m)
}
