#' mnis_base
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame
#' @param request The request query being made to the MNIS URL
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_base("House=Commons|IsEligible=true/")
#'
#' }

mnis_base <- function(request) {

  baseurl <-"http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

  parsed <- jsonlite::fromJSON(paste0(baseurl,request),flatten = TRUE)

  parsed$Members

  x <- as.data.frame(parsed$Members)

}


