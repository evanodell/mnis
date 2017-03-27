#' mnis_joined_between
#'
#' Function returns all members who took their seats in the house between two given dates. The function requests data in JSON format and parses it to a data frame. The
#' @param start_date The start date of the search, in yyyy-mm-dd format. Defaults to '1900-01-01'.
#' @param end_date The end date of the search, in yyyy-mm-dd format. Defaults to the current date.
#' @param house The house to which the member belongs. Accepts one of 'all', 'lords' and 'commons', defaults to 'all'.
#' @param party The party to which a member belongs. Defaults to NULL.
#' @param eligible If the member is currently eligible to sit. Accepts one of 'all', 'current', 'former', defaults to 'all'.
#' @param tidy Fix the variable names in the data frame to remove '@' characters and superfluous text. Defaults to FALSE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_joined_between(start_date = '2015-01-01', end_date ='2017-01-01',
#'                          house='all', party='labour', eligible='all')
#'
#' }


mnis_joined_between <- function(start_date = "1900-01-01", end_date = Sys.Date(), house = "all", party = NULL, eligible = "all", 
    tidy = TRUE) {
    
    if (is.na(pmatch(house, c("all", "lords", "commons")))) 
        stop("Please select one of 'all', 'lords' or 'commons' for the parameter 'house'")
    
    if (is.na(pmatch(eligible, c("all", "current", "former")))) 
        stop("Please select one of 'all', 'current' or 'former' for the parameter 'eligible'")
    
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/joinedbetween="
    
    if (is.null(start_date) == TRUE) {
        start_date <- "1900-01-01"
    }
    
    if (is.null(end_date) == TRUE) {
        end_date <- Sys.Date()
    }
    
    start_date <- as.character(start_date)
    
    end_date <- as.character(end_date)
    
    house <- as.character(house)
    
    if (is.null(party) == FALSE) 
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
    } else if (eligible == "current") {
        eligible <- "|iseligible=TRUE"
    } else if (eligible == "former") {
        eligible <- "|iseligible=FALSE"
    }
    
    query <- paste0(baseurl, start_date, "and", end_date, house, party, eligible)
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got)
    
    if (tidy == TRUE) {
        
        x <- mnis_tidy(x)
        
        x
        
        x
        
    }
    
    x
    
}

mnis_JoinedBetween <- function(start_date = "1900-01-01", end_date = Sys.Date(), house = "all", party = NULL, eligible = "all", 
    tidy = TRUE) {
    .Deprecated("mnis_JoinedBetween")  #include a package argument, too
    mnis_joined_between(start_date = start_date, end_date = end_date, house = house, party = party, eligible = eligible, 
        tidy = tidy)
}

