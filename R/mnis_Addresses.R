
#' mnis_Addresses
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param ID The ID number
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_Addresses(172)
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_Addresses <- function(ID=NULL) {

  ID <- as.character(ID)

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/id="

  parsed <- jsonlite::fromJSON(paste0(baseurl, ID, "/Addresses"), flatten = TRUE)

  x <- as.data.frame(parsed$Members)

}
