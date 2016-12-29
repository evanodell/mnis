#' mnis_GeneralElectionResults
#'
#' Returns a list with details of the search parameter and a data frame with election results.
#' @param locationType The type of area to return information for. Accepts 'Country', 'Region', 'County', and 'Constituency'. Defaults to 'Country'.
#' @param locationName The location to return data for. It can be the name of any Country, Region, County or Constituency. Defaults to 'Great Britain'.
#' @param startDate Start date of search. In yyyy-mm-dd format. Defaults to '1900-01-01' if no date is selected.
#' @param endDate End date of search. In yyyy-mm-dd format. Defaults to current date if no date is selected.
#' @return Returns a list with details of the search parameter and a data frame with election results.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_GeneralElectionResults(locationType = 'Country', locationName = 'England',
#'                                  startDate = '2010-01-01', endDate = '2016-01-01')
#' }

mnis_GeneralElectionResults <- function(locationType = NULL, locationName = NULL, startDate = NULL, endDate = NULL) {
    
    if (is.null(locationType) == TRUE) {
        locationType <- "Country"
    }
    
    if (is.null(locationName) == TRUE) {
        locationName <- "Great Britain"
    }
    
    if (is.null(startDate) == TRUE) {
        startDate <- "1900-01-01"
    }
    
    if (is.null(endDate) == TRUE) {
        endDate <- Sys.Date()
    }
    
    locationType <- utils::URLencode(locationType)
    
    locationName <- utils::URLencode(locationName)
    
    startDate <- as.character(startDate)
    
    endDate <- as.character(endDate)
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/GeneralElectionResults/"
    
    query <- paste0(baseurl, locationType, "/", locationName, "/", startDate, "/", endDate, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- got$ElectionResults
    
    names(x$ElectionResult) <- sub("Information.", "", names(x$ElectionResult))
    
    x
    
}
