#' mnis_constituency_results
#'
#' Returns a list with details of the constituency and a data frame with election results.
#' @param constituency_id The ID of the constituency to return the data for. Defaults to NULL
#' @param election_id The ID of the election to return the data for. Defaults to 0, which calls the latest result.
#' @param tidy Fix the variable names in the data frame to remove '@' characters and superfluous text. Defaults to TRUE.
#' @return A list with details of the constituency, labelled 'details' and a data frame with election results, labelled 'results'. The list and data frame are stored in a single object.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_constituency_results(constituency_id = 3709, election_id = 0)
#'
#' }

mnis_constituency_results <- function(constituency_id = NULL, election_id = 0, tidy = TRUE) {

    if (is.null(constituency_id) == TRUE) {
        stop("'constituency_id' cannot be empty", call. = FALSE)
    }

    constituency_id <- as.character(constituency_id)

    election_id <- as.character(election_id)

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ConstituencyResults/"

    query <- paste0(baseurl, constituency_id, "/", election_id, "/")

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- sans_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    details <- got$Constituency$Details

    results <- got$Constituency$Results

    results <- as.data.frame(results)

    y <- list()

    if (tidy == TRUE) {

        y <- constituency_results_tidy(results, details)

        y

    } else {

        y <- c(list(results = results), list(details = details))

        y

    }

}

