
#' mnis_PreferredNames
#'
#' Lookup function for the MNIS API. The function requests data in JSON format and parses it to a data frame containing the prefered name of the selected member.
#' @param ID The ID number
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_PreferredNames(172)
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_PreferredNames <- function(ID=NULL) {

  ID <- as.character(ID)

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/id="

  query <- paste0(baseurl, ID, "/PreferredNames")

  got <- httr::GET(query, httr::accept_json())

  got <- httr::content(got, as = "text")

  parsed <- jsonlite::fromJSON(got, flatten = TRUE)

  x <- as.data.frame(parsed$Members)

}
