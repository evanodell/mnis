library(mnis)
context("full_biog")


test_that("mnis_full_biog returns expected format", {
  skip_on_cran()

<<<<<<< HEAD
  xfb <- mnis_full_biog(172)
  expect_true(tibble::is_tibble(xfb))
  expect_length(xfb, 393)
  expect_type(xfb, "list")
  expect_true(nrow(xfb) == 1)
=======
  # skip_on_cran()

  xfb <- mnis_full_biog(c(172))
  # expect_true(tibble::is_tibble(xfb))
  # expect_length(xfb, 394)
  expect_type(xfb, "list")
  # expect_true(nrow(xfb)==1)
>>>>>>> d69faae026f5de73933256c2acc4b29740d5157c
})
