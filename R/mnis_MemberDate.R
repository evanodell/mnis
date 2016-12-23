#' mnis_MemberDate
#'
#' @param ID The house of parliament. Defaults to 'Commons'.
#' @param Date A date in yyyy-mm-dd format
#' @return This will return a data frame for the specified member id on the date given - useful for knowing how a member should have been addressed in historical applications.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_MemberDate()
#'
#' }
#'


mnis_MemberDate <- function(ID = NULL, Date = NULL) {
    
    ID <- as.character(ID)
    
    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }
    
    if (is.null(Date) == TRUE) {
        Date <- Sys.Date()
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/member/historical/"
    
    query <- paste0(baseurl, ID, "/", Date, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Member)
    
}
