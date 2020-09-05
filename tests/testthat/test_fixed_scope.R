

library(mnis)
context("fixed_scope")
test_that("fixed scope functions returns expected format", {
  skip_on_cran()

<<<<<<< HEAD
=======
  # skip_on_cran()

>>>>>>> d69faae026f5de73933256c2acc4b29740d5157c
  xps <- mnis_party_state("2012-01-12")

  expect_length(xps, 5)
  expect_type(xps, "list")
  expect_true(tibble::is_tibble(xps))
<<<<<<< HEAD
  expect_true(nrow(xps) == 14)
=======
  expect_true("Bishops" %in% xps$name)
>>>>>>> d69faae026f5de73933256c2acc4b29740d5157c

  xmd <- mnis_member_date(500)

  expect_length(xmd, 21)
  expect_type(xmd, "list")
  expect_true(tibble::is_tibble(xmd))
  expect_true(nrow(xmd) == 1)

<<<<<<< HEAD
  xger <- mnis_general_election_results(location_type = "Country", location_name = "England", start_date = "2010-01-01", end_date = "2016-01-01")
=======
  xmd2 <- mnis_member_date(c(500, 172))
  expect_length(xmd2, 21)
  expect_type(xmd2, "list")
  expect_true(tibble::is_tibble(xmd2))
  expect_true(nrow(xmd2) == 2)

  xger <- mnis_general_election_results(
    location_type = "Country",
    location_name = "England",
    start_date = "2010-01-01",
    end_date = "2016-01-01"
  )
>>>>>>> d69faae026f5de73933256c2acc4b29740d5157c
  expect_length(xger, 2)
  expect_type(xger, "list")
  expect_true(nrow(xger$election_result) == 2)
  expect_true(tibble::is_tibble(xger$election_result))

  xlt <- mnis_lords_type(date = "2015-01-01")
  expect_length(xlt, 6)
  expect_type(xlt, "list")
  expect_true(tibble::is_tibble(xlt))
  expect_true(nrow(xlt) == 15)

<<<<<<< HEAD
  xmdepart <- mnis_department(department_id = 0, bench = "Government", former = TRUE)
  expect_length(xmdepart, 31)
=======
  xmdepart <- mnis_department(
    department_id = 0, bench = "Government",
    former = TRUE
  )
  expect_length(xmdepart, 32)
>>>>>>> d69faae026f5de73933256c2acc4b29740d5157c
  expect_type(xmdepart, "list")
  expect_true(tibble::is_tibble(xmdepart))
})
