#' mnis_eligible
#'
#' Function returns all members who took their seats in the house between two given dates. The function requests data in JSON format and parses it to a data frame.
#' @param eligible If the member is currently eligible to sit. Accepts TRUE or FALSE. Defaults to TRUE.
#' @param house The house to which the member belongs. Accepts one of 'all', 'lords' and 'commons', defaults to 'all'.
#' @param party The party to which a member belongs. Defaults to NULL.
#' @param tidy Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_eligible(eligible='all', house='all', party='labour')
#'
#' }


mnis_eligible <- function(eligible = TRUE, house = "all", party = NULL, tidy = TRUE) {

    if (is.na(pmatch(house, c("all", "lords", "commons"))))
        stop("Please select one of 'all', 'lords' or 'commons' for the parameter 'house'")

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/iseligible="

    house <- as.character(house)

    if (is.null(party) == FALSE)
        party <- utils::URLencode(party)

    if (house == "lords") {
        house <- "|house=lords"
    } else if (house == "commons") {
        house <- "|house=commons"
    } else if (house == "all") {
        house <- "|house=all"
    }

    if (is.null(party) == FALSE) {
        party <- paste0("|party*", party)
    }

    query <- paste0(baseurl, eligible, house, party)

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got)

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

    } else {

        x

    }

}
