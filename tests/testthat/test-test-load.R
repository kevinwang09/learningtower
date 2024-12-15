test_that("load student year can be done using both an integer and a character value", {
  expect_equal(load_student(2000), load_student("2000"))
})


test_that("load multiple years, test is on if the data be be properly binded", {
  expect_no_error(load_student(c("2000", "2003")))
})

test_that("load non-existing years", {
  expect_error(load_student("2001"))
})

test_that("test for load_student class functions",{
  expect_s3_class(object = load_student(year = 2000),
                  class = c("tbl_df", "tbl", "data.frame"))
})
