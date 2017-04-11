#' mnis_member_date
#'
#' Returns a tibble with a members status on a given date.
#' @param ID The ID of the member. Currently this only accepts IDs from the default membership ID scheme. If empty, the function stops and no data is returned.
#' @param date A date in yyyy-mm-dd format, on which to return details on the requested member's status. Defaults to the current system date.
#' @param tidy Fix the variable names in the tibble to remove special characters and superfluous text, and converts the variable names to snake_case. Defaults to TRUE.
#' @return Returns a tibble with the given member's status on the given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_member_date(172)
#'
#' }

mnis_member_date <- function(ID = NULL, date = Sys.Date(), tidy = TRUE) {
    
    if (missing(ID)) {
        stop("The ID parameter cannot be empty, please specify a Member of Parliament or a Peer.")
    }
    
    ID <- as.character(ID)
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/member/historical/"
    
    query <- paste0(baseurl, ID, "/", date, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- tidy_bom(got)
    
    got <- jsonlite::fromJSON(got, flatten = TRUE)
    
    x <- as.list(got$Member)
    
    x <- unlist(x)
    
    x <- t(x)
    
    x <- tibble::as_tibble(x)
    
    if (tidy == TRUE) {
        
        x <- mnis_tidy(x)
        
        x
        
    } else {
        
        x
        
    }
    
}
