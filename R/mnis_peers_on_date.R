
#' All peers between two dates
#'
#' Requests data on all peers who were members of the House of Lords on the
#' date specified, (if only \code{date1} is included as a parameter), or on
#' or between the two dates if both \code{date1} and \code{date2} are
#' specified. Either \code{date1} or \code{date2} can be the latter of the
#' two dates.
#' @param date1 The date to return the list of peers from. Defaults to current
#' system date. Accepts character values in \code{'YYYY-MM-DD'} format, and
#' objects of class \code{Date}, \code{POSIXt}, \code{POSIXct}, \code{POSIXlt}
#' or anything else than can be coerced to a date with \code{as.Date()}.
#' @param date2 An optional query parameter. Accepts character values in
#' \code{'YYYY-MM-DD'} format, and objects of class \code{Date}, \code{POSIXt},
#' \code{POSIXct}, \code{POSIXlt} or anything else than can be coerced to a
#' date with \code{as.Date()}. If not \code{NULL}, the function returns a
#' list of all peers in the House of Lords between \code{date1} and
#' \code{date2}. Defaults to \code{NULL}.
#' @inheritParams mnis_additional
#' @return A tibble with information on all peers who were members of the
#' House of Lords on the date specified, (if only \code{date1} is included
#' as a parameter), or on or between the two dates if both \code{date1}
#' and \code{date2} are specified.
#' @export
#' @seealso \code{\link{mnis_party_state}}
#' @seealso \code{\link{mnis_peers_on_date}}
#' @examples \dontrun{
#' x <- mnis_peers_on_date(date1='2017-01-01')
#' }

mnis_peers_on_date <- function(date1 = Sys.Date(), date2 = NULL,
                               tidy = TRUE, tidy_style = "snake_case") {
  q_url <- paste0(base_url, "members/query/House=Lords|Membership=all|lordsmemberbetween=")

  date1 <- as.Date(date1)

  if (is.null(date2) == FALSE) {
    date2 <- as.Date(date2)
  }

  if (is.null(date2) == TRUE) {
    date2 <- date1
  } else if (date1 > date2) {
    date3 <- date1

    date1 <- date2

    date2 <- date3

    rm(date3)
  }

  query <- paste0(q_url, date1, "and", date2, "/")

  got <- get_generic(query)

  lords <- got$Members$Member

  lords <- tibble::as_tibble(lords)

  if (tidy == TRUE) {
    lords <- mnis_tidy(lords, tidy_style)
  }

  lords
}
