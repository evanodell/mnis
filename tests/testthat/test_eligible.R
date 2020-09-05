library(mnis)
context("mnis_eligible")


test_that("mnis_eligible returns expected format", {
<<<<<<< HEAD
  skip_on_cran()
=======


  # skip_on_cran()
>>>>>>> d69faae026f5de73933256c2acc4b29740d5157c

  xmniselig <- mnis_eligible()
  expect_length(xmniselig, 23)
  expect_type(xmniselig, "list")
<<<<<<< HEAD
  expect_true(nrow(xmniselig) == 1455)
  expect_true(tibble::is_tibble(xmniselig))
=======
  # expect_true(nrow(xmniselig)==1455)
  # expect_true(tibble::is_tibble(xmniselig))
>>>>>>> d69faae026f5de73933256c2acc4b29740d5157c
})
