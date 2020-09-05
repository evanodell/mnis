library(mnis)
context("mnis_mps_on_date")

test_that("mnis_mps_on_date return expected format", {
  skip_on_cran()

  xmpon <- mnis_mps_on_date("2017-04-30")
  expect_length(xmpon, 22)

  expect_type(xmpon, "list")
  expect_true(tibble::is_tibble(xmpon))
  expect_true(nrow(xmpon) == 649)

})
