expected_school_columns <- c(
  "year", "country", "school_id", "fund_gov", "fund_fees", "fund_donation",
  "enrol_boys", "enrol_girls", "stratio", "public_private", "staff_shortage",
  "sch_wgt", "school_size"
)

expected_school_types <- c(
  "integer", "character", "character", "numeric", "numeric", "numeric", "numeric",
  "numeric", "numeric", "factor", "numeric", "numeric", "numeric"
)

test_that("school dataset has correct structure", {
  data("school", package = "learningtower") # Replace with your package name

  # Check column names
  expect_named(school, expected_school_columns, info = "Column names for school dataset")

  # Check column types
  for (i in seq_along(expected_school_columns)) {
    expect_true(class(school[[expected_school_columns[i]]])[1] == expected_school_types[i],
                info = paste("Column", expected_school_columns[i], "in school dataset should be", expected_school_types[i]))
  }
})
