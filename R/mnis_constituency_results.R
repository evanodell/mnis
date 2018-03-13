#' Constituency election results
#'
#' Returns a list with details of the constituency and a tibble
#'  with election results.
#' @param constituency_id The ID of the constituency to return the data for.
#' If \code{NULL}, no data is returned. Defaults to \code{NULL}.
#' @param election_id The ID of the election to return the data for. Defaults
#' to 0, which returns the result of all elections held in that constituency.
#' @inheritParams mnis_additional
#' @return A list with details of the constituency, labelled \code{'details'}
#' and a tibble with election results, labelled \code{'results'}. The list and
#' tibble are stored in a single object.
#' @export
#' @examples \dontrun{
#' x <- mnis_constituency_results(constituency_id = 3709, election_id = 0)
#' }

mnis_constituency_results <- function(constituency_id = NULL, election_id = 0,
                                      tidy = TRUE, tidy_style = "snake_case") {
  if (missing(constituency_id)) {
    stop("'constituency_id' cannot be NULL", call. = FALSE)
  }

  q_url <- paste0(base_url, "ConstituencyResults/")

  query <- paste0(q_url, constituency_id, "/", election_id, "/")

  got <- get_generic(query)

  details <- got$Constituency$Details

  results <- tibble::as_tibble(got$Constituency$Results)

  df <- list()

  if (tidy == TRUE) {
    df <- constituency_results_tidy(results, details)
  } else {
    df <- c(list(results = results), list(details = details))
  }

  df
}
