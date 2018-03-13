

#' Party standing on a given date
#'
#' Returns data on the numbers and gender of MPs, by party, for the given
#' date, in either the House of Commons or the House of Lords.
#' @param house The house of parliament. Accepts either \code{'Lords'} or
#' \code{'Commons'}. This parameter is not case sensitive, so both
#' \code{'lords'} and \code{'Lords'} return the same result.
#' Defaults to \code{'Commons'}.
#' @param date The date to query party standing on. Accepts character values
#' in \code{'YYYY-MM-DD'} format, and objects of class \code{Date},
#' \code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything else than can
#' be coerced to a date with \code{as.Date()}.
#' Defaults to the current system date.
#' @inheritParams mnis_additional
#' @return A tibble with information on the total numbers and gender of
#' MPs, by party, for the given date and house.
#' @seealso \code{\link{mnis_mps_on_date}}
#' @seealso \code{\link{mnis_peers_on_date}}
#' @export
#' @examples \dontrun{
#' x <- mnis_party_state('2012-01-12')
#' }

mnis_party_state <- function(house = "Commons", date = Sys.Date(),
                             tidy = TRUE, tidy_style = "snake_case") {
  q_url <- paste0(base_url, "houseOverview/")

  house <- utils::URLencode(stringi::stri_trans_totitle(house))

  query <- paste0(q_url, house, "/", date, "/")

  got <- get_generic(query)

  df <- tibble::as_tibble(got$HouseOverview$Party)

  if (tidy == TRUE) {
    df <- mnis_tidy(df, tidy_style)
  }

  df
}
