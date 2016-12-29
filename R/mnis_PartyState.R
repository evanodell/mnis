#' mnis_PartyState
#'
#' A data frame with information on the numbers and gender of MPs, by party, for the given date.
#' @param House The house of parliament. Defaults to "Commons".
#' @param Date A date in yyyy-mm-dd format
#' @return A data frame with information on the numbers and gender of MPs, by party, by party, for the given date.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_PartyState("2012-01-12")
#'
#' }

mnis_PartyState <- function(House = "Commons", Date = NULL) {

  if(is.null(Date)==TRUE) {
    Date <- Sys.Date()
  }

  Date <- as.character(Date)

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/HouseOverview/"

  query <- paste0(baseurl, House, "/", Date, "/")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

  x <- as.data.frame(got$HouseOverview)

  names(x) <- sub("Party.", "", names(x))

  names(x) <- sub("X.House", "House", names(x))

  names(x) <- sub(".Id", "Id", names(x))

  x

}
