expected_student_columns <- c(
  "year", "country", "school_id", "student_id", "mother_educ", "father_educ",
  "gender", "computer", "internet", "math", "read", "science", "stu_wgt",
  "desk", "room", "dishwasher", "television", "computer_n", "car", "book",
  "wealth", "escs"
)

test_that("student_subset_* datasets have correct structure", {
  for (year in c("2000", "2003", "2006", "2009", "2012", "2015", "2018", "2022")) {
    data_name <- paste0("student_subset_", year)
    dataset <- get(data_name)

    # Check column names
    expect_named(dataset,
                 expected_student_columns,
                 info = paste("Column names for", data_name))

    # Check key column types
    expect_type(dataset$year, "integer")
    expect_true(is.character(dataset$school_id) || is.factor(dataset$school_id))
    expect_true(is.character(dataset$student_id) || is.numeric(dataset$student_id))
    expect_type(dataset$math, "double")
    expect_type(dataset$read, "double")
    expect_type(dataset$science, "double")
    expect_type(dataset$stu_wgt, "double")
  }
})

test_that("load_student() returns correct structure for full datasets", {
  for (year in c("2000", "2003", "2006", "2009", "2012", "2015", "2018", "2022")) {
    dataset <- load_student(year)
    if (is.null(dataset)) skip(paste("Data for year", year, "could not be downloaded"))

    # Check column names
    expect_named(dataset, expected_student_columns, info = paste("Column names for full dataset of", year))

    # Check key column types
    expect_type(dataset$year, "integer")
    expect_true(is.character(dataset$school_id) || is.factor(dataset$school_id))
    expect_type(dataset$math, "double")
    expect_type(dataset$read, "double")
    expect_type(dataset$science, "double")
    expect_type(dataset$stu_wgt, "double")
  }
})
