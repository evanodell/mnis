
#' All Members of Both Parliaments
#'
#' Returns data on all members of the House of Commons and/or the House of Lords, from all parties or from a given party.
#'
#' @param house The house to which the member belongs. Accepts one of \code{'all'}, \code{'lords'} and \code{'commons'}. This parameter is not case sensitive, so \code{'commons'}, \code{'Commons'} and \code{'cOmMOnS'} will all return the same data. Defaults to \code{'all'}.
#' @param party The party to which a member belongs. If \code{NULL}, all members are returned, subject to other parameters. Defaults to \code{NULL}.
#' @inheritParams mnis_additional
#' @return A tibble with information on all members of the House of Commons and/or the House of Lords that meet the criteria included in the function parameters.
#' @export
#'
#' @examples \dontrun{
#' x <- mnis_all_members(house = 'all', party = NULL, tidy = TRUE, tidy_style = "snake_case")
#' }

mnis_all_members <- function(house = "all", party = NULL, tidy = TRUE, tidy_style = "snake_case") {

  house <- tolower(house)

  if (is.na(pmatch(house, c("all", "lords", "commons"))))
    stop("Please select one of 'all', 'lords' or 'commons' for the parameter 'house'")

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/Membership=all"

  if (is.null(party) == FALSE)
    party <- utils::URLencode(party)

  if (house == "lords") {

    house <- "|house=lords"

  } else if (house == "commons") {

    house <- "|house=commons"

  } else if (house == "all") {

    house <- ""

  }

  if (is.null(party) == FALSE) {
    party <- paste0("|party*", party)
  }

  message("Connecting to API")

  query <- paste0(baseurl, house, party, "/HouseMemberships/")

  got <- get_generic(query)

  df <- got$Members$Member

  df <- tibble::as_tibble(df)

  if (tidy == TRUE) {

    df <- mnis_tidy(df, tidy_style)

  }

    df

}
