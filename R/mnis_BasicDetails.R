
#' mnis_BasicDetails
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param ID The ID number
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_BasicDetails(172)
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_BasicDetails <- function(ID=NULL) {

  ID<-as.character(ID)

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/id="

  query <- paste0(baseurl, ID, "/BasicDetails")

  got <- httr::GET(query, httr::accept_json())

  got <- httr::content(got, as = "text")

  parsed <- jsonlite::fromJSON(got, flatten = TRUE)

  #x <- as.data.frame(parsed)

}


