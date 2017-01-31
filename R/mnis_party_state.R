#' mnis_party_state
#'
#' A data frame with information on the numbers and gender of MPs, by party, for the given date.
#' @param House The house of parliament. Defaults to 'Commons'.
#' @param Date A date in yyyy-mm-dd format. Defaults to the current system date.
#' @param tidy Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @return A data frame with information on the numbers and gender of MPs, by party, by party, for the given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_party_state('2012-01-12')
#'
#' }

mnis_party_state <- function(House = "Commons", Date = Sys.Date(), tidy = TRUE) {
    
    Date <- as.character(Date)
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/HouseOverview/"
    
    query <- paste0(baseurl, House, "/", Date, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$HouseOverview)
    
    if (tidy == TRUE) {
        
        names(x) <- sub("Party.", "", names(x))
        
        names(x) <- sub("X.House", "house", names(x))
        
        names(x) <- sub(".Id", "party_id", names(x))
        
        names(x) <- sub("MaleCount", "male_count", names(x))
        
        names(x) <- sub("FemaleCount", "female_count", names(x))
        
        names(x) <- sub("TotalCount", "total_count", names(x))
        
        names(x) <- tolower(names(x))
        
        x
        
    } else {
        
        x
        
    }
    
}


mnis_PartyState <- function(House = "Commons", Date = Sys.Date()) {
    .Deprecated("mnis_PartyState")
    mnis_party_state(House = House, Date = Date)
}
