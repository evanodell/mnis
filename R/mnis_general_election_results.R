
#' Election results by area and date
#'
#' Returns an object containing list with details of the search parameter
#' and a tibble with election results.   Accepts queries on location type
#' and name, and the start and end date to return general elections between.
#' The API does not contain data for Norther Ireland.
#' @param location_type The type of area to return information for. Accepts
#' `'Country'`, `'Region'`, `'County'`, and
#' `'Constituency'`. Defaults to `'Country'`.
#' @param location_name The location to return data for. It can be the name
#' of any Country, Region, County or Constituency. Defaults to 'Great Britain'.
#' @param start_date Start date of search. Accepts character values in
#' `'YYYY-MM-DD'` format, and objects of class `Date`,
#' `POSIXt`, `POSIXct`, `POSIXlt` or anything else than can be
#' coerced to a date with `as.Date()`. Defaults to `'1900-01-01'`.
#' @param end_date End date of search. Accepts character values in
#' `'YYYY-MM-DD'` format, and objects of class `Date`,
#' `POSIXt`, `POSIXct`, `POSIXlt` or anything else than can
#' be coerced to a date with `as.Date()`. Defaults to current system date.
#' @inheritParams mnis_additional
#' @return Returns a list with details of the search parameter and
#' a tibble with election results.
#' @export
#' @seealso [mnis_reference()]
#' @examples
#' \dontrun{
#' x <- mnis_general_election_results(
#'   location_type = "Country", location_name = "England",
#'   start_date = "2010-01-01", end_date = "2016-01-01"
#' )
#' }
#' 
mnis_general_election_results <- function(location_type = "Country",
                                          location_name = "Great Britain",
                                          start_date = "1900-01-01",
                                          end_date = Sys.Date(),
                                          tidy = TRUE,
                                          tidy_style = "snake_case") {
  q_url <- paste0(base_url, "GeneralElectionResults/")

  query <- paste0(
    q_url, utils::URLencode(location_type), "/",
    utils::URLencode(location_name), "/",
    as.Date(start_date), "/",
    as.Date(end_date), "/"
  )

  got <- get_generic(query)

  df <- got$ElectionResults

  df$ElectionResult <- as.tibble(df$ElectionResult)

  if (tidy == TRUE) {
    names(df)[names(df) == "LocationInfo"] <- "location_info"

    names(df)[names(df) == "ElectionResult"] <- "election_result"

    df$election_result <- mnis_tidy(df$election_result, tidy_style)
  }

  df
}
