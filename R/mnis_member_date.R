#' mnis_member_date
#'
#' Returns a data frame with a members status on a given date.
#' @param ID The ID of the member.
#' @param date A date in yyyy-mm-dd format. Defaults to the current system date.
#' @param tidy Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @return Returns a data frame with the given member's status on the given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_member_date(172)
#'
#' }

mnis_member_date <- function(ID = NULL, date = Sys.Date(), tidy = TRUE) {
    
    ID <- as.character(ID)
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/member/historical/"
    
    query <- paste0(baseurl, ID, "/", date, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- sans_bom(got)
    
    got <- jsonlite::fromJSON(got, flatten = TRUE)
    
    x <- as.list(got$Member)
    
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
