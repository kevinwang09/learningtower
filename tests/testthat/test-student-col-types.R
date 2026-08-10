# Define expected column names and types for student data
expected_student_types <- c(
  year        = "integer",
  country     = "factor",
  school_id   = "character",
  student_id  = "integer",
  mother_educ = "factor",
  father_educ = "factor",
  gender      = "factor",
  computer    = "factor",
  internet    = "factor",
  math        = "numeric",
  read        = "numeric",
  science     = "numeric",
  stu_wgt     = "numeric",
  desk        = "factor",
  room        = "factor",
  dishwasher  = "factor",
  television  = "factor",
  computer_n  = "factor",
  car         = "factor",
  book        = "factor",
  wealth      = "numeric",
  escs        = "numeric"
)

expected_student_columns <- names(expected_student_types)

test_that("student_subset_* datasets have correct structure", {
  for (year in c("2000", "2003", "2006", "2009", "2012", "2015", "2018", "2022")) {
    data_name <- paste0("student_subset_", year)
    dataset <- get(data_name)

    # Check column names
    expect_named(dataset,
                 expected_student_columns,
                 info = paste("Column names for", data_name))

    # Check column types
    for (i in seq_along(expected_student_columns)) {
      col_name <- expected_student_columns[i]
      col_val <- dataset[[col_name]]
      col_class <- class(col_val)[1]
      expected_type <- expected_student_types[[col_name]]
      
      if (all(is.na(col_val))) {
        expect_true(col_class %in% c("logical", expected_type),
                    info = paste("All-NA column", col_name, "in", data_name, "should be logical or", expected_type))
      } else if (col_name %in% c("country", "school_id", "student_id")) {
        expect_true(col_class %in% c("character", "factor", "integer"),
                    info = paste("Identifier column", col_name, "in", data_name, "should be character, factor, or integer"))
      } else {
        expect_equal(col_class, expected_type,
                     info = paste("Column", col_name, "in", data_name, "should be", expected_type))
      }
    }
  }
})

test_that("load_student() returns correct structure for full datasets", {
  for (year in c("2000", "2003", "2006", "2009", "2012", "2015", "2018", "2022")) {
    dataset <- load_student(year)
    if (is.null(dataset)) skip(paste("Data for year", year, "could not be downloaded"))

    # Check column names
    expect_named(dataset, expected_student_columns, info = paste("Column names for full dataset of", year))

    # Check column types
    for (i in seq_along(expected_student_columns)) {
      col_name <- expected_student_columns[i]
      col_val <- dataset[[col_name]]
      col_class <- class(col_val)[1]
      expected_type <- expected_student_types[[col_name]]
      
      if (all(is.na(col_val))) {
        expect_true(col_class %in% c("logical", expected_type),
                    info = paste("All-NA column", col_name, "in full dataset of", year, "should be logical or", expected_type))
      } else if (col_name %in% c("country", "school_id", "student_id")) {
        expect_true(col_class %in% c("character", "factor", "integer"),
                    info = paste("Identifier column", col_name, "in full dataset of", year, "should be character, factor, or integer"))
      } else {
        expect_equal(col_class, expected_type,
                     info = paste("Column", col_name, "in full dataset of", year, "should be", expected_type))
      }
    }
  }
})
