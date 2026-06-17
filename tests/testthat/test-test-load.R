test_that("load student year can be done using both an integer and a character value", {
  d1 <- load_student(2000)
  d2 <- load_student("2000")
  if (is.null(d1) || is.null(d2)) skip("Data could not be downloaded")
  expect_equal(d1, d2)
})


test_that("load multiple years, test is on if the data be be properly binded", {
  d <- load_student(c("2000", "2003"))
  if (is.null(d)) skip("Data could not be downloaded")
  expect_true(is.data.frame(d))
})

test_that("load non-existing years", {
  expect_error(load_student("2001"))
})

test_that("test for load_student class functions",{
  d <- load_student(year = 2000)
  if (is.null(d)) skip("Data could not be downloaded")
  expect_s3_class(object = d,
                  class = c("tbl_df", "tbl", "data.frame"))
})
