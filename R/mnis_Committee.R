#' mnis_ConstituencyResults
#'
#' @param committeeID The ID of the committee to return the data for.
#' @param former Flag to include both current and former committee members. Defaults to TRUE.
#' @return A list with information on the outcome of the most recent election in a constituency
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_ConstituencyResults(3701, 19)
#'
#' }
#'


mnis_Committee <- function(committeeID = NULL, former = TRUE) {
    
    if (former == TRUE) {
        former <- "former"
    } else {
        former <- "current"
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/Committee/"
    
    query <- paste0(baseurl, committeeID, "/", former, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    x <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x
    
}
