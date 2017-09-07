

#' A wrapper for \code{\link{mnis_additional}} functions.
#'
#' It combines the various options of mnis_additional into one dataframe, and the default is similar to \code{\link{mnis_full_biog}}. Variable descriptions are taken from the mnis website: <http://data.parliament.uk/membersdataplatform/memberquery.aspx>.
#'
#' @param ID The ID number of the member. If \code{NULL}, does not return any data. Defaults to \code{NULL}.
#' @param ref_dods Request based on the DODS membership ID scheme. Defaults to \code{FALSE}. If \code{FALSE}, requests data based on the default membership ID scheme. Defaults to \code{TRUE}.
#' @param addresses Member address information (e.g. website, twitter, consituency address etc...). If \code{TRUE}, address details are included in the tibble. Defaults to \code{TRUE}.
#' @param biography_entries Member biographical information (e.g. countries of interest, policy expertise etc...) If \code{TRUE}, biographical details are included in the tibble. Defaults to \code{TRUE}.
#' @param committees Committees a Member sits or has sat on as well details on committee chairing. If \code{TRUE}, committee details are included in the tibble. Defaults to \code{TRUE}.
#' @param constituencies Constituencies a Member has represented. If \code{TRUE}, constituency details are included in the tibble. Defaults to \code{TRUE}.
#' @param elections_contested Elections a Member has contested but not won. If \code{TRUE}, details of unsuccessful election contests are included in the tibble. Defaults to \code{TRUE}.
#' @param experiences Non-parliamentary experience of a Member. If \code{TRUE}, extra-parliamentary experience details are included in the tibble. Defaults to \code{TRUE}.
#' @param government_posts Government posts a member has held. If \code{TRUE}, government posts details are included in the tibble. Defaults to \code{TRUE}.
#' @param honours Honours (e.g. MBE, OBE etc...) held by a Member. If \code{TRUE}, honours details are included in the tibble. Defaults to \code{TRUE}.
#' @param house_memberships House membership list of a Member. If \code{TRUE}, house membership details are included in the tibble. Defaults to \code{TRUE}.
#' @param interests Registered interests (financial) of a Member. If \code{TRUE}, interest details are included in the tibble. Defaults to \code{TRUE}.
#' @param known_as Details of names a Member has chosen to be known as instead of their full title (House of Lords members only). If \code{TRUE}, known as details are included in the tibble. Defaults to \code{TRUE}.
#' @param maiden_speeches Maiden speech dates for a Member. If \code{TRUE}, maiden speech details are included in the tibble. Defaults to \code{TRUE}.
#' @param opposition_posts Opposition posts a Member has held. If \code{TRUE}, opposition post details are included in the tibble. Defaults to \code{TRUE}.
#' @param other_parliaments Other Parliaments that a Member has held a membership of. If \code{TRUE}, details of other parliaments are included in the tibble. Defaults to \code{TRUE}.
#' @param parliamentary_posts Parliamentary posts a Member has held. If \code{TRUE}, parliamentary posts details are included in the tibble. Defaults to \code{TRUE}.
#' @param parties Party affiliations of a Member. If \code{TRUE}, party details are included in the tibble. Defaults to \code{TRUE}.
#' @param preferred_names Full set of data about a Members' name (e.g. surname, forename, Honorary prefixes, full details of HoL title and rank etc...). If \code{TRUE}, preferred names details are included in the tibble. Defaults to \code{TRUE}.
#' @param staff The staff employed by a Member. If \code{TRUE}, staff details are included in the tibble. Defaults to \code{TRUE}.
#' @param statuses Status history (e.g. suspensions and disqualifications) for a Member. If \code{TRUE}, status details are included in the tibble. Defaults to \code{TRUE}.
#' @inheritParams mnis_additional
#' @return A tibble with the requested data on a given MP.
#' @export
#' @rdname mnis_extra
#' @seealso \code{\link{mnis_full_biog}}
#' @seealso \code{\link{mnis_basic_details}}
#' @seealso \code{\link{mnis_additional}}
#' @examples \dontrun{
#' x <- mnis_extra(172)
#' }

mnis_extra <- function(ID, ref_dods = FALSE, addresses = TRUE, biography_entries = TRUE, committees = TRUE, constituencies = TRUE, elections_contested = TRUE, experiences = TRUE, government_posts = TRUE, honours = TRUE, house_memberships = TRUE, interests = TRUE, known_as = TRUE, maiden_speeches = TRUE, opposition_posts = TRUE, other_parliaments = TRUE, parliamentary_posts = TRUE, parties = TRUE, preferred_names = TRUE, staff = TRUE, statuses = TRUE, tidy = TRUE, tidy_style = "snake_case") {

    ID <- as.character(ID)

    if (is.null(ID) == TRUE) {
        stop("ID cannot be null", call. = FALSE)
    }

    mnis_df <- tibble::tibble(member_id = ID)


    if (addresses == TRUE) {

        addresses_df <- mnis_addresses(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, addresses_df))))

    }


    if (biography_entries == TRUE) {

        biography_entries_df <- mnis_biography_entries(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, biography_entries_df)))

    }


    if (committees == TRUE) {

        committees_df <- mnis_committees(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, committees_df)))

    }


    if (constituencies == TRUE) {

        constituencies_df <- mnis_constituencies(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, constituencies_df)))

    }


    if (elections_contested == TRUE) {

        elections_contested_df <- mnis_elections_contested(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, elections_contested_df)))

    }


    if (experiences == TRUE) {

        experiences_df <- mnis_experiences(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, experiences_df)))

    }


    if (government_posts == TRUE) {

        government_posts_df <- mnis_government_posts(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, government_posts_df)))

    }


    if (honours == TRUE) {

        honours_df <- mnis_honours(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, honours_df)))

    }


    if (house_memberships == TRUE) {

        house_memberships_df <- mnis_house_memberships(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, house_memberships_df)))

    }


    if (interests == TRUE) {

        interests_df <- mnis_interests(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, interests_df)))

    }


    if (known_as == TRUE) {

        known_as_df <- mnis_known_as(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, known_as_df)))

    }


    if (maiden_speeches == TRUE) {

        maiden_speeches_df <- mnis_maiden_speeches(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, maiden_speeches_df)))

    }


    if (opposition_posts == TRUE) {

        opposition_posts_df <- mnis_opposition_posts(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, opposition_posts_df)))

    }


    if (other_parliaments == TRUE) {

        other_parliaments_df <- mnis_other_parliaments(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, other_parliaments_df)))

    }


    if (parliamentary_posts == TRUE) {

        parliamentary_posts_df <- mnis_parliamentary_posts(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, parliamentary_posts_df)))

    }


    if (parties == TRUE) {

        parties_df <- mnis_parties(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, parties_df)))

    }


    if (preferred_names == TRUE) {

        preferred_names_df <- mnis_preferred_names(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, preferred_names_df)))

    }


    if (staff == TRUE) {

        staff_df <- mnis_staff(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, staff_df)))

    }


    if (statuses == TRUE) {

        statuses_df <- mnis_statuses(ID = ID, ref_dods = ref_dods, tidy = TRUE, tidy_style = "snake_case")

        suppressMessages(suppressWarnings(mnis_df <- dplyr::inner_join(mnis_df, statuses_df)))

    }


    if (tidy == TRUE) {

        mnis_df <- mnis_tidy(mnis_df, tidy_style)

    }

    mnis_df

}
