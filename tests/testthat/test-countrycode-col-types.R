expected_countrycode_columns <- c("country", "country_name")
expected_countrycode_types <- c("character", "character")

test_that("countrycode dataset has correct structure", {
  data("countrycode", package = "learningtower") # Replace with your package name

  # Check column names
  expect_named(countrycode, expected_countrycode_columns, info = "Column names for countrycode dataset")

  # Check column types
  for (i in seq_along(expected_countrycode_columns)) {
    expect_true(class(countrycode[[expected_countrycode_columns[i]]])[1] == expected_countrycode_types[i],
                info = paste("Column", expected_countrycode_columns[i], "in countrycode dataset should be", expected_countrycode_types[i]))
  }
})
