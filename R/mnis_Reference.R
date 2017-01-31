
#' mnis_reference
#'
#' A series of functions to return reference data. This data is useful for providing parameters for other function calls. The functions do not accept any arguments.
#' @param clean Fix the variable names in the data frame to remove special characters and superfluous text, and converts the variable names to all lower case with underscores between each word. Defaults to TRUE.
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
        "ref_election_types()", "ref_end_reasons()", "ref_experience_types()", "ref_government_post_departments()", "ref_government_posts()", 
        "ref_government_ranks()", "ref_honourary_prefixes()", "ref_honour_lists()", "ref_honours()", "ref_interest_categories()", 
        "ref_lords_membership_types()", "ref_lords_ranks()", "ref_opposition_post_departments()", "ref_opposition_posts()", 
        "ref_opposition_ranks()", "ref_other_parliaments()", "ref_parliamentary_posts()", "ref_parliamentary_ranks()", 
        "ref_parliament_types()", "ref_parties()", "ref_party_sub_types()", "ref_photo_outputs()", "ref_statuses()", "ref_titles()")
    
    message("All Available Reference Functions:")
    
    x
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
mnis_Reference <- function(clean = TRUE) {
    .Deprecated("mnis_reference")
    mnis_reference()
}

#' @export
#' @rdname mnis_reference
ref_address_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AddressTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$AddressTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_AddressTypes <- function(clean = TRUE) {
    .Deprecated("ref_address_types")
    ref_address_types()
}

#' @export
#' @rdname mnis_reference
ref_answering_bodies <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AnsweringBodies/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$AnsweringBodies)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}
#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_AnsweringBodies <- function(clean = TRUE) {
    .Deprecated("ref_answering_bodies")
    ref_answering_bodies()
}

#' @export
#' @rdname mnis_reference
ref_areas <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Areas/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Areas)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}
#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Areas <- function(clean = TRUE) {
    .Deprecated("ref_areas")
    ref_areas(clean = clean)
}

#' @export
#' @rdname mnis_reference
ref_area_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AreaTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$AreaTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}
#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_AreaTypes <- function(clean = TRUE) {
    .Deprecated("ref_area_types")
    ref_area_types()
}

#' @export
#' @rdname mnis_reference
ref_biography_categories <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/BiographyCategories/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$BiographyCategories)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_BiographyCategories <- function(clean = TRUE) {
    .Deprecated("ref_biography_categories")
    ref_biography_categories()
}

#' @export
#' @rdname mnis_reference
ref_cabinets <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Cabinets/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Cabinets)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}
#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Cabinets <- function(clean = TRUE) {
    .Deprecated("ref_cabinets")
    ref_cabinets()
}

#' @export
#' @rdname mnis_reference
ref_committees <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Committees/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Committees)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Committees <- function(clean = TRUE) {
    .Deprecated("ref_committees")
    ref_committees()
}

#' @export
#' @rdname mnis_reference
ref_committee_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/CommitteeTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$CommitteeTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_CommitteeTypes <- function(clean = TRUE) {
    .Deprecated("ref_committee_types")
    ref_committee_types()
}

#' @export
#' @rdname mnis_reference
ref_constituencies <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Constituencies/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Constituencies)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Constituencies <- function(clean = TRUE) {
    .Deprecated("ref_constituencies")
    ref_constituencies()
}

#' @export
#' @rdname mnis_reference
ref_constituency_areas <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyAreas/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$ConstituencyAreas)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ConstituencyAreas <- function(clean = TRUE) {
    .Deprecated("ref_constituency_areas")
    ref_constituency_areas()
}

#' @export
#' @rdname mnis_reference
ref_constituency_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$ConstituencyTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ConstituencyTypes <- function(clean = TRUE) {
    .Deprecated("ref_constituency_types")
    ref_constituency_types()
}
#' @export
#' @rdname mnis_reference
ref_countries <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Countries/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Countries)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Countries <- function(clean = TRUE) {
    .Deprecated("ref_countries")
    ref_countries()
}

#' @export
#' @rdname mnis_reference
ref_departments <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Departments/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Departments)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Departments <- function(clean = TRUE) {
    .Deprecated("ref_departments")
    ref_departments()
}

#' @export
#' @rdname mnis_reference
ref_disqualification_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/DisqualificationTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$DisqualificationTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_DisqualificationTypes <- function(clean = TRUE) {
    .Deprecated("ref_disqualification_types")
    ref_disqualification_types()
}

#' @export
#' @rdname mnis_reference
ref_elections <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Elections/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Elections)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Elections <- function(clean = TRUE) {
    .Deprecated("ref_elections")
    ref_elections()
}

#' @export
#' @rdname mnis_reference
ref_election_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ElectionTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$ElectionTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ElectionTypes <- function(clean = TRUE) {
    .Deprecated("ref_election_types")
    ref_election_types()
}

#' @export
#' @rdname mnis_reference
ref_end_reasons <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/EndReasons/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$EndReasons)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_EndReasons <- function(clean = TRUE) {
    .Deprecated("ref_end_reasons")
    ref_end_reasons()
}

#' @export
#' @rdname mnis_reference
ref_experience_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ExperienceTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$ExperienceTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ExperienceTypes <- function(clean = TRUE) {
    .Deprecated("ref_experience_types")
    ref_experience_types()
}

#' @export
#' @rdname mnis_reference
ref_government_post_departments <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPostDepartments/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$GovernmentPostDepartments)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_GovernmentPostDepartments <- function(clean = TRUE) {
    .Deprecated("ref_government_post_departments")
    ref_government_post_departments()
}

#' @export
#' @rdname mnis_reference
ref_government_posts <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPosts/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$GovernmentPosts)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_GovernmentPosts <- function(clean = TRUE) {
    .Deprecated("ref_government_posts")
    ref_government_posts()
}

#' @export
#' @rdname mnis_reference
ref_government_ranks <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentRanks/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$GovernmentRanks)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_GovernmentRanks <- function(clean = TRUE) {
    .Deprecated("ref_government_ranks")
    ref_government_ranks()
}

#' @export
#' @rdname mnis_reference
ref_honourary_prefixes <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonouraryPrefixes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$HonouraryPrefixes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_HonouraryPrefixes <- function(clean = TRUE) {
    .Deprecated("ref_honourary_prefixes")
    ref_honourary_prefixes()
}

#' @export
#' @rdname mnis_reference
ref_honour_lists <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonourLists/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$HonourLists)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_HonourLists <- function(clean = TRUE) {
    .Deprecated("ref_honour_lists")
    ref_honour_lists()
}

#' @export
#' @rdname mnis_reference
ref_honours <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Honours/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Honours)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Honours <- function(clean = TRUE) {
    .Deprecated("ref_honours")
    ref_honours()
}

#' @export
#' @rdname mnis_reference
ref_interest_categories <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/InterestCategories/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$InterestCategories)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_InterestCategories <- function(clean = TRUE) {
    .Deprecated("ref_interest_categories")
    ref_interest_categories()
}

#' @export
#' @rdname mnis_reference
ref_lords_membership_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsMembershipTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$LordsMembershipTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_LordsMembershipTypes <- function(clean = TRUE) {
    .Deprecated("ref_lords_membership_types")
    ref_lords_membership_types()
}

#' @export
#' @rdname mnis_reference
ref_lords_ranks <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsRanks/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$LordsRanks)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_LordsRanks <- function(clean = TRUE) {
    .Deprecated("ref_lords_ranks")
    ref_lords_ranks()
}

#' @export
#' @rdname mnis_reference
ref_opposition_post_departments <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPostDepartments/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$OppositionPostDepartments)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_OppositionPostDepartments <- function(clean = TRUE) {
    .Deprecated("ref_opposition_post_departments")
    ref_opposition_post_departments()
}

#' @export
#' @rdname mnis_reference
ref_opposition_posts <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPosts/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$OppositionPosts)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_OppositionPosts <- function(clean = TRUE) {
    .Deprecated("ref_opposition_posts")
    ref_opposition_posts()
}

#' @export
#' @rdname mnis_reference
ref_opposition_ranks <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionRanks/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$OppositionRanks)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_OppositionRanks <- function(clean = TRUE) {
    .Deprecated("ref_opposition_ranks")
    ref_opposition_ranks()
}

#' @export
#' @rdname mnis_reference
ref_other_parliaments <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OtherParliaments/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$OtherParliaments)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_OtherParliaments <- function(clean = TRUE) {
    .Deprecated("ref_other_parliaments")
    ref_other_parliaments()
}

#' @export
#' @rdname mnis_reference
ref_parliamentary_posts <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryPosts/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$ParliamentaryPosts)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ParliamentaryPosts <- function(clean = TRUE) {
    .Deprecated("ref_parliamentary_posts")
    ref_parliamentary_posts()
}

#' @export
#' @rdname mnis_reference
ref_parliamentary_ranks <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryRanks/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$ParliamentaryRanks)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ParliamentaryRanks <- function(clean = TRUE) {
    .Deprecated("ref_parliamentary_ranks")
    ref_parliamentary_ranks()
}

#' @export
#' @rdname mnis_reference
ref_parliament_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$ParliamentTypes)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_ParliamentTypes <- function(clean = TRUE) {
    .Deprecated("ref_parliament_types")
    ref_parliament_types()
}

#' @export
#' @rdname mnis_reference
ref_parties <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Parties/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Parties)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Parties <- function(clean = TRUE) {
    .Deprecated("ref_parties")
    ref_parties()
}

#' @export
#' @rdname mnis_reference
ref_party_sub_types <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PartySubTypes/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.list(got$PartySubTypes$PartySubType)
    
    x <- unlist(x)
    
    x <- t(x)
    
    x <- as.data.frame(x)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_PartySubTypes <- function(clean = TRUE) {
    .Deprecated("ref_party_sub_types")
    ref_party_sub_types()
}

#' @export
#' @rdname mnis_reference
ref_photo_outputs <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PhotoOutputs/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$PhotoOutputs)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_PhotoOutputs <- function(clean = TRUE) {
    .Deprecated("ref_photo_outputs")
    ref_photo_outputs()
}

#' @export
#' @rdname mnis_reference
ref_statuses <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Statuses/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Statuses)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
    
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Statuses <- function(clean = TRUE) {
    .Deprecated("ref_statuses")
    ref_statuses()
}


#' @export
#' @rdname mnis_reference
ref_titles <- function(clean = TRUE) {
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Titles/"
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    x <- as.data.frame(got$Titles)
    
    if (clean == TRUE) {
        
        x <- ref_clean(x)
        
    } else {
        
        x
        
    }
}

#' @export
#' @rdname mnis_reference
#' @usage NULL
ref_Titles <- function(clean = TRUE) {
    .Deprecated("ref_titles")
    ref_titles()
}
