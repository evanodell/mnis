#' mnis_all_members
#'
#' @param house The house to which the member belongs. Accepts one of 'all', 'lords' and 'commons', defaults to 'all'.
#' @param party The party to which a member belongs. Defaults to NULL.
#' @param joined_since All members who joined after a given date, in yyyy-mm-dd format.
#' @param tidy Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @keywords mnis
#' @return A data frame with all members of both houses
#' @export
#'
#' @examples \dontrun{
#' x <- mnis_all_members(house = 'all', party = NULL, joined_since = NULL, tidy = TRUE)
#' }
#'

mnis_all_members <- function(house = "all", party = NULL, joined_since = NULL, tidy = TRUE) {
    
    if (is.na(pmatch(house, c("all", "lords", "commons")))) 
        stop("Please select one of 'all', 'lords' or 'commons' for the parameter 'house'")
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/Membership=all"
    
    if (is.null(party) == FALSE) 
        party <- utils::URLencode(party)
    
    if (house == "lords") {
        house <- "|house=lords"
    } else if (house == "commons") {
        house <- "|house=commons"
    } else if (house == "all") {
        house <- ""
    }
    
    if (is.null(party) == FALSE) {
        party <- paste0("|party*", party)
    }
    
    if (is.null(joined_since) == FALSE) {
        joined_since <- paste0("joinedsince=", joined_since)
    }
    
    message("Connecting to API")
    
    query <- paste0(baseurl, house, party, joined_since, "/HouseMemberships/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.list(got$Members$Member)
    
    x <- unlist(x)
    
    x <- t(x)
    
    x <- as.data.frame(x)
    
    if (tidy == TRUE) {
        
        x <- mnis_tidy(x)
        
        x
        
    } else {
        
        x
        
    }
    
}
