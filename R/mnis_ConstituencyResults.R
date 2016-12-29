#' mnis_ConstituencyResults
#'
#' Returns a list with details of the constituency and a data frame with election results.
#' @param constituencyId The ID of the constituency to return the data for.
#' @param electionId The ID of the election to return the data for. Defaults to 0, which calls the latest result.
#' @return A list with details of the constituency and a data frame with election results.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_ConstituencyResults(constituencyId = 3709, electionId = 0)
#'
#' }

mnis_ConstituencyResults <- function(constituencyId = NULL, electionId = 0) {

  if(is.null(constituencyId)==TRUE) {
    stop("constituencyId cannot be empty", call. = FALSE)
  }

  constituencyId <- as.character(constituencyId)

  electionId <- as.character(electionId)

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ConstituencyResults/"

  query <- paste0(baseurl, constituencyId, "/", electionId, "/")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

  details <- got$Constituency$Details

  results <- got$Constituency$Results

  results <- as.data.frame(results)

  names(results) <- sub("Election.", "Election_", names(results))

  names(results) <- sub("Candidates.Candidate.", "", names(results))

  y <- list()

  y <- c(list("results"=results), list("details"=details))

  y

}
