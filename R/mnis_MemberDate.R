#' mnis_MemberDate
#'
#' Returns a data frame with a members status on a given date.
#' @param ID The ID of the member.
#' @param Date A date in yyyy-mm-dd format. Defaults to the current system date.
#' @return Returns a data frame with the given member's status on the given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_MemberDate(172)
#'
#' }

mnis_MemberDate <- function(ID = NULL, Date = Sys.Date()) {

    ID <- as.character(ID)

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/member/historical/"

    query <- paste0(baseurl, ID, "/", Date, "/")

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.list(got$Member)

}
