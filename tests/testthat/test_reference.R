
library(mnis)
context("reference")
test_that("mnis_reference returns expected format", {

  skip_on_cran()

  refa <- ref_address_types()

  expect_length(refa, 3)
  expect_type(refa, "list")
  expect_is(refa, "data.frame")

  refb <- ref_answering_bodies()
  expect_length(refb, 17)
  expect_type(refb, "list")
  expect_is(refb, "data.frame")

  refc <- ref_areas()
  expect_length(refc, 6)
  expect_type(refc, "list")
  expect_is(refc, "data.frame")

  refd <- ref_area_types()
  expect_length(refd, 2)
  expect_type(refd, "list")
  expect_is(refd, "data.frame")

  refe <- ref_biography_categories()
  expect_length(refe, 5)
  expect_type(refe, "list")
  expect_is(refe, "data.frame")

  reff <- ref_cabinets()
  expect_length(reff, 5)
  expect_type(reff, "list")
  expect_is(reff, "data.frame")

  refg <- ref_committees()
  expect_length(refg, 19)
  expect_type(refg, "list")
  expect_is(refg, "data.frame")

  refh <- ref_committee_types()
  expect_length(refh, 2)
  expect_type(refh, "list")
  expect_is(refh, "data.frame")

  refi <- ref_constituencies()
  expect_length(refi, 20)
  expect_type(refi, "list")
  expect_is(refi, "data.frame")

  refj <- ref_constituency_areas()
  expect_length(refj, 7)
  expect_type(refj, "list")
  expect_is(refj, "data.frame")

  refk <- ref_constituency_types()
  expect_length(refk, 2)
  expect_type(refk, "list")
  expect_is(refk, "data.frame")

  refl <- ref_countries()
  expect_length(refl, 3)
  expect_type(refl, "list")
  expect_is(refl, "data.frame")

  refm <- ref_departments()
  expect_length(refm, 21)
  expect_type(refm, "list")
  expect_is(refm, "data.frame")

  refn <- ref_disqualification_types()
  expect_length(refn, 3)
  expect_type(refn, "list")
  expect_is(refn, "data.frame")

  refo <- ref_elections()
  expect_length(refo, 5)
  expect_type(refo, "list")
  expect_is(refo, "data.frame")

  refp <- ref_election_types()
  expect_length(refp, 2)
  expect_type(refp, "list")
  expect_is(refp, "data.frame")

  refq <- ref_end_reasons()
  expect_length(refq, 5)
  expect_type(refq, "list")
  expect_is(refq, "data.frame")

  refr <- ref_experience_types()
  expect_length(refr, 2)
  expect_type(refr, "list")
  expect_is(refr, "data.frame")

  refs <- ref_government_post_departments()
  expect_length(refs, 5)
  expect_type(refs, "list")
  expect_is(refs, "data.frame")

  reft <- ref_government_posts()
  expect_length(reft, 11)
  expect_type(reft, "list")
  expect_is(reft, "data.frame")

  refu <- ref_government_ranks()
  expect_length(refu, 6)
  expect_type(refu, "list")
  expect_is(refu, "data.frame")

  refv <- ref_honourary_prefixes()
  expect_length(refv, 8)
  expect_type(refv, "list")
  expect_is(refv, "data.frame")

  refw <- ref_honour_lists()
  expect_length(refw, 2)
  expect_type(refw, "list")
  expect_is(refw, "data.frame")

  refx <- ref_honours()
  expect_length(refx, 7)
  expect_type(refx, "list")
  expect_is(refx, "data.frame")

  refy <- ref_interest_categories()
  expect_length(refy, 9)
  expect_type(refy, "list")
  expect_is(refy, "data.frame")

  refz <- ref_lords_membership_types()
  expect_length(refz, 5)
  expect_type(refz, "list")
  expect_is(refz, "data.frame")

  refaa <- ref_lords_ranks()
  expect_length(refaa, 3)
  expect_type(refaa, "list")
  expect_is(refaa, "data.frame")

  refbb <- ref_opposition_post_departments()
  expect_length(refbb, 5)
  expect_type(refbb, "list")
  expect_is(refbb, "data.frame")

  refcc <- ref_opposition_posts()
  expect_length(refcc, 12)
  expect_type(refcc, "list")
  expect_is(refcc, "data.frame")

  refdd <- ref_opposition_ranks()
  expect_length(refdd, 6)
  expect_type(refdd, "list")
  expect_is(refdd, "data.frame")

  refee <- ref_other_parliaments()
  expect_length(refee, 7)
  expect_type(refee, "list")
  expect_is(refee, "data.frame")

  refff <- ref_parliamentary_posts()
  expect_length(refff, 11)
  expect_type(refff, "list")
  expect_is(refff, "data.frame")

  refgg <- ref_parliamentary_ranks()
  expect_length(refgg, 3)
  expect_type(refgg, "list")
  expect_is(refgg, "data.frame")

  refhh <- ref_parliament_types()
  expect_length(refhh, 2)
  expect_type(refhh, "list")
  expect_is(refhh, "data.frame")

  refii <- ref_parties()
  expect_length(refii,16)
  expect_type(refii, "list")
  expect_is(refii, "data.frame")

  refjj <- ref_party_sub_types()
  expect_length(refjj, 5)
  expect_type(refjj, "list")
  expect_is(refjj, "data.frame")

  refkk <- ref_photo_outputs()
  expect_length(refkk, 4)
  expect_type(refkk, "list")
  expect_is(refkk, "data.frame")

  refll <- ref_statuses()
  expect_length(refll, 8)
  expect_type(refll, "list")
  expect_is(refll, "data.frame")

  refmm <- ref_titles()
  expect_length(refmm, 2)
  expect_type(refmm, "list")
  expect_is(refmm, "data.frame")


})
