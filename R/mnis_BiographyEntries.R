
#' mnis_BiographyEntries
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme. Defaults to TRUE.
#' @param dods_id Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @param pims_id  Request based on the PIMS membership ID scheme. Defaults to FALSE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_BiographyEntries(172)
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_BiographyEntries <- function(ID = NULL, mem_id = TRUE, dods_id = FALSE, pims_id = FALSE) {

    ID <- as.character(ID)

    if (dods_id == TRUE) {
        ID_Type <- "dodsid="
    } else if (pims_id == TRUE) {
        ID_Type <- "pimsid="
    } else {
        ID_Type <- "id="
    }

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

    query <- paste0(baseurl, ID_Type, ID, "/BiographyEntries")

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))

    x <- t(dl)

    x <- as.data.frame(x)

    x[rownames(x) != "ID", ]

}
