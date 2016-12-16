
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

mnis_extra <- function(ID, FullBiog = TRUE, Addresses = TRUE,
  BasicDetails = TRUE, BiographyEntries = TRUE, Committees = TRUE,
  Constituencies = TRUE, ElectionsContested = TRUE, Experiences = TRUE,
  GovernmentPosts = TRUE, Honours = TRUE, HouseMemberships = TRUE,
  Interests = TRUE, KnownAs = TRUE, MaidenSpeeches = TRUE,
  OppositionPosts = TRUE, OtherParliaments = TRUE, ParliamentaryPosts = TRUE,
  Parties = TRUE, PreferredNames = TRUE, Staff = TRUE, Statuses = TRUE) {
  #make all these true, call to other functions, combine into one DF

  ID <- as.character(ID)

  #Replace all this with calls to the specific functions, then combine into one data frame. Much easier, also gets around the call limit

  if(FullBiog == TRUE)
  if(Addresses == TRUE)
    Addresses <- "Addresses"
  if(BasicDetails == TRUE)
    BasicDetails <- "BasicDetails"
  if(BiographyEntries == TRUE)
    BiographyEntries <- "BiographyEntries"
  if(Committees == TRUE)
    Committees <- "Committees"
  if(Constituencies == TRUE)
    Constituencies <- "Constituencies"
  if(ElectionsContested == TRUE)
    ElectionsContested <- "ElectionsContested"
  if(Experiences == TRUE)
    Experiences <- "Experiences"
  if(GovernmentPosts == TRUE)
    GovernmentPosts <- "GovernmentPosts"
  if(Honours == TRUE)
    Honours <- "Honours"
  if(HouseMemberships == TRUE)
    HouseMemberships <- "HouseMemberships"
  if(Interests == TRUE)
    Interests <- "Interests"
  if(KnownAs == TRUE)
    KnownAs <- "KnownAs"
  if(MaidenSpeeches == TRUE)
    MaidenSpeeches <- "MaidenSpeeches"
  if(OppositionPosts == TRUE)
    OppositionPosts <- "OppositionPosts"
  if(OtherParliaments == TRUE)
    OtherParliaments <- "OtherParliaments"
  if(ParliamentaryPosts == TRUE)
    ParliamentaryPosts <- "ParliamentaryPosts"
  if(Parties == TRUE)
    Parties <- "Parties"
  if(PreferredNames == TRUE)
    PreferredNames <- "PreferredNames"
  if(Staff == TRUE)
    Staff <- "Staff"
  if(Statuses == TRUE)
    Statuses <- "Statuses"

  request<-'House=Commons|IsEligible=true/'

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

  #got <- httr::GET(query, httr::accept_json())

  #got <- httr::content(got, as = "text")

  parsed <- jsonlite::fromJSON(paste0(baseurl,request),flatten = TRUE)

  x <- as.data.frame(parsed$Members)


}
