

#' Reference data
#'
#' Reference data on various aspects of parliament.
#'
#' This data is useful for providing parameters for other function calls. The functions do not accept any arguments aside from the \code{tidy} and \code{tidy_style} parameters, which default to \code{TRUE} and \code{'snake_case'} respectively.
#' @inheritParams mnis_additional
#'
#' @section \code{mnis_reference} functions:
#' \describe{
#' \item{\code{ref_address_types}}{The types of addresses available in member's contact details. Includes websites and social media, as well as physical addresses}
#' \item{\code{ref_answering_bodies}}{The bodies that members' can address questions to}
#' \item{\code{ref_areas}}{Geographic areas}
#' \item{\code{ref_area_types}}{Identifiers for grouping areas (e.g. borough constituencies)}
#' \item{\code{ref_biography_categories}}{Member biography categories}
#' \item{\code{ref_cabinets}}{Connections that a member has to the cabinet or shadow cabinet}
#' \item{\code{ref_committees}}{Identifier for parliamentary committees}
#' \item{\code{ref_committee_types}}{Types of parliamentary committees}
#' \item{\code{ref_constituencies()}}{All constituencies}
#' \item{\code{ref_constituency_areas()}}{The links between constituencies and constituency areas}
#' \item{\code{ref_constituency_types()}}{Constituency categories}
#' \item{\code{ref_countries()}}{List of countries that could be listed as members' birthplace}
#' \item{\code{ref_departments()}}{Government and opposition departments}
#' \item{\code{ref_disqualification_types()}}{Types of ways members can be disqualified from sitting in the House}
#' \item{\code{ref_elections()}}{Codes of general and by-elections}
#' \item{\code{ref_election_types()}}{Election categories}
#' \item{\code{ref_end_reasons()}}{Reasons a member may leave the House of Lords or the House of Commons}
#' \item{\code{ref_experience_types()}}{Types of non-parliamentary experience members can list}
#' \item{\code{ref_government_post_departments()}}{All deparments that can contain government posts}
#' \item{\code{ref_government_posts()}}{All government posts}
#' \item{\code{ref_government_ranks()}}{All government post ranks}
#' \item{\code{ref_honourary_prefixes()}}{The types of honourary prefixes for members}
#' \item{\code{ref_honour_lists()}}{The types of honour lists that a member may be honoured in}
#' \item{\code{ref_honours()}}{The different honours available to members}
#' \item{\code{ref_interest_categories()}}{The categories available for reporting financial interests}
#' \item{\code{ref_lords_membership_types()}}{Different types of membership of the House of Lords}
#' \item{\code{ref_lords_ranks()}}{Ranks that peers may hold}
#' \item{\code{ref_opposition_post_departments()}}{The link between opposition posts and the government department they shadow}
#' \item{\code{ref_opposition_posts()}}{Opposition posts}
#' \item{\code{ref_opposition_ranks()}}{How opposition posts are ranked}
#' \item{\code{ref_other_parliaments()}}{Other parliaments that a member may have sat in}
#' \item{\code{ref_parliamentary_posts()}}{The different parliamentary posts available}
#' \item{\code{ref_parliamentary_ranks()}}{How those parliamentary posts are ranked}
#' \item{\code{ref_parliament_types()}}{Types of parliaments that parliamentary data may link to}
#' \item{\code{ref_parties()}}{All parties that members can be affiliated with}
#' \item{\code{ref_party_sub_types()}}{Sub-types of parties}
#' \item{\code{ref_photo_outputs()}}{Outputs that a photo of a member may be linked to}
#' \item{\code{ref_statuses()}}{A member's possible current status in the House}
#' \item{\code{ref_titles()}}{Salutory titles}
#' }
#'
#' @export
#' @seealso \code{\link{mnis_all_reference}}
#' @rdname mnis_reference

mnis_reference <- function() {

  df <- c("ref_address_types()",
          "ref_answering_bodies()",
          "ref_areas()",
          "ref_area_types()",
          "ref_biography_categories()",
          "ref_cabinets()",
          "ref_committees()",
          "ref_committee_types()",
          "ref_constituencies()",
          "ref_constituency_areas()",
          "ref_constituency_types()",
          "ref_countries()",
          "ref_departments()",
          "ref_disqualification_types()",
          "ref_elections()",
          "ref_election_types()",
          "ref_end_reasons()",
          "ref_experience_types()",
          "ref_government_post_departments()",
          "ref_government_posts()",
          "ref_government_ranks()",
          "ref_honourary_prefixes()",
          "ref_honour_lists()",
          "ref_honours()",
          "ref_interest_categories()",
          "ref_lords_membership_types()",
          "ref_lords_ranks()",
          "ref_opposition_post_departments()",
          "ref_opposition_posts()",
          "ref_opposition_ranks()",
          "ref_other_parliaments()",
          "ref_parliamentary_posts()",
          "ref_parliamentary_ranks()",
          "ref_parliament_types()",
          "ref_parties()",
          "ref_party_sub_types()",
          "ref_photo_outputs()",
          "ref_statuses()",
          "ref_titles()")

  message("All Available Reference Functions:")

  print(df)

}

#' @export
#' @rdname mnis_reference
ref_address_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AddressTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$AddressTypes$AddressType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_answering_bodies <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AnsweringBodies/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$AnsweringBodies$AnsweringBody)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_areas <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Areas/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Areas$Area)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_area_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AreaTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$AreaTypes$AreaType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_biography_categories <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/BiographyCategories/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$BiographyCategories$BiographyCategory)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_cabinets <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Cabinets/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Cabinets$Cabinet)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_committees <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Committees/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Committees$Committee)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_committee_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/CommitteeTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$CommitteeTypes$CommitteeType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_constituencies <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Constituencies/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Constituencies$Constituency)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_constituency_areas <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyAreas/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$ConstituencyAreas$ConstituencyArea)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df
}



#' @export
#' @rdname mnis_reference
ref_constituency_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$ConstituencyTypes$ConstituencyType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_countries <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Countries/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Countries$Country)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_departments <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Departments/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Departments$Department)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_disqualification_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/DisqualificationTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$DisqualificationTypes$DisqualificationType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_elections <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Elections/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Elections$Election)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_election_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ElectionTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$ElectionTypes$ElectionType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_end_reasons <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/EndReasons/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$EndReasons$EndReason)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_experience_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ExperienceTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$ExperienceTypes$ExperienceType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_government_post_departments <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPostDepartments/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$GovernmentPostDepartments$GovernmentPostDepartment)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_government_posts <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPosts/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$GovernmentPosts$GovernmentPost)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_government_ranks <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentRanks/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$GovernmentRanks$GovernmentRank)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_honourary_prefixes <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonouraryPrefixes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$HonouraryPrefixes$HonouraryPrefix)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_honour_lists <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonourLists/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$HonourLists$HonourList)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_honours <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Honours/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Honours$Honour)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_interest_categories <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/InterestCategories/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$InterestCategories$InterestCategory)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_lords_membership_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsMembershipTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$LordsMembershipTypes$LordsMembershipType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_lords_ranks <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsRanks/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$LordsRanks$LordsRank)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_opposition_post_departments <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPostDepartments/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$OppositionPostDepartments$OppositionPostDepartment)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}

#' @export
#' @rdname mnis_reference
ref_opposition_posts <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPosts/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$OppositionPosts$OppositionPost)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_opposition_ranks <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionRanks/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$OppositionRanks$OppositionRank)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_other_parliaments <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OtherParliaments/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$OtherParliaments$OtherParliament)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_parliamentary_posts <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryPosts/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$ParliamentaryPosts$ParliamentaryPost)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_parliamentary_ranks <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryRanks/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$ParliamentaryRanks$ParliamentaryRank)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_parliament_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentTypes/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$ParliamentTypes$ParliamentType)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_parties <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Parties/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Parties$Party)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}



#' @export
#' @rdname mnis_reference
ref_party_sub_types <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PartySubTypes/"

  got <- get_reference(baseurl)

  df <- as.list(got$PartySubTypes$PartySubType)

  df <- unlist(df)

  df <- t(df)

  df <- tibble::as_tibble(df)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_photo_outputs <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PhotoOutputs/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$PhotoOutputs$PhotoOutput)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_statuses <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Statuses/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Statuses$Status)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}


#' @export
#' @rdname mnis_reference
ref_titles <- function(tidy = TRUE, tidy_style = "snake_case") {

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Titles/"

  got <- get_reference(baseurl)

  df <- tibble::as_tibble(got$Titles$Title)

  if (tidy == TRUE) {

    df <- ref_tidy(df, tidy_style)

  }

  df

}
