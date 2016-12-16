
#' mnis_Interests
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param ID The ID number
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_Interests('')
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_Interests <- function(ID=NULL) {

  ID <- as.character(ID)

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/id="

  query <- paste0(baseurl, ID,"/Interests")

  got <- httr::GET(query, httr::accept_json())

  got <- httr::content(got, as = "text")

  parsed <- jsonlite::fromJSON(got, flatten = TRUE)

  x <- as.data.frame(parsed$Members)

}
