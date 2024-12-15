# Define expected column names and types for student data
expected_student_columns <- c(
  "year", "country", "school_id", "student_id", "mother_educ", "father_educ",
  "gender", "computer", "internet", "math", "read", "science", "stu_wgt",
  "desk", "room", "dishwasher", "television", "computer_n", "car", "book",
  "wealth", "escs"
)

expected_student_types <- c(
  "integer", "factor", "character", "integer", "factor", "factor", "factor",
  "factor", "factor", "numeric", "numeric", "numeric", "numeric", "factor",
  "factor", "factor", "factor", "factor", "factor", "factor", "numeric",
  "numeric"
)

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
      expect_true(class(dataset[[expected_student_columns[i]]])[1] == expected_student_types[i],
                  info = paste("Column", expected_student_columns[i], "in", data_name, "should be", expected_student_types[i]))
    }
  }
})

test_that("load_student() returns correct structure for full datasets", {
  for (year in c("2000", "2003", "2006", "2009", "2012", "2015", "2018", "2022")) {
    dataset <- load_student(year)

    # Check column names
    expect_named(dataset, expected_student_columns, info = paste("Column names for full dataset of", year))

    # Check column types
    for (i in seq_along(expected_student_columns)) {
      expect_true(class(dataset[[expected_student_columns[i]]])[1] == expected_student_types[i],
                  info = paste("Column", expected_student_columns[i], "in full dataset of", year, "should be", expected_student_types[i]))
    }
  }
})
