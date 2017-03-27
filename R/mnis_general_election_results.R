#' mnis_general_election_results
#'
#' Returns a list with details of the search parameter and a data frame with election results.
#' @param location_type The type of area to return information for. Accepts 'Country', 'Region', 'County', and 'Constituency'. Defaults to 'Country'.
#' @param location_name The location to return data for. It can be the name of any Country, Region, County or Constituency. Defaults to 'Great Britain'.
#' @param start_date Start date of search. In yyyy-mm-dd format. Defaults to '1900-01-01' if no date is selected.
#' @param end_date End date of search. In yyyy-mm-dd format. Defaults to current date if no date is selected.
#' @param tidy Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @return Returns a list with details of the search parameter and a data frame with election results.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_general_election_results(location_type = 'Country', location_name = 'England',
#'                                  start_date = '2010-01-01', end_date = '2016-01-01')
#' }

mnis_general_election_results <- function(location_type = "Country", location_name = "Great Britain", start_date = "1900-01-01", end_date = Sys.Date(), tidy=TRUE) {

    location_type <- utils::URLencode(location_type)

    location_name <- utils::URLencode(location_name)

    start_date <- as.character(start_date)

    end_date <- as.character(end_date)

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/GeneralElectionResults/"

    query <- paste0(baseurl, location_type, "/", location_name, "/", start_date, "/", end_date, "/")

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- got$ElectionResults

    if(tidy==TRUE){

      x$ElectionResult <- mnis_tidy(x$ElectionResult)

      x

    } else {

      x

    }

}

#' @export
#' @rdname mnis_general_election_results
#' @usage NULL
mnis_GeneralElectionResults <- function(location_type = "Country", location_name = "Great Britain", start_date = "1900-01-01",
    end_date = Sys.Date()) {
    .Deprecated("mnis_general_election_results")
    mnis_general_election_results(location_type = location_type, location_name = location_name, start_date = start_date, end_date = end_date)
}
