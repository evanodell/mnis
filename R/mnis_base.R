#' mnis_base
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param request The request query being made to the MNIS URL
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_base('House=Commons|IsEligible=true/')
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_base <- function(request) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

    #request <-'House=Commons|IsEligible=true/'

    query <- paste0(baseurl, request)

    got <- httr::GET(query, accept_json())

    got <- httr::content(got, as = "text", encoding = "UTF-8")

    parsed <- jsonlite::fromJSON(got, flatten = TRUE)

    parsed$Members

    x <- as.data.frame(parsed$Members)

}


