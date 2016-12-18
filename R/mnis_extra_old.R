
#' mnis_extra
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param ID The ID number
#' @param FullBiog Returns all data held about a Member. This will only be permitted on queries that return five records or fewer. All other output types return subsets of this data.
#' @param Addresses Member address information (e.g. website, twitter, consituency address etc...)
#' @param BasicDetails Basic information about the Member (e.g. given name, HoL membership type, oaths etc...).
#' @param BiographyEntries Member biographical information (e.g. countries of interest, policy expertise etc...).
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
#' @param PreferredNames Full set of data about a Members' name (e.g. surname, forename, Honorary prefixes, full details of HoL title and rank etc...)
#' @param Staff Staff employed by a Member.
#' @param Statuses Status history (e.g. suspensions and disqualifications) for a Member.
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

