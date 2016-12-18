if(FullBiog == TRUE)
  FullBiog <- "FullBiog"
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

data(acme)
acme$fieldsAll
as.data.frame(gotNodes, row.names = NULL, optional = FALSE, gotNodes$fieldsAll)
ToDataFrameTree(gotNodes,  gotNodes$fieldsAll)
ToDataFrameNetwork(gotNodes, gotNodes$fieldsAll, direction = "climb")
ToDataFrameTable(gotNodes, gotNodes$fieldsAll)
dd<-ToDataFrameTypeCol(gotNodes)



options(stringsAsFactors=FALSE)
x <- data.frame(driver = c("Bowser", "Peach"), occupation = c("Koopa", "Princess"))
x$vehicle <- data.frame(model = c("Piranha Prowler", "Royal Racer"))
x$vehicle$stats <- data.frame(speed = c(55, 34), weight = c(67, 24), drift = c(35, 32))
str(x)
str(flatten(x))
str(flatten(x, recursive = FALSE))



