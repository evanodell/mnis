library(mnis)
context("additional")


test_that("mnis_additional returns expected format", {

    skip_on_cran()

    xbdnu <- mnis_basic_details(172)
    expect_length(xbdnu, 33)
    expect_type(xbdnu, "list")
    expect_is(xbdnu, "data.frame")

    xbdnudods <- mnis_basic_details(25790, ref_dods=TRUE)
    expect_length(xbdnudods, 33)
    expect_type(xbdnudods, "list")
    expect_is(xbdnudods, "data.frame")

    xbdncom <- mnis_committees(172)
    expect_length(xbdncom, 66)
    expect_type(xbdncom, "list")
    expect_is(xbdncom, "data.frame")

    xstaff <- mnis_staff(172)
    expect_length(xstaff, 21)
    expect_type(xstaff, "list")
    expect_is(xstaff, "data.frame")

})
