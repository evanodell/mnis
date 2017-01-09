
#' mnis_extra
#'
#'
#' A wrapper for the \code{\link{mnis_additional}} functions.
#' Variable descriptions are taken from the mnis website: <http://data.parliament.uk/membersdataplatform/memberquery.aspx>
#'
#'
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme.
#' @param refDods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @param Addresses Member address information (e.g. website, twitter, consituency address etc...).
#' @param BasicDetails Basic information about the Member (e.g. given name, HoL membership type, oaths etc...)
#' @param BiographyEntries Member biographical information (e.g. countries of interest, policy expertise etc...)
#' @param Committees Committees a Member sits or has sat on as well details on committee chairing.
#' @param Constituencies Constituencies a Member has represented.
#' @param ElectionsContested Elections a Member has contested but not won.
#' @param Experiences Non-parliamentary experience of a Member.
#' @param GovernmentPosts Government posts a Member has held.
#' @param Honours Honours (e.g. MBE, OBE etc...) held by a Member.
#' @param HouseMemberships House membership list of a Member.
#' @param Interests Registered interests (financial) of a Member.
#' @param KnownAs Details of names a Member has chosen to be known as instead of their full title (HoL members only).
#' @param MaidenSpeeches Maiden speech dates for a Member.
#' @param OppositionPosts Opposition posts a Member has held.
#' @param OtherParliaments Other Parliaments that a Member has held a membership of.
#' @param ParliamentaryPosts Parliamentary posts a Member has held.
#' @param Parties Party affiliations of a Member.
#' @param PreferredNames Full set of data about a Members' name (e.g. surname, forename, Honorary prefixes, full details of HoL title and rank etc...).
#' @param Staff Staff employed by a Member.
#' @param Statuses Status history (e.g. suspensions and disqualifications) for a Member.
#' @keywords mnis
#' @examples \dontrun{
#' x <- mnis_extra(172)
#'
#' }
#' @export
#' @rdname mnis_extra
#' @seealso \code{\link{mnis_full_biog}} \code{\link{mnis_basic_details}} \code{\link{mnis_additional}}

mnis_extra <- function(ID, mem_id = TRUE, refDods = FALSE, Addresses = TRUE, BasicDetails = TRUE, BiographyEntries = TRUE, 
    Committees = TRUE, Constituencies = TRUE, ElectionsContested = TRUE, Experiences = TRUE, GovernmentPosts = TRUE, 
    Honours = TRUE, HouseMemberships = TRUE, Interests = TRUE, KnownAs = TRUE, MaidenSpeeches = TRUE, OppositionPosts = TRUE, 
    OtherParliaments = TRUE, ParliamentaryPosts = TRUE, Parties = TRUE, PreferredNames = TRUE, Staff = TRUE, Statuses = TRUE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    # Replace all this with calls to the specific functions, then combine into one data frame. Much easier, also
    # gets around the call limit
    mnis_DF_list <- list()
    
    if (Addresses == TRUE) 
        Addresses_DF <- mnis_addresses(ID)
    mnis_DF_list[["Addresses_DF"]] <- Addresses_DF
    if (BasicDetails == TRUE) 
        BasicDetails_DF <- mnis_basic_details(ID)
    mnis_DF_list[["BasicDetails_DF"]] <- Addresses_DF
    if (BiographyEntries == TRUE) 
        BiographyEntries_DF <- mnis_BiographyEntries(ID)
    mnis_DF_list[["BiographyEntries_DF"]] <- Addresses_DF
    if (Committees == TRUE) 
        Committees_DF <- mnis_committees(ID)
    mnis_DF_list[["Committees_DF"]] <- Addresses_DF
    if (Constituencies == TRUE) 
        Constituencies_DF <- mnis_constituencies(ID)
    mnis_DF_list[["Constituencies_DF"]] <- Addresses_DF
    if (ElectionsContested == TRUE) 
        ElectionsContested_DF <- mnis_elections_contested(ID)
    mnis_DF_list[["ElectionsContested_DF"]] <- Addresses_DF
    if (Experiences == TRUE) 
        Experiences_DF <- mnis_experiences(ID)
    mnis_DF_list[["Experiences_DF"]] <- Addresses_DF
    if (GovernmentPosts == TRUE) 
        GovernmentPosts_DF <- mnis_government_posts(ID)
    mnis_DF_list[["GovernmentPosts_DF"]] <- Addresses_DF
    if (Honours == TRUE) 
        Honours_DF <- mnis_honours(ID)
    mnis_DF_list[["Honours_DF"]] <- Addresses_DF
    if (HouseMemberships == TRUE) 
        HouseMemberships_DF <- mnis_house_memberships(ID)
    mnis_DF_list[["HouseMemberships_DF"]] <- Addresses_DF
    if (Interests == TRUE) 
        Interests_DF <- mnis_interests(ID)
    mnis_DF_list[["Interests_DF"]] <- Addresses_DF
    if (KnownAs == TRUE) 
        KnownAs_DF <- mnis_known_as(ID)
    mnis_DF_list[["KnownAs_DF"]] <- Addresses_DF
    if (MaidenSpeeches == TRUE) 
        MaidenSpeeches_DF <- mnis_maiden_speeches(ID)
    mnis_DF_list[["MaidenSpeeches_DF"]] <- Addresses_DF
    if (OppositionPosts == TRUE) 
        OppositionPosts_DF <- mnis_opposition_posts(ID)
    mnis_DF_list[["OppositionPosts_DF"]] <- Addresses_DF
    if (OtherParliaments == TRUE) 
        OtherParliaments_DF <- mnis_other_parliaments(ID)
    mnis_DF_list[["OtherParliaments_DF"]] <- Addresses_DF
    if (ParliamentaryPosts == TRUE) 
        ParliamentaryPosts_DF <- mnis_parliamentary_posts(ID)
    mnis_DF_list[["ParliamentaryPosts_DF"]] <- Addresses_DF
    if (Parties == TRUE) 
        Parties_DF <- mnis_parties(ID)
    mnis_DF_list[["Parties_DF"]] <- Addresses_DF
    if (PreferredNames == TRUE) 
        PreferredNames_DF <- mnis_preferred_names(ID)
    mnis_DF_list[["PreferredNames_DF"]] <- Addresses_DF
    if (Staff == TRUE) 
        Staff_DF <- mnis_staff(ID)
    mnis_DF_list[["Staff_DF"]] <- Staff_DF
    if (Statuses == TRUE) 
        Statuses_DF <- mnis_statuses(ID)
    mnis_DF_list[["Statuses_DF"]] <- Statuses_DF
    
    x <- plyr::join_all(mnis_DF_list, match = "first")
    
    x
}
