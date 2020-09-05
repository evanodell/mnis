library(mnis)
context("all_members")


test_that("mnis_all_members returns expected format", {
  skip_on_cran()

<<<<<<< HEAD
  xmnisallmembers <- mnis_all_members(house = "all", party = NULL, tidy = TRUE, tidy_style = "snake_case")
  expect_length(xmnisallmembers, 22)
  expect_type(xmnisallmembers, "list")
  expect_true(tibble::is_tibble(xmnisallmembers))
=======
  # skip_on_cran()

  xmnisallmembers <- mnis_all_members(
    house = "all", party = NULL,
    tidy = TRUE, tidy_style = "snake_case"
  )
  expect_length(xmnisallmembers, 23)
  expect_type(xmnisallmembers, "list")
  # expect_true(tibble::is_tibble(xmnisallmembers))
>>>>>>> d69faae026f5de73933256c2acc4b29740d5157c
})
