
#' mnis_extra
#'
#'
#' A wrapper for \code{\link{mnis_additional}} functions. It combines the various options of mnis_additional into one dataframe, and the default is similar to \code{\link{mnis_full_biog}}.
#' Variable descriptions are taken from the mnis website: <http://data.parliament.uk/membersdataplatform/memberquery.aspx>
#'
#'
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mnis_id Request based on the default membership ID scheme.
#' @param ref_dods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @param addresses Member address information (e.g. website, twitter, consituency address etc...).
#' @param basic_details Basic information about the Member (e.g. given name, HoL membership type, oaths etc...)
#' @param biography_entries Member biographical information (e.g. countries of interest, policy expertise etc...)
#' @param committees Committees a Member sits or has sat on as well details on committee chairing.
#' @param constituencies constituencies a Member has represented.
#' @param elections_contested Elections a Member has contested but not won.
#' @param experiences Non-parliamentary experience of a Member.
#' @param government_posts Government posts a Member currently holds.
#' @param honours Honours (e.g. MBE, OBE etc...) held by a Member.
#' @param house_memberships House membership list of a Member.
#' @param interests Registered interests (financial) of a Member.
#' @param known_as Details of names a Member has chosen to be known as instead of their full title (House of Lords members only).
#' @param maiden_speeches Maiden speech dates for a Member.
#' @param opposition_posts Opposition posts a Member has held.
#' @param other_parliaments Other Parliaments that a Member has held a membership of.
#' @param parliamentary_posts Parliamentary posts a Member has held.
#' @param parties Party affiliations of a Member.
#' @param preferred_names Full set of data about a Members' name (e.g. surname, forename, Honorary prefixes, full details of HoL title and rank etc...).
#' @param staff The staff employed by a Member.
#' @param statuses Status history (e.g. suspensions and disqualifications) for a Member.
#' @param tidy Fix the variable names in the tibble to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
#' @keywords mnis
#' @examples \dontrun{
#'
#' x <- mnis_extra(172)
#'
#' }
#' @export
#' @rdname mnis_extra
#' @seealso \code{\link{mnis_full_biog}} \code{\link{mnis_basic_details}} \code{\link{mnis_additional}}

mnis_extra <- function(ID, mnis_id = TRUE, ref_dods = FALSE, addresses = TRUE, basic_details = TRUE, biography_entries = TRUE,
    committees = TRUE, constituencies = TRUE, elections_contested = TRUE, experiences = TRUE, government_posts = TRUE,
    honours = TRUE, house_memberships = TRUE, interests = TRUE, known_as = TRUE, maiden_speeches = TRUE, opposition_posts = TRUE,
    other_parliaments = TRUE, parliamentary_posts = TRUE, parties = TRUE, preferred_names = TRUE, staff = TRUE, statuses = TRUE,
    tidy = TRUE) {

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }

    mnis_DF_list <- list()

    if (addresses == TRUE)
        addresses_DF <- mnis_addresses(ID)
    mnis_DF_list[["addresses_DF"]] <- addresses_DF

    if (basic_details == TRUE)
        basic_details_DF <- mnis_basic_details(ID)
    mnis_DF_list[["basic_details_DF"]] <- basic_details_DF

    if (biography_entries == TRUE)
        biography_entries_DF <- mnis_biography_entries(ID)
    mnis_DF_list[["biography_entries_DF"]] <- biography_entries_DF

    if (committees == TRUE)
        committees_DF <- mnis_committees(ID)
    mnis_DF_list[["committees_DF"]] <- committees_DF

    if (constituencies == TRUE)
        constituencies_DF <- mnis_constituencies(ID)
    mnis_DF_list[["constituencies_DF"]] <- constituencies_DF

    if (elections_contested == TRUE)
        elections_contested_DF <- mnis_elections_contested(ID)
    mnis_DF_list[["elections_contested_DF"]] <- elections_contested_DF

    if (experiences == TRUE)
        experiences_DF <- mnis_experiences(ID)
    mnis_DF_list[["experiences_DF"]] <- experiences_DF

    if (government_posts == TRUE)
        government_posts_DF <- mnis_government_posts(ID)
    mnis_DF_list[["government_posts_DF"]] <- government_posts_DF

    if (honours == TRUE)
        honours_DF <- mnis_honours(ID)
    mnis_DF_list[["honours_DF"]] <- honours_DF

    if (house_memberships == TRUE)
        house_memberships_DF <- mnis_house_memberships(ID)
    mnis_DF_list[["house_memberships_DF"]] <- house_memberships_DF

    if (interests == TRUE)
        interests_DF <- mnis_interests(ID)
    mnis_DF_list[["interests_DF"]] <- interests_DF

    if (known_as == TRUE)
        known_as_DF <- mnis_known_as(ID)
    mnis_DF_list[["known_as_DF"]] <- known_as_DF

    if (maiden_speeches == TRUE)
        maiden_speeches_DF <- mnis_maiden_speeches(ID)
    mnis_DF_list[["maiden_speeches_DF"]] <- maiden_speeches_DF

    if (opposition_posts == TRUE)
        opposition_posts_DF <- mnis_opposition_posts(ID)
    mnis_DF_list[["opposition_posts_DF"]] <- opposition_posts_DF

    if (other_parliaments == TRUE)
        other_parliaments_DF <- mnis_other_parliaments(ID)
    mnis_DF_list[["other_parliaments_DF"]] <- other_parliaments_DF

    if (parliamentary_posts == TRUE)
        parliamentary_posts_DF <- mnis_parliamentary_posts(ID)
    mnis_DF_list[["parliamentary_posts_DF"]] <- parliamentary_posts_DF

    if (parties == TRUE)
        parties_DF <- mnis_parties(ID)
    mnis_DF_list[["parties_DF"]] <- parties_DF

    if (preferred_names == TRUE)
        preferred_names_DF <- mnis_preferred_names(ID)
    mnis_DF_list[["preferred_names_DF"]] <- preferred_names_DF

    if (staff == TRUE)
        staff_DF <- mnis_staff(ID)
    mnis_DF_list[["staff_DF"]] <- staff_DF

    if (statuses == TRUE)
        statuses_DF <- mnis_statuses(ID)
    mnis_DF_list[["statuses_DF"]] <- statuses_DF

    x <- dplyr::bind_cols(mnis_DF_list)

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

        x

    } else {

        x

    }

}
