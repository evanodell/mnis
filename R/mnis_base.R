#' mnis_base
#'
#' Basic function for the MNIS
#' @param request The request query being made to the MNIS URL
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_base("House=Commons|IsEligible=true/")
#'
#' }

mnis_base <- function(request) {

  baseurl <-"http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

  r <- httr::GET(paste0(baseurl,request),accept_json())

  parsed <- jsonlite::fromJSON(content(r, "text"), simplifyVector = FALSE)

}
