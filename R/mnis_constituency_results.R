#' mnis_constituency_results
#'
#' Returns a list with details of the constituency and a data frame with election results.
#' @param constituencyId The ID of the constituency to return the data for.
#' @param electionId The ID of the election to return the data for. Defaults to 0, which calls the latest result.
#' @param clean Fix the variable names in the data frame to remove '@' characters and superfluous text. Defaults to FALSE.
#' @return A list with details of the constituency, labelled 'details' and a data frame with election results, labelled 'results'. The list and data frame are stored in a single object.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_constituency_results(constituencyId = 3709, electionId = 0)
#'
#' }

mnis_constituency_results <- function(constituencyId = NULL, electionId = 0, clean = TRUE) {

    if (is.null(constituencyId) == TRUE) {
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

    if (clean == TRUE) {

        names(results) <- gsub("Election.", "Election_", names(results))

        names(results) <- gsub("Candidates.Candidate.", "", names(results))

        names(results) <- sub("Election_.Id", "Election_Id", names(results))

    }

    y <- list()

    y <- c(list(results = results), list(details = details))

    y

}


#' @export
#' @rdname mnis_constituency_results
#' @usage NULL
mnis_ConstituencyResults <- function(constituencyId = NULL, electionId = 0) {
    .Deprecated("mnis_ConstituencyResults")
    mnis_constituency_results(constituencyId = constituencyId, electionId = electionId)
}
