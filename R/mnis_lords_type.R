#' mnis_lords_type
#'
#' Calls the API to return a tibble with details on the number of Lords and their affiliations.
#' @param date A date in yyyy-mm-dd format. The API will return data on the state of the House of Lords on that date. Defaults to the current system date.
#' @param tidy Fix the variable names in the tibble to remove non-alphanumeric characters and superfluous text. Defaults to TRUE.
#' @return A tibble with information on the numbers of different types of Lords on a given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#'
#' x <- mnis_lords_type()
#'
#' }

mnis_lords_type <- function(date = Sys.Date(), tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/LordsByType/"

    query <- paste0(baseurl, date, "/")

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- as.data.frame(got$LordsByType)

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

        x <- tibble::as_tibble(x)

        x

    } else {

      x <- tibble::as_tibble(x)

        x

    }

}

mnis_LordsType <- function(date = Sys.Date(), tidy = TRUE) {
    .Defunct("mnis_LordsType")
    mnis_lords_type(date = date, tidy = tidy)
}
