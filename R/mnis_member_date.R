
#' Member status on given date
#'
#' Returns a tibble with a member's status on a given date.
#' @param ID The ID of the member, or a vector with the IDs of multiple MPs.
#' If given multiple IDs, the results are combined into a single tibble.
#' Currently only accepts IDs from the default membership ID scheme. If
#' \code{NULL} the function stops and no data is returned.
#' Defaults to \code{NULL}.
#' @param date Accepts character values in \code{'YYYY-MM-DD'} format, and
#' objects of class \code{Date}, \code{POSIXt}, \code{POSIXct},
#' \code{POSIXlt} or anything else than can be coerced to a date with
#' \code{as.Date()}. Return details on the requested member's status on
#' that date. Defaults to the current system date.
#' @inheritParams mnis_additional
#' @return Returns a tibble with the given member's status on the given date.
#' @export
#' @seealso \code{\link{mnis_mps_on_date}}
#' @examples \dontrun{
#' x <- mnis_member_date(172)
#'
#' y <- mnis_member_date(c(172,500))
#' }

mnis_member_date <- function(ID = NULL, date = Sys.Date(),
                             tidy = TRUE, tidy_style = "snake_case") {

    if (missing(ID)) {
        stop("The ID parameter cannot be NULL, please specify an MP or Peer.")
    }

    date <- as.Date(date)

    if (length(ID) > 1) {

        df <- mnis_mp_date(ID, date)

    } else {

        baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/member/historical/"

        query <- paste0(baseurl, ID, "/", date, "/")

        got <- get_generic(query)

        df <- as.list(got$Member)

        df <- unlist(df)

        df <- t(df)

        df <- tibble::as_tibble(df)

    }

    if (tidy == TRUE) {

        df <- mnis_tidy(df, tidy_style)

    }

    df

}
