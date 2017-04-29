#' mnis_peers_on_date
#'
#' @param date The date to return the list of peers from. Defaults to current system date.
#' @param tidy Fix the variable names in the tibble to remove extra characters, superfluous text and convert variable names to snake_case. Defaults to TRUE.
#'
#' @return A tibble with all members of the House of Lords eligible to sit on a given date.
#' @export
#'
#' @examples \dontrun{
#'
#' x <- mnis_peers_on_date()
#'
#' }

mnis_peers_on_date <- function(date=Sys.Date(), tidy=TRUE){

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/lordsmemberbetween="

  query <- paste0(baseurl,date,"and",date,"/")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- mnis::tidy_bom(got)

  got <- jsonlite::fromJSON(got, flatten = TRUE)

  lords <- got$Members$Member

  lords <- tibble::as_tibble(lords)

  if (tidy == TRUE) {

    lords <- mnis::mnis_tidy(lords)

    lords

  } else {

    lords

  }

}

