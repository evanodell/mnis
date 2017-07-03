

#' A wrapper for \code{\link{mnis_additional}} functions.
#'
#' It combines the various options of mnis_additional into one dataframe, and the default is similar to \code{\link{mnis_full_biog}}. Variable descriptions are taken from the mnis website: <http://data.parliament.uk/membersdataplatform/memberquery.aspx>.
#'
#' @param ID The ID number of the member. Defaults to NULL. If NULL, returns
#' @param mnis_id Request based on the default membership ID scheme.
#' @param ref_dods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @param addresses Member address information (e.g. website, twitter, consituency address etc...). Defaults to TRUE. If TRUE, address details are included in the tibble.
#' @param basic_details Basic information about the Member (e.g. given name, HoL membership type, oaths etc...) Defaults to TRUE. If TRUE, basic details are included in the tibble.
#' @param biography_entries Member biographical information (e.g. countries of interest, policy expertise etc...) Defaults to TRUE. If TRUE, biographical details are included in the tibble.
#' @param committees Committees a Member sits or has sat on as well details on committee chairing. Defaults to TRUE. If TRUE, committee details are included in the tibble.
#' @param constituencies constituencies a Member has represented. Defaults to TRUE. If TRUE, constituency details are included in the tibble.
#' @param elections_contested Elections a Member has contested but not won. Defaults to TRUE. If TRUE, details of unsuccessful election contests are included in the tibble.
#' @param experiences Non-parliamentary experience of a Member. Defaults to TRUE. If TRUE, extra-parliamentary experience details are included in the tibble.
#' @param government_posts Government posts a Member currently holds. Defaults to TRUE. If TRUE, government posts details are included in the tibble.
#' @param honours Honours (e.g. MBE, OBE etc...) held by a Member. Defaults to TRUE. If TRUE, honours details are included in the tibble.
#' @param house_memberships House membership list of a Member. Defaults to TRUE. If TRUE, house membership details are included in the tibble.
#' @param interests Registered interests (financial) of a Member. Defaults to TRUE. If TRUE, interest details are included in the tibble.
#' @param known_as Details of names a Member has chosen to be known as instead of their full title (House of Lords members only). Defaults to TRUE. If TRUE, known as details are included in the tibble.
#' @param maiden_speeches Maiden speech dates for a Member. Defaults to TRUE. If TRUE, maiden speech details are included in the tibble.
#' @param opposition_posts Opposition posts a Member has held. Defaults to TRUE. If TRUE, opposition post details are included in the tibble.
#' @param other_parliaments Other Parliaments that a Member has held a membership of. Defaults to TRUE. If TRUE, details of other parliaments are included in the tibble.
#' @param parliamentary_posts Parliamentary posts a Member has held. Defaults to TRUE. If TRUE, parliamentary posts details are included in the tibble.
#' @param parties Party affiliations of a Member. Defaults to TRUE. If TRUE, address details are included in the tibble.
#' @param preferred_names Full set of data about a Members' name (e.g. surname, forename, Honorary prefixes, full details of HoL title and rank etc...). Defaults to TRUE. If TRUE, preferred names details are included in the tibble.
#' @param staff The staff employed by a Member. Defaults to TRUE. If TRUE, staff details are included in the tibble.
#' @param statuses Status history (e.g. suspensions and disqualifications) for a Member. Defaults to TRUE. If TRUE, status details are included in the tibble.
#' @param tidy Fix the variable names in the tibble to remove special characters and superfluous text, and converts the variable names to a consistent style. Defaults to TRUE.
#' @param tidy_style The style to convert variable names to, if tidy=TRUE. Accepts one of "snake_case", "camelCase" and "period.case". Defaults to "snake_case"
#' @keywords mnis
#' @return A tibble with the requested data on a given MP.
#' @examples \dontrun{
#'
#' x <- mnis_extra(172)
#'
#' }
#' @export
#' @rdname mnis_extra
#' @seealso \code{\link{mnis_full_biog}} \code{\link{mnis_basic_details}} \code{\link{mnis_additional}}

mnis_extra <- function(ID, mnis_id = TRUE, ref_dods = FALSE, addresses = TRUE, basic_details = TRUE, biography_entries = TRUE, committees = TRUE, constituencies = TRUE, elections_contested = TRUE, experiences = TRUE, government_posts = TRUE, honours = TRUE, house_memberships = TRUE, interests = TRUE, known_as = TRUE, maiden_speeches = TRUE, opposition_posts = TRUE, other_parliaments = TRUE, parliamentary_posts = TRUE, parties = TRUE, preferred_names = TRUE, staff = TRUE, statuses = TRUE, tidy = TRUE, tidy_style="snake_case") {

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }

    if(is.null(ID)==TRUE){
      stop("ID cannot be null", call. = FALSE)
    }

    mnis_df_list <- list()

    if (addresses == TRUE)
        addresses_DF <- mnis_addresses(ID)
    mnis_df_list[["addresses_DF"]] <- addresses_DF

    if (basic_details == TRUE)
        basic_details_DF <- mnis_basic_details(ID)
    mnis_df_list[["basic_details_DF"]] <- basic_details_DF

    if (biography_entries == TRUE)
        biography_entries_DF <- mnis_biography_entries(ID)
    mnis_df_list[["biography_entries_DF"]] <- biography_entries_DF

    if (committees == TRUE)
        committees_DF <- mnis_committees(ID)
    mnis_df_list[["committees_DF"]] <- committees_DF

    if (constituencies == TRUE)
        constituencies_DF <- mnis_constituencies(ID)
    mnis_df_list[["constituencies_DF"]] <- constituencies_DF

    if (elections_contested == TRUE)
        elections_contested_DF <- mnis_elections_contested(ID)
    mnis_df_list[["elections_contested_DF"]] <- elections_contested_DF

    if (experiences == TRUE)
        experiences_DF <- mnis_experiences(ID)
    mnis_df_list[["experiences_DF"]] <- experiences_DF

    if (government_posts == TRUE)
        government_posts_DF <- mnis_government_posts(ID)
    mnis_df_list[["government_posts_DF"]] <- government_posts_DF

    if (honours == TRUE)
        honours_DF <- mnis_honours(ID)
    mnis_df_list[["honours_DF"]] <- honours_DF

    if (house_memberships == TRUE)
        house_memberships_DF <- mnis_house_memberships(ID)
    mnis_df_list[["house_memberships_DF"]] <- house_memberships_DF

    if (interests == TRUE)
        interests_DF <- mnis_interests(ID)
    mnis_df_list[["interests_DF"]] <- interests_DF

    if (known_as == TRUE)
        known_as_DF <- mnis_known_as(ID)
    mnis_df_list[["known_as_DF"]] <- known_as_DF

    if (maiden_speeches == TRUE)
        maiden_speeches_DF <- mnis_maiden_speeches(ID)
    mnis_df_list[["maiden_speeches_DF"]] <- maiden_speeches_DF

    if (opposition_posts == TRUE)
        opposition_posts_DF <- mnis_opposition_posts(ID)
    mnis_df_list[["opposition_posts_DF"]] <- opposition_posts_DF

    if (other_parliaments == TRUE)
        other_parliaments_DF <- mnis_other_parliaments(ID)
    mnis_df_list[["other_parliaments_DF"]] <- other_parliaments_DF

    if (parliamentary_posts == TRUE)
        parliamentary_posts_DF <- mnis_parliamentary_posts(ID)
    mnis_df_list[["parliamentary_posts_DF"]] <- parliamentary_posts_DF

    if (parties == TRUE)
        parties_DF <- mnis_parties(ID)
    mnis_df_list[["parties_DF"]] <- parties_DF

    if (preferred_names == TRUE)
        preferred_names_DF <- mnis_preferred_names(ID)
    mnis_df_list[["preferred_names_DF"]] <- preferred_names_DF

    if (staff == TRUE)
        staff_DF <- mnis_staff(ID)
    mnis_df_list[["staff_DF"]] <- staff_DF

    if (statuses == TRUE)
        statuses_DF <- mnis_statuses(ID)
    mnis_df_list[["statuses_DF"]] <- statuses_DF

    x <- dplyr::bind_cols(mnis_df_list)

    if (tidy == TRUE) {

        x <- mnis::mnis_tidy(x, tidy_style)

        x

    } else {

        x

    }

}
