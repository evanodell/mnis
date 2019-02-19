library(mnis)
context("mnis_extra")


test_that("mnis_extra returns expected format", {

  #skip_on_cran()

  xmnise <- mnis_extra(4019)
  expect_type(xmnise, "list")
  expect_equal(names(xmnise), c("addresses",
                                "biography_entries",
                                "committees",
                                "constituencies",
                                "elections_contested",
                                "experiences",
                                "government_posts",
                                "honours",
                                "house_memberships",
                                "interests",
                                "known_as",
                                "maiden_speeches",
                                "opposition_posts",
                                "other_parliaments",
                                "parliamentary_posts",
                                "parties",
                                "preferred_names",
                                "staff",
                                "statuses"))
  #expect_true(nrow(xmnise)==1)
  #expect_true(tibble::is_tibble(xmnise))

})
