
#' mnis_mps_on_date
#'
#' @param date The date to return the list of mps from. Defaults to current system date.
#' @param tidy Fix the variable names in the tibble to remove extra characters, superfluous text and convert variable names to snake_case. Defaults to TRUE.
#'
#' @return A tibble with all members of the House of Commons eligible to sit on a given date.
#' @export
#'
#' @examples \dontrun{
#'
#' x <- mnis_mps_on_date()
#'
#' }

mnis_mps_on_date <- function(date=Sys.Date(), tidy=TRUE){

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/commonsmemberbetween="

  query <- paste0(baseurl,date,"and",date,"/")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- mnis::tidy_bom(got)

  got <- jsonlite::fromJSON(got, flatten = TRUE)

  mps <- got$Members$Member

  mps <- tibble::as_tibble(mps)

  if (tidy == TRUE) {

    mps <- mnis::mnis_tidy(mps)

    mps

  } else {

    mps

  }

}


