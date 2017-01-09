#' mnis_JoinedBetween
#'
#' Function returns all members who took their seats in the house between two given dates. The function requests data in JSON format and parses it to a data frame.
#' @param startDate The start date of the search, in yyyy-mm-dd format. Defaults to '1900-01-01'.
#' @param endDate The end date of the search, in yyyy-mm-dd format. Defaults to the current date.
#' @param house The house to which the member belongs. Accepts one of 'all', 'lords' and 'commons', defaults to 'all'.
#' @param party The party to which a member belongs. Defaults to NULL.
#' @param eligible If the member is currently eligible to sit. Accepts one of 'all', 'current', 'former', defaults to 'all'.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_JoinedBetween('startDate = '2015-01-01', endDate ='2017-01-01',
#'                          house='all', party='labour', eligible='all'')
#'
#' }


mnis_JoinedBetween <- function(startDate = "1900-01-01", endDate = Sys.Date(), house = "all", party = NULL, eligible = "all") {
    
    if (is.na(pmatch(house, c("all", "lords", "commons")))) 
        stop("Please select one of 'all', 'lords' or 'commons' for the parameter 'house'")
    
    if (is.na(pmatch(eligible, c("all", "current", "former")))) 
        stop("Please select one of 'all', 'current' or 'former' for the parameter 'eligible'")
    
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/joinedbetween="
    
    if (is.null(startDate) == TRUE) {
        startDate <- "1900-01-01"
    }
    
    if (is.null(endDate) == TRUE) {
        endDate <- Sys.Date()
    }
    
    startDate <- as.character(startDate)
    
    endDate <- as.character(endDate)
    
    house <- as.character(house)
    
    party <- utils::URLencode(party)
    
    eligible <- as.character(eligible)
    
    if (house == "lords") {
        house <- "|house=lords"
    } else if (house == "commons") {
        house <- "|house=commons"
    } else if (house == "all") {
        house <- "|house=all"
    }
    
    if (is.null(party) == FALSE) {
        party <- paste0("|party*", party)
    }
    
    if (eligible == "all") {
        eligible <- NULL
    } else if (Current == "current") {
        eligible <- "|iseligible=TRUE"
    } else if (Current == "former") {
        eligible <- "|iseligible=FALSE"
    }
    
    query <- paste0(baseurl, startDate, "and", endDate, house, party, eligible)
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    got <- httr::content(got)
    
    x <- do.call(rbind, got$Members$Member)
    
    x <- as.data.frame(x)
    
}


