#' mnis_Base
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param request The request query being made to the MNIS URL
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_Base('House=Commons|IsEligible=true/')
#'
#' }

mnis_Base <- function(request) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

    query <- paste0(baseurl, request)

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    got <- httr::content(got)

    x <- do.call(rbind, got$Members$Member)

}
