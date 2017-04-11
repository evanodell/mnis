#' mnis_constituency_results
#'
#' Returns a list with details of the constituency and a tibble with election results.
#' @param constituency_id The ID of the constituency to return the data for. This parameter cannot be empty.
#' @param election_id The ID of the election to return the data for. Defaults to 0, which calls the most recent result, either the result of the last general election, or the result of the last byelection held since that election.
#' @param tidy Fix the variable names in the tibble to remove non-alphanumeric characters and superfluous text. Defaults to TRUE.
#' @return A list with details of the constituency, labelled 'details' and a tibble with election results, labelled 'results'. The list and tibble are stored in a single object.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_constituency_results(constituency_id = 3709, election_id = 0)
#'
#' }

mnis_constituency_results <- function(constituency_id = NULL, election_id = 0, tidy = TRUE) {
    
    if (missing(constituency_id)) {
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
    
    got <- tidy_bom(got)
    
    got <- jsonlite::fromJSON(got, flatten = TRUE)
    
    details <- got$Constituency$Details
    
    results <- got$Constituency$Results
    
    results <- tibble::as_tibble(results)
    
    y <- list()
    
    if (tidy == TRUE) {
        
        y <- constituency_results_tidy(results, details)
        
        y
        
    } else {
        
        y <- c(list(results = results), list(details = details))
        
        y
        
    }
    
}
