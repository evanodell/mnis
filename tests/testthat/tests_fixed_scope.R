

library(mnis)
context("fixed_scope")
test_that("fixed scope functions returns expected format", {


  xps <- mnis_party_state('2012-01-12')

  expect_length(xps, 5)
  expect_type(xps, "list")
  expect_true(tibble::is_tibble(xps))
  expect_true(nrow(xps)==14)

  xmd <- mnis_member_date(500)

  expect_length(xmd, 21)
  expect_type(xmd, "list")
  expect_true(tibble::is_tibble(xmd))
  expect_true(nrow(xmd)==1)

})
