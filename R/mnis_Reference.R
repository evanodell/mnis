
#' mnis_reference
#'
#' A series of functions to return reference data. This data is useful for providing parameters for other function calls. The functions do not accept any arguments.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' ref_address_types()
#' # The types of addresses available in member's contact details.
#' # Includes websites and social media, as well as physical addresses.
#'
#' ref_answering_bodies()
#' # The bodies that members' can address questions to.
#'
#' ref_areas()
#' # Geographic areas.
#'
#' ref_area_types()
#' # Identifiers for grouping areas (e.g. borough constituencies).
#'
#' ref_biography_categories()
#' # Member biography categories.
#'
#' ref_cabinets()
#' # Connections that a member has to the cabinet or shadow cabinet.
#'
#' ref_committees()
#' # Identifier for parliamentary committees.
#'
#' ref_committee_types()
#' # Types of parliamentary committees.
#'
#' ref_constituencies()
#' # All constituencies.
#'
#' ref_constituency_areas()
#' # The links between constituencies and constituency areas.
#'
#' ref_constituency_types()
#' # Constituency categories.
#'
#' ref_countries()
#' # List of countries that could be listed as members' birthplace.
#'
#' ref_departments()
#' # Government and opposition departments.
#'
#' ref_disqualification_types()
#' # Types of ways members can be disqualified from sitting in the House.
#'
#' ref_elections()
#' # Codes of general and by-elections.
#'
#' ref_election_types()
#' # Election categories.
#'
#' ref_end_reasons()
#' # Reasons a member may leave the House of Lords or the House of Commons.
#'
#' ref_experience_types()
#' # Types of non-parliamentary experience members can list.
#'
#' ref_government_post_departments()
#' # All deparments that can contain government posts.
#'
#' ref_government_posts()
#' # All government posts.
#'
#' ref_government_ranks()
#' # All government post ranks.
#'
#' ref_honourary_prefixes()
#' # The types of honourary prefixes for members.
#'
#' ref_honour_lists()
#' # The types of honour lists that a member may be honoured in.
#'
#' ref_honours()
#' # The different honours available to members.
#'
#' ref_interest_categories()
#' # The categories available for reporting financial interests.
#'
#' ref_lords_membership_types()
#' # Different types of membership of the House of Lords.
#'
#' ref_lords_ranks()
#' # Ranks that peers may hold.
#'
#' ref_opposition_post_departments()
#' # The link between opposition posts and the government department they shadow.
#'
#' ref_opposition_posts()
#' # Opposition posts.
#'
#' ref_opposition_ranks()
#' # How opposition posts are ranked.
#'
#' ref_other_parliaments()
#' # Other parliaments that a member may have sat in.
#'
#' ref_parliamentary_posts()
#' # The different parliamentary posts available.
#'
#' ref_parliamentary_ranks()
#' # How those parliamentary posts are ranked.
#'
#' ref_parliament_types()
#' # Types of parliaments that parliamentary data may link to.
#'
#' ref_parties()
#' # All parties that members can be affiliated with.
#'
#' ref_party_sub_types()
#' # Sub-types of parties.
#'
#' ref_photo_outputs()
#' # Outputs that a photo of a member may be linked to.
#'
#' ref_statuses()
#' # A member's possible current status in the House.
#'
#' ref_titles()
#' # Salutory titles.
#'
#' mnis_reference()
#' # Returns a list of all possible reference functions.
#' }
#'
#' @export
#' @export
#' @rdname mnis_reference
mnis_reference <- function() {

    x <- c("ref_address_types()", "ref_answering_bodies()", "ref_areas()", "ref_area_types()", "ref_biography_categories()",
        "ref_cabinets()", "ref_committees()", "ref_committee_types()", "ref_constituencies()", "ref_constituency_areas()",
        "ref_constituency_types()", "ref_countries()", "ref_departments()", "ref_disqualification_types()", "ref_elections()",
        "ref_election_types()", "ref_end_reasons()", "ref_experience_types()", "ref_government_post_departments()",
        "ref_government_posts()", "ref_government_ranks()", "ref_honourary_prefixes()", "ref_honour_lists()", "ref_honours()",
        "ref_interest_categories()", "ref_lords_membership_types()", "ref_lords_ranks()", "ref_opposition_post_departments()",
        "ref_opposition_posts()", "ref_opposition_ranks()", "ref_other_parliaments()", "ref_parliamentary_posts()",
        "ref_parliamentary_ranks()", "ref_parliament_types()", "ref_parties()", "ref_party_sub_types()", "ref_photo_outputs()",
        "ref_statuses()", "ref_titles()")

    message("All Available Reference Functions:")

    x
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
mnis_Reference <- function() {
    .Deprecated("mnis_reference")
    mnis_reference()
}

#' @export
#' @rdname mnis_reference
ref_address_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AddressTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$AddressTypes)

    names(x) <- sub("AddressType.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_AddressTypes <- function() {
    .Deprecated("ref_address_types")
    ref_address_types()
}

#' @export
#' @rdname mnis_reference
ref_answering_bodies <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AnsweringBodies/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$AnsweringBodies)

    names(x) <- sub("AnsweringBody.", "", names(x))

    x

}
#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_AnsweringBodies <- function() {
    .Deprecated("ref_answering_bodies")
    ref_answering_bodies()
}

#' @export
#' @rdname mnis_reference
ref_areas <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Areas/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Areas)

    names(x) <- sub("Area.", "", names(x))

    x

}
#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Areas <- function() {
    .Deprecated("ref_areas")
    ref_areas()
}

#' @export
#' @rdname mnis_reference
ref_area_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AreaTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$AreaTypes)

    names(x) <- sub("AreaType.", "", names(x))

    x

}
#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_AreaTypes <- function() {
    .Deprecated("ref_area_types")
    ref_area_types()
}

#' @export
#' @rdname mnis_reference
ref_biography_categories <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/BiographyCategories/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$BiographyCategories)

    names(x) <- sub("BiographyCategory.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_BiographyCategories <- function() {
    .Deprecated("ref_biography_categories")
    ref_biography_categories()
}

#' @export
#' @rdname mnis_reference
ref_cabinets <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Cabinets/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Cabinets)

    names(x) <- sub("Cabinet.", "", names(x))

    x

}
#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Cabinets <- function() {
    .Deprecated("ref_cabinets")
    ref_cabinets()
}

#' @export
#' @rdname mnis_reference
ref_committees <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Committees/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Committees)

    names(x) <- sub("Committee.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Committees <- function() {
    .Deprecated("ref_committees")
    ref_committees()
}

#' @export
#' @rdname mnis_reference
ref_committee_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/CommitteeTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$CommitteeTypes)

    names(x) <- sub("CommitteeType.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_CommitteeTypes <- function() {
    .Deprecated("ref_committee_types")
    ref_committee_types()
}

#' @export
#' @rdname mnis_reference
ref_constituencies <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Constituencies/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Constituencies)

    names(x) <- sub("Constituency.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Constituencies <- function() {
    .Deprecated("ref_constituencies")
    ref_constituencies()
}

#' @export
#' @rdname mnis_reference
ref_constituency_areas <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyAreas/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ConstituencyAreas)

    names(x) <- sub("ConstituencyArea.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ConstituencyAreas <- function() {
    .Deprecated("ref_constituency_areas")
    ref_constituency_areas()
}

#' @export
#' @rdname mnis_reference
ref_constituency_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ConstituencyTypes)

    names(x) <- sub("ConstituencyType.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ConstituencyTypes <- function() {
    .Deprecated("ref_constituency_types")
    ref_constituency_types()
}
#' @export
#' @rdname mnis_reference
ref_countries <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Countries/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Countries)

    names(x) <- sub("Country.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Countries <- function() {
    .Deprecated("ref_countries")
    ref_countries()
}

#' @export
#' @rdname mnis_reference
ref_departments <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Departments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Departments)

    names(x) <- sub("Department.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Departments <- function() {
    .Deprecated("ref_departments")
    ref_departments()
}

#' @export
#' @rdname mnis_reference
ref_disqualification_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/DisqualificationTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$DisqualificationTypes)

    names(x) <- sub("DisqualificationType.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_DisqualificationTypes <- function() {
    .Deprecated("ref_disqualification_types")
    ref_disqualification_types()
}

#' @export
#' @rdname mnis_reference
ref_elections <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Elections/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Elections)

    names(x) <- sub("Election.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Elections <- function() {
    .Deprecated("ref_elections")
    ref_elections()
}

#' @export
#' @rdname mnis_reference
ref_election_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ElectionTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ElectionTypes)

    names(x) <- sub("ElectionType.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ElectionTypes <- function() {
    .Deprecated("ref_election_types")
    ref_election_types()
}

#' @export
#' @rdname mnis_reference
ref_end_reasons <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/EndReasons/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$EndReasons)

    names(x) <- sub("EndReason.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_EndReasons <- function() {
    .Deprecated("ref_end_reasons")
    ref_end_reasons()
}

#' @export
#' @rdname mnis_reference
ref_experience_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ExperienceTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ExperienceTypes)

    names(x) <- sub("ExperienceType.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ExperienceTypes <- function() {
    .Deprecated("ref_experience_types")
    ref_experience_types()
}

#' @export
#' @rdname mnis_reference
ref_government_post_departments <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPostDepartments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$GovernmentPostDepartments)

    names(x) <- sub("GovernmentPostDepartment.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_GovernmentPostDepartments <- function() {
    .Deprecated("ref_government_post_departments")
    ref_government_post_departments()
}

#' @export
#' @rdname mnis_reference
ref_government_posts <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$GovernmentPosts)

    names(x) <- sub("GovernmentPost.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_GovernmentPosts <- function() {
    .Deprecated("ref_government_posts")
    ref_government_posts()
}

#' @export
#' @rdname mnis_reference
ref_government_ranks <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$GovernmentRanks)

    names(x) <- sub("GovernmentRank.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_GovernmentRanks <- function() {
    .Deprecated("ref_government_ranks")
    ref_government_ranks()
}

#' @export
#' @rdname mnis_reference
ref_honourary_prefixes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonouraryPrefixes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$HonouraryPrefixes)

    names(x) <- sub("HonouraryPrefix.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_HonouraryPrefixes <- function() {
    .Deprecated("ref_honourary_prefixes")
    ref_honourary_prefixes()
}

#' @export
#' @rdname mnis_reference
ref_honour_lists <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonourLists/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$HonourLists)

    names(x) <- sub("HonourList.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_HonourLists <- function() {
    .Deprecated("ref_honour_lists")
    ref_honour_lists()
}

#' @export
#' @rdname mnis_reference
ref_honours <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Honours/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Honours)

    names(x) <- sub("Honour.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Honours <- function() {
    .Deprecated("ref_honours")
    ref_honours()
}

#' @export
#' @rdname mnis_reference
ref_interest_categories <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/InterestCategories/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$InterestCategories)

    names(x) <- sub("InterestCategory.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_InterestCategories <- function() {
    .Deprecated("ref_interest_categories")
    ref_interest_categories()
}

#' @export
#' @rdname mnis_reference
ref_lords_membership_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsMembershipTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$LordsMembershipTypes)

    names(x) <- sub("LordsMembershipType.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_LordsMembershipTypes <- function() {
    .Deprecated("ref_lords_membership_types")
    ref_lords_membership_types()
}

#' @export
#' @rdname mnis_reference
ref_lords_ranks <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$LordsRanks)

    names(x) <- sub("LordsRank.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_LordsRanks <- function() {
    .Deprecated("ref_lords_ranks")
    ref_lords_ranks()
}

#' @export
#' @rdname mnis_reference
ref_opposition_post_departments <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPostDepartments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$OppositionPostDepartments)

    names(x) <- sub("OppositionPostDepartment.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_OppositionPostDepartments <- function() {
    .Deprecated("ref_opposition_post_departments")
    ref_opposition_post_departments()
}

#' @export
#' @rdname mnis_reference
ref_opposition_posts <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$OppositionPosts)

    names(x) <- sub("OppositionPost.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_OppositionPosts <- function() {
    .Deprecated("ref_opposition_posts")
    ref_opposition_posts()
}

#' @export
#' @rdname mnis_reference
ref_opposition_ranks <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$OppositionRanks)

    names(x) <- sub("OppositionRank.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_OppositionRanks <- function() {
    .Deprecated("ref_opposition_ranks")
    ref_opposition_ranks()
}

#' @export
#' @rdname mnis_reference
ref_other_parliaments <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OtherParliaments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$OtherParliaments)

    names(x) <- sub("OtherParliament.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_OtherParliaments <- function() {
    .Deprecated("ref_other_parliaments")
    ref_other_parliaments()
}

#' @export
#' @rdname mnis_reference
ref_parliamentary_posts <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ParliamentaryPosts)

    names(x) <- sub("ParliamentaryPost.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ParliamentaryPosts <- function() {
    .Deprecated("ref_parliamentary_posts")
    ref_parliamentary_posts()
}

#' @export
#' @rdname mnis_reference
ref_parliamentary_ranks <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ParliamentaryRanks)

    names(x) <- sub("ParliamentRanks.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ParliamentaryRanks <- function() {
    .Deprecated("ref_parliamentary_ranks")
    ref_parliamentary_ranks()
}

#' @export
#' @rdname mnis_reference
ref_parliament_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ParliamentTypes)

    names(x) <- sub("ParliamentType.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ParliamentTypes <- function() {
    .Deprecated("ref_parliament_types")
    ref_parliament_types()
}

#' @export
#' @rdname mnis_reference
ref_parties <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Parties/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Parties)

    names(x) <- sub("Party.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Parties <- function() {
    .Deprecated("ref_parties")
    ref_parties()
}

#' @export
#' @rdname mnis_reference
ref_party_sub_types <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PartySubTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.list(got$PartySubTypes$PartySubType)

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_PartySubTypes <- function() {
    .Deprecated("ref_party_sub_types")
    ref_party_sub_types()
}

#' @export
#' @rdname mnis_reference
ref_photo_outputs <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PhotoOutputs/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$PhotoOutputs)

    names(x) <- sub("PhotoOutput.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_PhotoOutputs <- function() {
    .Deprecated("ref_photo_outputs")
    ref_photo_outputs()
}

#' @export
#' @rdname mnis_reference
ref_statuses <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Statuses/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Statuses)

    names(x) <- sub("Status.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Statuses <- function() {
    .Deprecated("ref_statuses")
    ref_statuses()
}


#' @export
#' @rdname mnis_reference
ref_titles <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Titles/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Titles)

    names(x) <- sub("Title.", "", names(x))

    x

}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Titles <- function() {
    .Deprecated("ref_titles")
    ref_titles()
}
