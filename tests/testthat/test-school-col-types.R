expected_school_columns <- c(
  "year", "country", "school_id", "public_private", "fund_gov", "fund_fees",
  "fund_donation", "enrol_boys", "enrol_girls", "staff_shortage", "stratio",
  "school_size", "sch_wgt"
)

test_that("school dataset has correct structure", {
  data("school", package = "learningtower")

  # Check column names
  expect_named(school, expected_school_columns, info = "Column names for school dataset")

  # Check column types
  expect_type(school$year, "integer")
  expect_true(is.character(school$country) || is.factor(school$country))
  expect_true(is.character(school$school_id) || is.factor(school$school_id))
  expect_true(is.factor(school$public_private))
  expect_type(school$sch_wgt, "double")
})
