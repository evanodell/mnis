#' mnis_lords_type
#'
#' Calls the API to return a data frame with details on the number of Lords and their affiliations.
#' @param Date A date in yyyy-mm-dd format. Defaults to the current system date.
#' @return A data frame with information on the numbers of different types of Lords on a given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_lords_type()
#'
#' }

mnis_lords_type <- function(Date = Sys.Date()) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/LordsByType/"
    
    query <- paste0(baseurl, Date, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$LordsByType)
    
    names(x) <- sub("Party.", "", names(x))
    
    names(x) <- sub(".Id", "Id", names(x))
    
    x
    
}

mnis_LordsType <- function(Date = Sys.Date()) {
    .Deprecated("mnis_LordsType")
    mnis_lords_type(Date = Date)
}
