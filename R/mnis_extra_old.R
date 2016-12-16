
#' mnis_extra
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param ID The ID number
#' @param FullBiog\tReturns all data held about a Member. This will only be permitted on queries that return five records or fewer. All other output types return subsets of this data.
#' @param\tAddresses\tMember address information (e.g. website, twitter, consituency address etc...)
#' @param\tBasicDetails\tBasic information about the Member (e.g. given name, HoL membership type, oaths etc...).
#' @param\tBiographyEntries\tMember biographical information (e.g. countries of interest, policy expertise etc...).
#' @param\tCommittees\tCommittees a Member sits or has sat on as well details on committee chairing.
#' @param\tConstituencies\tConstituencies a Member has represented.
#' @param\tElectionsContested\tElections a Member has contested but not won.
#' @param\tExperiences\tNon-parliamentary experience of a Member.
#' @param\tGovernmentPosts\tGovernment posts a Member has held.
#' @param\tHonours\tHonours (e.g. MBE, OBE etc...) held by a Member.
#' @param\tHouseMemberships\tHouse membership list of a Member.
#' @param\tInterests\tRegistered interests (financial) of a Member.
#' @param\tKnownAs\tDetails of names a Member has chosen to be known as instead of their full title (HoL members only).
#' @param\tMaidenSpeeches\tMaiden speech dates for a Member.
#' @param\tOppositionPosts\tOpposition posts a Member has held.
#' @param\tOtherParliaments\tOther Parliaments that a Member has held a membership of.
#' @param\tParliamentaryPosts\tParliamentary posts a Member has held.
#' @param\tParties\tParty affiliations of a Member.
#' @param\tPreferredNames\tFull set of data about a Members' name (e.g. surname, forename, Honorary prefixes, full details of HoL title and rank etc...)
#' @param\tStaff\tStaff employed by a Member.
#' @param\tStatuses Status history (e.g. suspensions and disqualifications) for a Member.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_extra('House=Commons|IsEligible=true/')
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_extra <- function(ID, FullBiog = FALSE, Addresses = FALSE,
  BasicDetails = FALSE, BiographyEntries = FALSE, Committees = FALSE,
  Constituencies = FALSE, ElectionsContested = FALSE, Experiences = FALSE,
  GovernmentPosts = FALSE, Honours = FALSE, HouseMemberships = FALSE,
  Interests = FALSE, KnownAs = FALSE, MaidenSpeeches = FALSE,
  OppositionPosts = FALSE, OtherParliaments = FALSE, ParliamentaryPosts = FALSE,
  Parties = FALSE, PreferredNames = FALSE, Staff = FALSE, Statuses = FALSE) {

  if(FullBiog == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
  if(Addresses == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Addresses <- "Addresses"
  if(BasicDetails == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    BasicDetails <- "BasicDetails"
  if(BiographyEntries == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    BiographyEntries <- "BiographyEntries"
  if(Committees == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Committees <- "Committees"
  if(Constituencies == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Constituencies <- "Constituencies"
  if(ElectionsContested == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    ElectionsContested <- "ElectionsContested"
  if(Experiences == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Experiences <- "Experiences"
  if(GovernmentPosts == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    GovernmentPosts <- "GovernmentPosts"
  if(Honours == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Honours <- "Honours"
  if(HouseMemberships == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    HouseMemberships <- "HouseMemberships"
  if(Interests == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Interests <- "Interests"
  if(KnownAs == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    KnownAs <- "KnownAs"
  if(MaidenSpeeches == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    MaidenSpeeches <- "MaidenSpeeches"
  if(OppositionPosts == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    OppositionPosts <- "OppositionPosts"
  if(OtherParliaments == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    OtherParliaments <- "OtherParliaments"
  if(ParliamentaryPosts == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    ParliamentaryPosts <- "ParliamentaryPosts"
  if(Parties == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Parties <- "Parties"
  if(PreferredNames == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    PreferredNames <- "PreferredNames"
  if(Staff == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Staff <- "Staff"
  if(Statuses == TRUE){
    FullBiog <- "FullBiog"
  } else {FullBiog <- NULL}
    Statuses <- "Statuses"


  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/id="

  query <- paste0(baseurl, ID, "|",FullBiog,"|", Addresses,"|",
                  BasicDetails,"|", BiographyEntries,"|", Committees,"|",
                  Constituencies,"|", ElectionsContested,"|", Experiences,"|",
                  GovernmentPosts,"|", Honours,"|", HouseMemberships,"|",
                  Interests,"|", KnownAs,"|", MaidenSpeeches,"|",
                  OppositionPosts,"|", OtherParliaments,"|", ParliamentaryPosts,"|",
                  Parties,"|", PreferredNames,"|", Staff,"|", Statuses)
  query <- gsub("[:|:][:|:]", "", query)
  query <- gsub("[:|:]$", "", query)


  got <- httr::GET(query, accept_json())

  got <- httr::content(got, as = "text")

  parsed <- jsonlite::fromJSON(got, flatten = TRUE)

  x <- as.data.frame(parsed$Members)

}

FullBiog = NULL
Addresses = NULL
BasicDetails = NULL
BiographyEntries = NULL
Committees = NULL
Constituencies = NULL
ElectionsContested = NULL
Experiences = NULL
GovernmentPosts = NULL
Honours = NULL
HouseMemberships = NULL
Interests = NULL
KnownAs = NULL
MaidenSpeeches = NULL
OppositionPosts = NULL
OtherParliaments = NULL
ParliamentaryPosts = NULL
Parties = NULL
PreferredNames = NULL
Staff = NULL
Statuses = NULL
