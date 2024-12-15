test_that("Merging student and school data works correctly", {
  # Load datasets
  student_data <- load_student(2000)
  data("school", package = "learningtower")

  # Perform merge
  expect_no_warning(
    merged_data <- dplyr::left_join(student_data, school, by = c("year", "school_id", "country"), relationship = "many-to-one")
  )

  # Check that all columns from both datasets are present
  expected_columns <- unique(c(colnames(student_data), colnames(school)))
  expect_named(merged_data, expected_columns,
               info = "All columns from both datasets should be present after merging")

  # Check for no NA values in key columns after merge
  expect_true(all(!is.na(merged_data$school_id)),
              info = "No NA values should be introduced in school_id column after merging")
})


test_that("Merging student and countrycode data works correctly", {
  # Load datasets
  student_data <- load_student(2000)
  data("countrycode", package = "learningtower")

  # Perform merge
  expect_no_warning(
    merged_data <- dplyr::left_join(student_data, countrycode, by = "country", relationship = "many-to-one")
  )

  # Check that all columns from both datasets are present
  expected_columns <- unique(c(colnames(student_data), colnames(countrycode)))
  expect_named(merged_data, expected_columns,
               info = "All columns from both datasets should be present after merging")

  # Check for no NA values in the country column after merge
  expect_true(all(!is.na(merged_data$country)),
              info = "No NA values should be introduced in the country column after merging")
})

test_that("Sequential merging of student, school, and countrycode works", {
  # Load datasets
  student_data <- load_student(2000)
  data("school", package = "learningtower")
  data("countrycode", package = "learningtower")

  # Merge student and school
  expect_no_warning(
    merged_data <- dplyr::left_join(student_data, school, by = c("year", "school_id", "country"), relationship = "many-to-one")
  )

  # Merge with countrycode
  expect_no_warning(
    final_data <- dplyr::left_join(merged_data, countrycode, by = "country", relationship = "many-to-one")
  )

  # Check that all columns from all datasets are present
  expected_columns <- unique(c(colnames(student_data), colnames(school), colnames(countrycode)))
  expect_named(final_data, expected_columns,
               info = "All columns from student, school, and countrycode should be present after merging")

  # Check for no NA values in key columns
  expect_true(all(!is.na(final_data$school_id)),
              info = "No NA values should be introduced in school_id column after merging")
  expect_true(all(!is.na(final_data$country)),
              info = "No NA values should be introduced in the country column after merging")
  expect_true(all(!is.na(final_data$country_name)),
              info = "No NA values should be introduced in the country_name column after merging")
})
