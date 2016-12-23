
#' mp_Extra
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame. Variable descriptions are taken from the mnis website.
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
#' x <- mp_Extra(172)
#'
#' }
#' @export
#' @rdname mp_Extra
#' @seealso \code{\link{mp_FullBiog}} \code{\link{mp_BasicDetails}}


mp_Extra <- function(ID, mem_id = TRUE, refDods = FALSE, Addresses = TRUE, BasicDetails = TRUE, BiographyEntries = TRUE, 
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
        Addresses_DF <- mp_Addresses(ID)
    mnis_DF_list[["Addresses_DF"]] <- Addresses_DF
    if (BasicDetails == TRUE) 
        BasicDetails_DF <- mp_BasicDetails(ID)
    mnis_DF_list[["BasicDetails_DF"]] <- BasicDetails_DF
    if (BiographyEntries == TRUE) 
        BiographyEntries_DF <- mp_BiographyEntries(ID)
    mnis_DF_list[["BiographyEntries_DF"]] <- BiographyEntries_DF
    if (Committees == TRUE) 
        Committees_DF <- mp_Committees(ID)
    mnis_DF_list[["Committees_DF"]] <- Committees_DF
    if (Constituencies == TRUE) 
        Constituencies_DF <- mp_Constituencies(ID)
    mnis_DF_list[["Constituencies_DF"]] <- Constituencies_DF
    if (ElectionsContested == TRUE) 
        ElectionsContested_DF <- mp_ElectionsContested(ID)
    mnis_DF_list[["ElectionsContested_DF"]] <- ElectionsContested_DF
    if (Experiences == TRUE) 
        Experiences_DF <- mp_Experiences(ID)
    mnis_DF_list[["Experiences_DF"]] <- Experiences_DF
    if (GovernmentPosts == TRUE) 
        GovernmentPosts_DF <- mp_GovernmentPosts(ID)
    mnis_DF_list[["GovernmentPosts_DF"]] <- GovernmentPosts_DF
    if (Honours == TRUE) 
        Honours_DF <- mp_Honours(ID)
    mnis_DF_list[["Honours_DF"]] <- Honours_DF
    if (HouseMemberships == TRUE) 
        HouseMemberships_DF <- mp_HouseMemberships(ID)
    mnis_DF_list[["HouseMemberships_DF"]] <- HouseMemberships_DF
    if (Interests == TRUE) 
        Interests_DF <- mp_Interests(ID)
    mnis_DF_list[["Interests_DF"]] <- Interests_DF
    if (KnownAs == TRUE) 
        KnownAs_DF <- mp_KnownAs(ID)
    mnis_DF_list[["KnownAs_DF"]] <- KnownAs_DF
    if (MaidenSpeeches == TRUE) 
        MaidenSpeeches_DF <- mp_MaidenSpeeches(ID)
    mnis_DF_list[["MaidenSpeeches_DF"]] <- MaidenSpeeches_DF
    if (OppositionPosts == TRUE) 
        OppositionPosts_DF <- mp_OppositionPosts(ID)
    mnis_DF_list[["OppositionPosts_DF"]] <- OppositionPosts_DF
    if (OtherParliaments == TRUE) 
        OtherParliaments_DF <- mp_OtherParliaments(ID)
    mnis_DF_list[["OtherParliaments_DF"]] <- OtherParliaments_DF
    if (ParliamentaryPosts == TRUE) 
        ParliamentaryPosts_DF <- mp_ParliamentaryPosts(ID)
    mnis_DF_list[["ParliamentaryPosts_DF"]] <- ParliamentaryPosts_DF
    if (Parties == TRUE) 
        Parties_DF <- mp_Parties(ID)
    mnis_DF_list[["Parties_DF"]] <- Parties_DF
    if (PreferredNames == TRUE) 
        PreferredNames_DF <- mp_PreferredNames(ID)
    mnis_DF_list[["PreferredNames_DF"]] <- PreferredNames_DF
    if (Staff == TRUE) 
        Staff_DF <- mp_Staff(ID)
    mnis_DF_list[["Staff_DF"]] <- Staff_DF
    if (Statuses == TRUE) 
        Statuses_DF <- mp_Statuses(ID)
    mnis_DF_list[["Statuses_DF"]] <- Statuses_DF
    
    x <- plyr::join_all(mnis_DF_list, match = "first")
    
    x
}


