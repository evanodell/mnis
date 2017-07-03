library(mnis)
context("additional")


test_that("mnis_additional returns expected format", {

    skip_on_cran()

    xmnisallmembers <- mnis_all_members(house = 'all', party = NULL, tidy = TRUE, tidy_style="snake_case")


})
