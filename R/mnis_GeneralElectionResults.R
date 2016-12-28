#' mnis_GeneralElectionResults
#'
#' @param locationType The ID of the constituency to return the data for.
#' @param locationName The ID of the election to return the data for. Call 0 to see the latest result.
#' @param startDate Start date of search. In yyyy-mm-dd format.
#' @param endDate End date of search. In yyyy-mm-dd format. Defaults to current date if no date is selected.
#' @return A list with information on the outcome of the most recent election in a constituency
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_GeneralElectionResults(locationType = "Country", locationName = "England",
#'                                  startDate = "2010-01-01", endDate = "2016-01-01")
#'
#' }
#'


mnis_GeneralElectionResults <- function(locationType = NULL, locationName = NULL, startDate = NULL, endDate = NULL) {

  locationType <-  utils::URLencode(locationType)

  locationName <-  utils::URLencode(locationName)

  if(is.null(endDate)==TRUE) {
    endDate <- Sys.Date()
  }

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/GeneralElectionResults/"

  query <- paste0(baseurl, locationType, "/", locationName, "/", startDate, "/", endDate, "/")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

  x <- got$ElectionResults


}
