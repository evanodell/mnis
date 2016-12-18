
#' mnis_extra
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame. Variable descriptions are taken from the mnis website.
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme. Defaults to TRUE.
#' @param refDods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @param pims_id  Request based on the PIMS membership ID scheme. Defaults to FALSE.
#' @param FullBiog Returns all data held about a Member. This will only be permitted on queries that return five records or fewer. All other output types return subsets of this data. Defaults to TRUE.
#' @param Addresses Member address information (e.g. website, twitter, consituency address etc...). Defaults to TRUE.
#' @param BasicDetails Basic information about the Member (e.g. given name, HoL membership type, oaths etc...) Defaults to TRUE.
#' @param BiographyEntries Member biographical information (e.g. countries of interest, policy expertise etc...) Defaults to TRUE.
#' @param Committees Committees a Member sits or has sat on as well details on committee chairing. Defaults to TRUE.
#' @param Constituencies Constituencies a Member has represented. Defaults to TRUE.
#' @param ElectionsContested Elections a Member has contested but not won. Defaults to TRUE.
#' @param Experiences Non-parliamentary experience of a Member. Defaults to TRUE.
#' @param GovernmentPosts Government posts a Member has held. Defaults to TRUE.
#' @param Honours Honours (e.g. MBE, OBE etc...) held by a Member. Defaults to TRUE.
#' @param HouseMemberships House membership list of a Member. Defaults to TRUE.
#' @param Interests Registered interests (financial) of a Member. Defaults to TRUE.
#' @param KnownAs Details of names a Member has chosen to be known as instead of their full title (HoL members only). Defaults to TRUE.
#' @param MaidenSpeeches Maiden speech dates for a Member. Defaults to TRUE.
#' @param OppositionPosts Opposition posts a Member has held. Defaults to TRUE.
#' @param OtherParliaments Other Parliaments that a Member has held a membership of. Defaults to TRUE.
#' @param ParliamentaryPosts Parliamentary posts a Member has held. Defaults to TRUE.
#' @param Parties Party affiliations of a Member. Defaults to TRUE.
#' @param PreferredNames Full set of data about a Members' name (e.g. surname, forename, Honorary prefixes, full details of HoL title and rank etc...). Defaults to TRUE.
#' @param Staff Staff employed by a Member. Defaults to TRUE.
#' @param Statuses Status history (e.g. suspensions and disqualifications) for a Member. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_extra(172)
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_extra <- function(ID, mem_id = TRUE, refDods = FALSE, FullBiog = TRUE, Addresses = TRUE,
  BasicDetails = TRUE, BiographyEntries = TRUE, Committees = TRUE, Constituencies = TRUE,
  ElectionsContested = TRUE, Experiences = TRUE, GovernmentPosts = TRUE, Honours = TRUE,
  HouseMemberships = TRUE, Interests = TRUE, KnownAs = TRUE, MaidenSpeeches = TRUE,
  OppositionPosts = TRUE, OtherParliaments = TRUE, ParliamentaryPosts = TRUE, Parties = TRUE,
  PreferredNames = TRUE, Staff = TRUE, Statuses = TRUE) {

  ID <- as.character(ID)

  if (refDods == TRUE) {
    ID_Type <- "refDods="
  } else {
    ID_Type <- "id="
  }
  # Replace all this with calls to the specific functions, then combine into one
  # data frame. Much easier, also gets around the call limit
  if (FullBiog == TRUE)
    FullBiog_DF <- mnis_FullBiog(ID)
  if (Addresses == TRUE)
    Addresses_DF <- mnis_Addresses(ID)
  if (BasicDetails == TRUE)
    BasicDetails_DF <- mnis_BasicDetails(ID)
  if (BiographyEntries == TRUE)
    BiographyEntries_DF <- mnis_BiographyEntries(ID)
  if (Committees == TRUE)
    Committees_DF <- mnis_Committees(ID)
  if (Constituencies == TRUE)
    Constituencies_DF <- mnis_Constituencies(ID)
  if (ElectionsContested == TRUE)
    ElectionsContested_DF <- mnis_ElectionsContested(ID)
  if (Experiences == TRUE)
    Experiences_DF <- mnis_Experiences(ID)
  if (GovernmentPosts == TRUE)
    GovernmentPosts_DF <- mnis_GovernmentPosts(ID)
  if (Honours == TRUE)
    Honours_DF <- mnis_Honours(ID)
  if (HouseMemberships == TRUE)
    HouseMemberships_DF <- mnis_HouseMemberships(ID)
  if (Interests == TRUE)
    Interests_DF <- mnis_Interests(ID)
  if (KnownAs == TRUE)
    KnownAs_DF <- mnis_KnownAs(ID)
  if (MaidenSpeeches == TRUE)
    MaidenSpeeches_DF <- mnis_MaidenSpeeches(ID)
  if (OppositionPosts == TRUE)
    OppositionPosts_DF <- mnis_OppositionPosts(ID)
  if (OtherParliaments == TRUE)
    OtherParliaments_DF <- mnis_OtherParliaments(ID)
  if (ParliamentaryPosts == TRUE)
    ParliamentaryPosts_DF <- mnis_ParliamentaryPosts(ID)
  if (Parties == TRUE)
    Parties_DF <- mnis_Parties(ID)
  if (PreferredNames == TRUE)
    PreferredNames_DF <- mnis_PreferredNames(ID)
  if (Staff == TRUE)
    Staff_DF <- mnis_Staff(ID)
  if (Statuses == TRUE)
    Statuses_DF <- mnis_Statuses(ID)

  mnis_DF_list <- list(FullBiog_DF, Addresses_DF, BasicDetails_DF, BiographyEntries_DF,
    Committees_DF, Constituencies_DF, ElectionsContested_DF, Experiences_DF,
    GovernmentPosts_DF, Honours_DF, HouseMemberships_DF, Interests_DF, KnownAs_DF,
    MaidenSpeeches_DF, OppositionPosts_DF, OtherParliaments_DF, ParliamentaryPosts_DF,
    Parties_DF, PreferredNames_DF, Staff_DF, Statuses_DF)

  x <- plyr::join_all(mnis_DF_list, match = "first")
}
