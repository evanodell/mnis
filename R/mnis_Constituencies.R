
#' mnis_Constituencies
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme. Defaults to TRUE.
#' @param refDods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_Constituencies(172)
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_Constituencies <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

  ID <- as.character(ID)

  if (refDods == TRUE) {
    ID_Type <- "refDods="
  } else {
    ID_Type <- "id="
  }

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

  query <- paste0(baseurl, ID_Type, ID, "/Constituencies")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

  dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))

  x <- t(dl)

  x <- as.data.frame(x)

  x[rownames(x) != "ID", ]

}
