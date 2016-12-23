#' mnis_LordsType
#'
#' @param Date A date in yyyy-mm-dd format
#' @return A data frame with information on the numbers of different types of Lords
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_LordsType()
#'
#' }
#'


mnis_LordsType <- function(Date = NULL) {
    
    if (is.null(Date) == TRUE) {
        Date <- Sys.Date()
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/LordsByType/"
    
    query <- paste0(baseurl, Date, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$LordsByType)
    
}
