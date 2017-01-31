#' mnis_lords_type
#'
#' Calls the API to return a data frame with details on the number of Lords and their affiliations.
#' @param date A date in yyyy-mm-dd format. Defaults to the current system date.
#' @param tidy Fix the variable names in the data frame to remove '@' characters and superfluous text. Defaults to TRUE.
#' @return A data frame with information on the numbers of different types of Lords on a given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
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

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$LordsByType)

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

    } else {

        x

    }

}

mnis_LordsType <- function(date = Sys.Date(), tidy = TRUE) {
    .Deprecated("mnis_LordsType")
    mnis_lords_type(date = date, tidy = tidy)
}
