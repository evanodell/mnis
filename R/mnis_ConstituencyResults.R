#' mnis_ConstituencyResults
#'
#' @param constituencyId The ID of the constituency to return the data for.
#' @param electionId The ID of the election to return the data for. Call 0 to see the latest result.
#' @return A list with information on the outcome of the most recent election in a constituency
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_ConstituencyResults(3701, 19)
#'
#' }
#'


### http://data.parliament.uk/membersdataplatform/fixedscope.aspx NEED TO FINISH THE FIX SCOPE APIS

mnis_ConstituencyResults <- function(constituencyId = NULL, electionId = NULL) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ConstituencyResults/"
    
    query <- paste0(baseurl, constituencyId, "/", electionId, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    x <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x
    
}
