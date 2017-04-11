#' mnis_base
#'
#' A generic function for the MNIS API lookup. The function requests data in JSON format, but the type of object, and all URLs, paths and parameters are user-defined.
#' @param request The request query being made to the MNIS URL
#' @keywords mnis
#' @export
#' @examples \dontrun{
#'
#' x <- mnis_base('House=Commons|IsEligible=true/')
#'
#' }

mnis_base <- function(request) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

    request <- utils::URLencode(request)

    query <- paste0(baseurl, request)

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- do.call(rbind, got$Members$Member)

}



