#' @title mnis_defunct
#' @description Defunct functions for the `mnis` package.
#'
#'
#' @rdname mnis_defunct
#' @usage NULL
mnis_Addresses <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_addresses")
    mnis_addresses(ID = ID, ref_dods = ref_dods)
}





#' @rdname mnis_defunct
#' @usage NULL
mnis_BasicDetails <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_basic_details")
    mnis_basic_details(ID = ID, ref_dods = ref_dods, tidy = tidy)
}

#' @rdname mnis_defunct
#' @usage NULL
mnis_BiographyEntries <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_biography_entries")
    mnis_biography_entries(ID = ID, ref_dods = ref_dods)
}



#' @rdname mnis_defunct
#' @usage NULL
mnis_ConstituencyResults <- function(constituencyId = NULL, election_id = 0) {
    .Deprecated("mnis_ConstituencyResults")
    mnis_constituency_results(constituency_id = constituencyId, election_id = election_id)
}





#' @rdname mnis_defunct
#' @usage NULL
mnis_Committees <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_committees")
    mnis_committees(ID = ID, ref_dods = ref_dods)
}



#' @rdname mnis_defunct
#' @usage NULL
mnis_Constituencies <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_constituencies")
    mnis_constituencies(ID = ID, ref_dods = ref_dods)
}

mnis_Base <- function(request) {
    .Deprecated("mnis_Base")
    mnis_base(request = request)
}

#' @rdname mnis_defunct
#' @usage NULL
mnis_ElectionsContested <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_elections_contested")
    mnis_elections_contested(ID = ID, ref_dods = ref_dods)
}




#' @rdname mnis_defunct
#' @usage NULL
mnis_Experiences <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_experiences")
    mnis_experiences(ID = ID, ref_dods = ref_dods)
}





#' @rdname mnis_defunct
#' @usage NULL
mnis_GovernmentPosts <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_government_posts")
    mnis_government_posts(ID = ID, ref_dods = ref_dods)
}




#' @rdname mnis_defunct
#' @usage NULL
mnis_Honours <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_honours")
    mnis_honours(ID = ID, ref_dods = ref_dods)
}





#' @rdname mnis_defunct
#' @usage NULL
mnis_HouseMemberships <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_house_memberships")
    mnis_house_memberships(ID = ID, ref_dods = ref_dods)
}




#' @rdname mnis_defunct
#' @usage NULL
mnis_Statuses <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_statuses")
    mnis_statuses(ID = ID, ref_dods = ref_dods)
}




#' @rdname mnis_defunct
#' @usage NULL
mnis_Staff <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_staff")
    mnis_staff(ID = ID, ref_dods = ref_dods)
}




#' @rdname mnis_defunct
#' @usage NULL
mnis_Interests <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_interests")
    mnis_interests(ID = ID, ref_dods = ref_dods)
}




#' @rdname mnis_defunct
#' @usage NULL
mnis_KnownAs <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_known_as")
    mnis_known_as(ID = ID, ref_dods = ref_dods)
}





#' @rdname mnis_defunct
#' @usage NULL
mnis_MaidenSpeeches <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_maiden_speeches")
    mnis_maiden_speeches(ID = ID, ref_dods = ref_dods)
}



#' @rdname mnis_defunct
#' @usage NULL
mnis_OppositionPosts <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_opposition_posts")
    mnis_opposition_posts(ID = ID, ref_dods = ref_dods)
}




#' @rdname mnis_defunct
#' @usage NULL
mnis_OtherParliaments <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_other_parliaments")
    mnis_other_parliaments(ID = ID, ref_dods = ref_dods)
}



#' @rdname mnis_defunct
#' @usage NULL
mnis_ParliamentaryPosts <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_parliamentary_posts")
    mnis_parliamentary_posts(ID = ID, ref_dods = ref_dods)
}



#' @rdname mnis_defunct
#' @usage NULL
mnis_Parties <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_parties")
    mnis_parties(ID = ID, ref_dods = ref_dods)
}



#' @rdname mnis_defunct
#' @usage NULL
mnis_PreferredNames <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_preferred_names")
    mnis_preferred_names(ID = ID, ref_dods = ref_dods)
}


#' @rdname mnis_defunct
#' @usage NULL
mnis_Department <- function(departmentId = 0, bench = "Government", former = TRUE) {
    .Defunct("mnis_Department")
    mnis_department(department_id = departmentId, bench = bench, former = former)
}



#' @rdname mnis_defunct
#' @usage NULL
mnis_MemberDate <- function(ID = NULL, Date = Sys.Date()) {
    .Defunct("mnis_member_date")
    mnis_member_date(ID = ID, date = Date)
}


mnis_FullBiog <- function(ID = NULL, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_full_biog")
    mnis_full_biog(ID = ID, ref_dods = ref_dods, tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
mnis_defunct <- function() {
    .Defunct("mnis_defunct")
    mnis_defunct()
}





#' @rdname mnis_defunct
#' @usage NULL
ref_AddressTypes <- function(tidy = TRUE) {
    .Defunct("ref_address_types")
    ref_address_types(tidy = tidy)
}





#' @rdname mnis_defunct
#' @usage NULL
ref_AnsweringBodies <- function(tidy = TRUE) {
    .Defunct("ref_answering_bodies")
    ref_answering_bodies(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_Areas <- function(tidy = TRUE) {
    .Defunct("ref_areas")
    ref_areas(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_AreaTypes <- function(tidy = TRUE) {
    .Defunct("ref_area_types")
    ref_area_types(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_BiographyCategories <- function(tidy = TRUE) {
    .Defunct("ref_biography_categories")
    ref_biography_categories(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_Cabinets <- function(tidy = TRUE) {
    .Defunct("ref_cabinets")
    ref_cabinets(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_Committees <- function(tidy = TRUE) {
    .Defunct("ref_committees")
    ref_committees(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_CommitteeTypes <- function(tidy = TRUE) {
    .Defunct("ref_committee_types")
    ref_committee_types(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_Constituencies <- function(tidy = TRUE) {
    .Defunct("ref_constituencies")
    ref_constituencies(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_ConstituencyAreas <- function(tidy = TRUE) {
    .Defunct("ref_constituency_areas")
    ref_constituency_areas(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_ConstituencyTypes <- function(tidy = TRUE) {
    .Defunct("ref_constituency_types")
    ref_constituency_types(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_Countries <- function(tidy = TRUE) {
    .Defunct("ref_countries")
    ref_countries(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_Departments <- function(tidy = TRUE) {
    .Defunct("ref_departments")
    ref_departments(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_DisqualificationTypes <- function(tidy = TRUE) {
    .Defunct("ref_disqualification_types")
    ref_disqualification_types(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_Elections <- function(tidy = TRUE) {
    .Defunct("ref_elections")
    ref_elections(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_ElectionTypes <- function(tidy = TRUE) {
    .Defunct("ref_election_types")
    ref_election_types(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_EndReasons <- function(tidy = TRUE) {
    .Defunct("ref_end_reasons")
    ref_end_reasons(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_ExperienceTypes <- function(tidy = TRUE) {
    .Defunct("ref_experience_types")
    ref_experience_types(tidy = tidy)
}





#' @rdname mnis_defunct
#' @usage NULL
ref_GovernmentPosts <- function(tidy = TRUE) {
    .Defunct("ref_government_posts")
    ref_government_posts(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_GovernmentRanks <- function(tidy = TRUE) {
    .Defunct("ref_government_ranks")
    ref_government_ranks(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_HonouraryPrefixes <- function(tidy = TRUE) {
    .Defunct("ref_honourary_prefixes")
    ref_honourary_prefixes(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_HonourLists <- function(tidy = TRUE) {
    .Defunct("ref_honour_lists")
    ref_honour_lists(tidy = tidy)
}


#' @rdname mnis_defunct
#' @usage NULL
mnis_GeneralElectionResults <- function(location_type = "Country", location_name = "Great Britain", start_date = "1900-01-01", end_date = Sys.Date()) {
    .Deprecated("mnis_general_election_results")
    mnis_general_election_results(location_type = location_type, location_name = location_name, start_date = start_date, end_date = end_date)
}




mnis_JoinedBetween <- function(start_date = "1900-01-01", end_date = Sys.Date(), house = "all", party = NULL, eligible = "all", 
    tidy = TRUE) {
    .Deprecated("mnis_JoinedBetween")  #include a package argument, too
    mnis_joined_between(start_date = start_date, end_date = end_date, house = house, party = party, eligible = eligible, tidy = tidy)
}


mnis_PartyState <- function(house = "Commons", date = Sys.Date()) {
    .Deprecated("mnis_PartyState")
    mnis_party_state(house = house, date = date)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_GovernmentPostDepartments <- function(tidy = TRUE) {
    .Defunct("ref_government_post_departments")
    ref_government_post_departments(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_Honours <- function(tidy = TRUE) {
    .Defunct("ref_honours")
    ref_honours(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_InterestCategories <- function(tidy = TRUE) {
    .Defunct("ref_interest_categories")
    ref_interest_categories(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_LordsMembershipTypes <- function(tidy = TRUE) {
    .Defunct("ref_lords_membership_types")
    ref_lords_membership_types(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_LordsRanks <- function(tidy = TRUE) {
    .Defunct("ref_lords_ranks")
    ref_lords_ranks(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_OppositionPostDepartments <- function(tidy = TRUE) {
    .Defunct("ref_opposition_post_departments")
    ref_opposition_post_departments(tidy = tidy)
}





#' @rdname mnis_defunct
#' @usage NULL
ref_OppositionPosts <- function(tidy = TRUE) {
    .Defunct("ref_opposition_posts")
    ref_opposition_posts(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_OppositionRanks <- function(tidy = TRUE) {
    .Defunct("ref_opposition_ranks")
    ref_opposition_ranks(tidy = tidy)
}



#' @rdname mnis_defunct
#' @usage NULL
ref_OtherParliaments <- function(tidy = TRUE) {
    .Defunct("ref_other_parliaments")
    ref_other_parliaments(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_ParliamentaryPosts <- function(tidy = TRUE) {
    .Defunct("ref_parliamentary_posts")
    ref_parliamentary_posts(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_ParliamentaryRanks <- function(tidy = TRUE) {
    .Defunct("ref_parliamentary_ranks")
    ref_parliamentary_ranks(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_ParliamentTypes <- function(tidy = TRUE) {
    .Defunct("ref_parliament_types")
    ref_parliament_types(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_Parties <- function(tidy = TRUE) {
    .Defunct("ref_parties")
    ref_parties(tidy = tidy)
}






#' @rdname mnis_defunct
#' @usage NULL
ref_PartySubTypes <- function(tidy = TRUE) {
    .Defunct("ref_party_sub_types")
    ref_party_sub_types(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_PhotoOutputs <- function(tidy = TRUE) {
    .Defunct("ref_photo_outputs")
    ref_photo_outputs(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_Statuses <- function(tidy = TRUE) {
    .Defunct("ref_statuses")
    ref_statuses(tidy = tidy)
}




#' @rdname mnis_defunct
#' @usage NULL
ref_Titles <- function(tidy = TRUE) {
    .Defunct("ref_titles")
    ref_titles(tidy = tidy)
}
