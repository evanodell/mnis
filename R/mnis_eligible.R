#' mnis_eligible
#'
#' Function returns all members who took their seats in the house between two given dates. The function requests data in JSON format and parses it to a data frame.
#' @param eligible If the member is currently eligible to sit. Accepts TRUE or FALSE. Defaults to TRUE.
#' @param house The house to which the member belongs. Accepts one of 'all', 'lords' and 'commons', defaults to 'all'.
#' @param party The party to which a member belongs. Defaults to NULL.
#' @param clean Fix the variable names in the data frame to remove '@' characters and superfluous text. Defaults to FALSE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_eligible(eligible='all', house='all', party='labour')
#'
#' }


mnis_eligible <- function(eligible = TRUE, house = "all", party = NULL, clean = TRUE) {

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

    if (clean == TRUE) {
        names(x) <- sub("Members.Member.", "", names(x))

        names(x) <- sub("..xsi.nil", "_TF", names(x))

        names(x) <- sub("..xmlns.xsi", "", names(x))

        names(x) <- sub("..Id", "_Id", names(x))

        names(x) <- sub("..text", "_text", names(x))

        names(x) <- sub("..IsActive", "_IsActive", names(x))

        names(x) <- sub(".Name", "_Name", names(x))

        names(x) <- sub(".Reason", "_Reason", names(x))

        names(x) <- sub(".StartDate", "_StartDate", names(x))

        names(x) <- sub("Party..Id", "Party_Id", names(x))

        names(x) <- sub(".Membe_Id", "Member_Id", names(x))

        names(x) <- sub(".Dod_Id", "Dods_Id", names(x))

        names(x) <- sub(".Pim_Id", "Pims_Id", names(x))

        names(x) <- sub("LayingMiniste_Name", "LayingMinister_Name", names(x))

        names(x) <- sub("Part_Id", "Party_Id", names(x))

    }

    x

}
