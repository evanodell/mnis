#' mnis_party_state
#'
#' A data frame with information on the numbers and gender of MPs, by party, for the given date.
#' @param house The house of parliament. Defaults to 'Commons'.
#' @param date A date in yyyy-mm-dd format. Defaults to the current system date.
#' @param tidy Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @return A data frame with information on the numbers and gender of MPs, by party, by party, for the given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_party_state('2012-01-12')
#'
#' }

mnis_party_state <- function(house = "Commons", date = Sys.date(), tidy = TRUE) {
    
    date <- as.character(date)
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/houseOverview/"
    
    query <- paste0(baseurl, house, "/", date, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$houseOverview)
    
    if (tidy == TRUE) {
        
        x <- mnis_tidy(x)
        
        x
        
    } else {
        
        x
        
    }
    
}


mnis_PartyState <- function(house = "Commons", date = Sys.date()) {
    .Deprecated("mnis_PartyState")
    mnis_party_state(house = house, date = date)
}
