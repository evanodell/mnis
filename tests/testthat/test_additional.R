library(mnis)
context("additional")


test_that("mnis_additional returns expected format", {

    skip_on_cran()

    xbdnu <- mnis_basic_details(172)
    expect_length(xbdnu, 33)
    expect_type(xbdnu, "list")
    expect_true(tibble::is_tibble(xbdnu))

    xbdnudods <- mnis_basic_details(25790, ref_dods=TRUE)
    expect_length(xbdnudods, 33)
    expect_type(xbdnudods, "list")
    expect_true(tibble::is_tibble(xbdnudods))

    xbdncom <- mnis_committees(172)
    expect_length(xbdncom, 66)
    expect_type(xbdncom, "list")
    expect_true(tibble::is_tibble(xbdncom))

    xstaff <- mnis_staff(172)
    expect_length(xstaff, 21)
    expect_type(xstaff, "list")
    expect_true(tibble::is_tibble(xstaff))

    xfbs <- mnis_full_biog(7)
    expect_length(xfbs, 341)
    expect_type(xfbs, "list")
    expect_true(tibble::is_tibble(xfbs))

    xbioe <- mnis_biography_entries(7)
    expect_length(xbioe, 20)
    expect_type(xbioe, "list")
    expect_true(tibble::is_tibble(xbioe))

    xadd <- mnis_addresses(452)
    expect_length(xadd, 30)
    expect_type(xadd, "list")
    expect_true(tibble::is_tibble(xadd))

    xcon <- mnis_constituencies(143)
    expect_length(xcon, 53)
    expect_type(xcon, "list")
    expect_true(tibble::is_tibble(xcon))


    xec <- mnis_elections_contested(7)
    expect_length(xec, 25)
    expect_type(xec, "list")
    expect_true(tibble::is_tibble(xec))

    xexp <- mnis_experiences(3898)
    expect_length(xexp, 61)
    expect_type(xexp, "list")
    expect_true(tibble::is_tibble(xexp))


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
