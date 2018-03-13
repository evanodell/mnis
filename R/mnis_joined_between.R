
#' Members who joined between two dates.
#'
#' Function returns all members who took their seats in the house between
#' two given dates.
#' @param start_date The start date of the search, Accepts character values in
#' \code{'YYYY-MM-DD'} format, and objects of class \code{Date},
#' \code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything else than can
#' be coerced to a date with \code{as.Date()}. Defaults to \code{'1900-01-01'}.
#' @param end_date The end date of the search. Accepts character values in
#' \code{'YYYY-MM-DD'} format, and objects of class \code{Date},
#' \code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything else than can be
#' coerced to a date with \code{as.Date()}. Defaults to the current system date.
#' @param house The house to which the member belongs. Accepts one of
#' \code{'all'}, \code{'lords'} and \code{'commons'}. This parameter is
#' not case sensititive. Defaults to \code{'all'}.
#' @param party All members from a given party who joined between the two
#' dates. The party name must be fully spelled out (e.g. \code{'green party'}),
#' the API does not accept searches on this parameter. For a tibble of
#' parties, see \code{ref_parties} in \code{\link{mnis_reference}}.
#' This parameter is not case sensititive. Defaults to \code{NULL}.
#' @param eligible If the member is currently eligible to sit. Accepts
#' one of \code{'all'}, \code{'current'}, \code{'former'}. This parameter
#' is not case sensititive. Defaults to \code{'all'}.
#' @inheritParams mnis_additional
#' @return A tibble with data on all members who joined
#' between the two given dates.
#' @export
#' @examples \dontrun{
#' x <- mnis_joined_between(start_date = '2015-01-01', end_date ='2017-01-01', party='labour')
#' }


mnis_joined_between <- function(start_date = "1900-01-01",
                                end_date = Sys.Date(), house = "all",
                                party = NULL, eligible = "all",
                                tidy = TRUE, tidy_style = "snake_case") {
  house <- tolower(as.character(house)) ## Making sure house works

  if (is.na(pmatch(house, c("all", "lords", "commons")))) {
    stop("Please select one of 'all', 'lords' or 'commons'
             for the parameter 'house'")
  }

  if (is.na(pmatch(eligible, c("all", "current", "former")))) {
    stop("Please select one of 'all', 'current' or 'former'
             for the parameter 'eligible'")
  }

  q_url <- paste0(base_url, "members/query/joinedbetween=")

  start_date <- as.Date(start_date)

  end_date <- as.Date(end_date)

  if (is.null(party) == FALSE) {
    party <- utils::URLencode(tolower(as.character(party)))
  }

  eligible <- tolower(as.character(eligible))

  if (house == "lords") {
    house <- "|house=lords"
  } else if (house == "commons") {
    house <- "|house=commons"
  } else if (house == "all") {
    house <- "|house=all"
  }

  if (is.null(party) == FALSE) {
    party <- paste0("|party*", party)
  }

  if (eligible == "all") {
    eligible <- NULL
  } else if (eligible == "current") {
    eligible <- "|iseligible=TRUE"
  } else if (eligible == "former") {
    eligible <- "|iseligible=FALSE"
  }

  query <- paste0(
    q_url, start_date, "and",
    end_date, house, party, eligible
  )

  got <- get_generic(query)

  df <- tibble::as_tibble(got$Members$Member)

  if (tidy == TRUE) {
    df <- mnis_tidy(df, tidy_style)
  }

  df
}
