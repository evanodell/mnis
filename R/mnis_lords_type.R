
#' Peers' party affiliations
#'
#' Calls the API to return a tibble with details on the number of Lords and their party affiliations.
#' @param date Accepts character values in \code{'YYYY-MM-DD'} format, and objects of class \code{Date}, \code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything else than can be coerced to a date with \code{as.Date()}. The API will return data on the state of the House of Lords on that date. Defaults to the current system date.
#' @inheritParams mnis_additional
#' @return A tibble with information on the numbers of different types of Lords on a given date.
#' @export
#' @seealso \code{\link{mnis_reference}}
#' @examples \dontrun{
#' x <- mnis_lords_type()
#' }

mnis_lords_type <- function(date = Sys.Date(), tidy = TRUE, tidy_style = "snake_case") {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/LordsByType/"

    date <- as.Date(date)

    query <- paste0(baseurl, date, "/")

    got <- get_generic(query)

    x <- tibble::as_tibble(got$LordsByType)

    if (tidy == TRUE) {

        x <- mnis_tidy(x, tidy_style)

    }

    x

}
