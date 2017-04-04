#' mnis_eligible
#'
#' Function returns all members who are eligible to sit in either house. The function requests data in JSON format and parses it to a data frame.
#' @param eligible If the member is currently eligible to sit. Accepts TRUE or FALSE. Defaults to TRUE.
#' @param house The house to which the member belongs. Accepts one of 'all', 'lords' and 'commons', defaults to 'all'.
#' @param party The party to which a member belongs. Defaults to NULL. The party must be fully spelled out (e.g. "green party"), the API does not accept searches on this parameter.
#' @param tidy Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_eligible(eligible=FALSE, house='all', party='labour')
#'
#' x <- mnis_eligible(eligible=TRUE, house='all', party='green party')
#'
#' }


mnis_eligible <- function(eligible = TRUE, house = "all", party = NULL, tidy = TRUE) {

    if (is.na(pmatch(house, c("all", "lords", "commons"))))
        stop("Please select one of 'all', 'lords' or 'commons' for the parameter 'house'")

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/iseligible="

    house <- as.character(house)

    if (house == "lords") {
        house <- "|house=lords"
    } else if (house == "commons") {
        house <- "|house=commons"
    } else if (house == "all") {
        house <- "|house=all"
    }

    if (is.null(party) == FALSE) {
        party <- utils::URLencode(party)
        party <- paste0("|party=", party)
    }

    query <- paste0(baseurl, eligible, house, party)

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- as.data.frame(got)

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

        x

    } else {

        x

    }

}
