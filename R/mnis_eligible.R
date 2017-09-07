
#' All eligible members of both houses
#'
#'  Returns all members who are able to sit in either house, or who are currently ineligible to sit. Members ineligible to sit include but are not necessarily limited to former MPs and members of the judiciary, who are recused from House of Lords duties.
#'
#' @param eligible Logical parameter. If \code{TRUE} returns all members currently eligible to sit, if \code{FALSE} returns all ineligible members. Defaults to \code{TRUE}.
#' @param house The house to which the member belongs. Accepts one of \code{'all'}, \code{'lords'} and \code{'commons'}, defaults to \code{'all'}. This parameter is not case sensitive, so \code{'commons'}, \code{'Commons'} and \code{'cOmMOnS'} will all return the same data.
#' @param party The party to which a member belongs. If \code{NULL} members of all parties are returned subject to other parameters. The party must be fully spelled out (e.g. \code{'green party'}), the API does not accept searches on this parameter. For a tibble of parties, see \code{ref_parties} in \code{\link{mnis_reference}}. This parameter is not case sensititive. Defaults to \code{NULL}.
#' @inheritParams mnis_additional
#' @export
#' @examples \dontrun{
#' x <- mnis_eligible(eligible=FALSE, house='all', party='labour')
#'
#' x <- mnis_eligible(eligible=TRUE, house='all', party='green party')
#'
#' x <- mnis_eligible(house='commons')
#' }


mnis_eligible <- function(eligible = TRUE, house = "all", party = NULL, tidy = TRUE, tidy_style = "snake_case") {

    if (is.na(pmatch(house, c("all", "lords", "commons"))))
        stop("Please select one of 'all', 'lords' or 'commons' for the parameter `house`")

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/iseligible="

    house <- as.character(tolower(house))

    if (house == "lords") {

        house <- "|house=lords"

    } else if (house == "commons") {

        house <- "|house=commons"

    } else if (house == "all") {

        house <- "|house=all"

    }

    if (is.null(party) == FALSE) {

        party <- utils::URLencode(paste0("|party=", party))

    }

    query <- paste0(baseurl, eligible, house, party)

    got <- get_generic(query)

    df <- tibble::as_tibble(got$Members$Member)

    if (tidy == TRUE) {

        df <- mnis_tidy(df, tidy_style)

        if (.Platform$OS.type == "windows") {

            df$member_from <- stringi::stri_trans_general(df$member_from, "latin-ascii")

            df$member_from <- gsub("Ynys MA\U00B4n", "Ynys M\U00F4n", df$member_from)

        }

    }

    df

}
