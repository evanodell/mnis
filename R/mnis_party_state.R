#' mnis_party_state
#'
#' A tibble with information on the numbers and gender of MPs, by party, for the given date.
#' @param house The house of parliament. Defaults to 'Commons'.
#' @param date Accepts character values in "YYYY-MM-DD" format, and objects of class Date, POSIXt, POSIXct, POSIXlt or anything else than can be coerced to a date with \code{as.Date()}. Defaults to the current system date.
#' @param tidy Fix the variable names in the tibble to remove special characters and superfluous text, and converts the variable names to snake_case. Defaults to TRUE.
#' @return A tibble with information on the numbers and gender of MPs, by party, by party, for the given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#'
#' x <- mnis_party_state('2012-01-12')
#'
#' }

mnis_party_state <- function(house = "Commons", date = Sys.Date(), tidy = TRUE) {

    date <- as.Date(date)

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/houseOverview/"

    query <- paste0(baseurl, house, "/", date, "/")

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$HouseOverview)

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

        names(x)[names(x) == "x_house"] <- "house"

        x

    } else {

        x

    }

}
