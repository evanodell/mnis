








library(mnis)
context("reference")
test_that("mnis_reference returns expected format", {

  skip_on_cran()

  refa <- ref_address_types()

  expect_length(refa, 3)
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refb <- ref_answering_bodies()
  expect_length(refb, 15)
  expect_type(refb, "list")
  expect_is(refb, "data.frame")

  refc <- ref_areas()
  expect_length(refc, 6)
  expect_type(refc, "list")
  expect_is(refc, "data.frame")

  refd <- ref_area_types()
  expect_length(refd, 5)
  expect_type(refd, "list")
  expect_is(refd, "data.frame")

  refe <- ref_biography_categories()
  expect_length(refe, 3)##STILL NEED
  expect_type(refe, "list")
  expect_is(refe, "data.frame")

  reff <- ref_cabinets()
  expect_length(reff, 3)##STILL NEED
  expect_type(reff, "list")
  expect_is(reff, "data.frame")

  refg <- ref_committees()
  expect_length(refg, 3)##STILL NEED
  expect_type(refg, "list")
  expect_is(refg, "data.frame")

  refh <- ref_committee_types()
  expect_length(refh, 3)##STILL NEED
  expect_type(refh, "list")
  expect_is(refh, "data.frame")

  refi <- ref_constituencies()
  expect_length(refi, 3)##STILL NEED
  expect_type(refi, "list")
  expect_is(refi, "data.frame")

  refj <- ref_constituency_areas()
  expect_length(refj, 3)##STILL NEED
  expect_type(refj, "list")
  expect_is(refj, "data.frame")

  refk <- ref_constituency_types()
  expect_length(refk, 3)##STILL NEED
  expect_type(refk, "list")
  expect_is(refk, "data.frame")

  refl <- ref_countries()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refm <- ref_departments()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refn <- ref_disqualification_types()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refo <- ref_elections()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refp <- ref_election_types()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refq <- ref_end_reasons()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refr <- ref_experience_types()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refs <- ref_government_post_departments()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  reft <- ref_government_posts()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refu <- ref_government_ranks()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refv <- ref_honourary_prefixes()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refw <- ref_honour_lists()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refx <- ref_honours()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refy <- ref_interest_categories()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refz <- ref_lords_membership_types()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refaa <- ref_lords_ranks()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refbb <- ref_opposition_post_departments()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refcc <- ref_opposition_posts()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refdd <- ref_opposition_ranks()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refee <- ref_other_parliaments()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refff <- ref_parliamentary_posts()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refgg <- ref_parliamentary_ranks()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refhh <- ref_parliament_types()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refii <- ref_parties()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refjj <- ref_party_sub_types()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refkk <- ref_photo_outputs()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refll <- ref_statuses()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refmm <- ref_titles()
  expect_length(refa, 3)##STILL NEED
  expect_type(refa, "list")
  expect_is(refa, "data.frame")


})
