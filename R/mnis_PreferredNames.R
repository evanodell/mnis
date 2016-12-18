
#' mnis_PreferredNames
#'
#' Lookup function for the MNIS API. The function requests data in JSON format and parses it to a data frame containing the prefered name of the selected member.
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme. Defaults to TRUE.
#' @param dods_id Request based on the DODS membership ID scheme. Defaults to TRUE.
#' @param pims_id  Request based on the PIMS membership ID scheme. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_PreferredNames(172)
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_PreferredNames <- function(ID = NULL, mem_id = TRUE, dods_id = FALSE, pims_id = FALSE) {
    
    ID <- as.character(ID)
    
    if (dods_id == TRUE) {
        ID_Type <- "dodsid="
    } else if (pims_id == TRUE) {
        ID_Type <- "pimsid="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/id="
    
    query <- paste0(baseurl, ID, "/PreferredNames")
    
    got <- httr::GET(query, httr::accept_json())
    
    got <- httr::content(got, as = "text")
    
    parsed <- jsonlite::fromJSON(got, flatten = TRUE)
    
    x <- as.data.frame(parsed$Members)
    
}
