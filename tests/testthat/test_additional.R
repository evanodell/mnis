library(mnis)
context("additional")


test_that("mnis_additional returns expected format", {
    
    skip_on_cran()
    
    xbdnu <- mnis_basic_details(172)
    expect_length(xbdnu, 33)
    expect_type(xbdnu, "list")
    expect_is(xbdnu, "data.frame")
    
    
})
