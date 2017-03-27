#' mnis_Base
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame. All URLs, paths and parameters are user-defined.
#' @param request The request query being made to the MNIS URL
#' @param tidy Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_Base('House=Commons|IsEligible=true/')
#'
#' }

mnis_base <- function(request, tidy = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, request)
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    got <- httr::content(got)
    
    x <- do.call(rbind, got$Members$Member)
    
    if (tidy == TRUE) {
        
        x <- mnis_tidy(x)
        
        x
        
    } else {
        
        x
        
    }
    
}


mnis_Base <- function(request, tidy = TRUE) {
    .Deprecated("mnis_Base")
    mnis_base(request = request, tidy = tidy)
}
