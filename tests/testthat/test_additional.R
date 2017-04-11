library(mnis)
context("additional")


test_that("mnis_additional returns expected format", {

    skip_on_cran()

    xbdnu <- mnis_basic_details(172)
    expect_length(xbdnu, 33)
    expect_type(xbdnu, list)
    expect_true(tibble::is_tibble(xbdnu))

    xbdnudods <- mnis_basic_details(25790, ref_dods=TRUE)
    expect_length(xbdnudods, 33)
    expect_type(xbdnudods, list)
    expect_true(tibble::is_tibble(xbdnudods))

    xbdncom <- mnis_committees(172)
    expect_length(xbdncom, 66)
    expect_type(xbdncom, list)
    expect_true(tibble::is_tibble(xbdncom))

    xstaff <- mnis_staff(172)
    expect_length(xstaff, 21)
    expect_type(xstaff, list)
    expect_true(tibble::is_tibble(xstaff))



     xfbs <- mnis_full_biog(7)
     expect_length(xfbs, 341)
     expect_type(xfbs, list)
     expect_true(tibble::is_tibble(xfbs))

     #mnis_biography_entries()
    #mnis_addresses()
    #mnis_constituencies()
    #mnis_elections_contested()
    #mnis_experiences()
    #mnis_government_posts()
    #mnis_honours()
    #mnis_house_memberships()
    #mnis_statuses()
    #mnis_interests()
    #mnis_knownas()
    #mnis_maiden_speeches()
    #mnis_opposition_posts()
    #mnis_other_parliaments()
    #mnis_parliamentary_posts()
    #mnis_parties()
    #mnis_preferred_names()

})
