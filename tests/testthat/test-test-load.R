test_that("load multiple yeas", {
  load_student(c("2000", "2003"))
})

test_that("load non-existing years", {
  expect_error(load_student("2001"))
})
