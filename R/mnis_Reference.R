
#' mnis_Reference
#'
#' A series of functions to return reference data. This data is useful for providing parameters for other function calls. The functions do not accept any arguments.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' ref_AddressTypes()
#' # The types of addresses available in member's contact details.
#' # Includes websites and social media, as well as physical addresses.
#'
#' ref_AnsweringBodies()
#' # The bodies that members' can address questions to.
#'
#' ref_Areas()
#' # Geographic areas.
#'
#' ref_AreaTypes()
#' # Identifiers for grouping areas (e.g. borough constituencies).
#'
#' ref_BiographyCategories()
#' # Member biography categories.
#'
#' ref_Cabinets()
#' # Connections that a member has to the cabinet or shadow cabinet.
#'
#' ref_Committees()
#' # Identifier for parliamentary committees.
#'
#' ref_CommitteeTypes()
#' # Types of parliamentary committees.
#'
#' ref_Constituencies()
#' # All constituencies.
#'
#' ref_ConstituencyAreas()
#' # The links between constituencies and constituency areas.
#'
#' ref_ConstituencyTypes()
#' # Constituency categories.
#'
#' ref_Countries()
#' # List of countries that could be listed as members' birthplace.
#'
#' ref_Departments()
#' # Government and opposition departments.
#'
#' ref_DisqualificationTypes()
#' # Types of ways members can be disqualified from sitting in the House.
#'
#' ref_Elections()
#' # Codes of general and by-elections.
#'
#' ref_ElectionTypes()
#' # Election categories.
#'
#' ref_EndReasons()
#' # Reasons a member may leave the House of Lords or the House of Commons.
#'
#' ref_ExperienceTypes()
#' # Types of non-parliamentary experience members can list.
#'
#' ref_GovernmentPostDepartments()
#' # All deparments that can contain government posts.
#'
#' ref_GovernmentPosts()
#' # All government posts.
#'
#' ref_GovernmentRanks()
#' # All government post ranks.
#'
#' ref_HonouraryPrefixes()
#' # The types of honourary prefixes for members.
#'
#' ref_HonourLists()
#' # The types of honour lists that a member may be honoured in.
#'
#' ref_Honours()
#' # The different honours available to members.
#'
#' ref_InterestCategories()
#' # The categories available for reporting financial interests.
#'
#' ref_LordsMembershipTypes()
#' # Different types of membership of the House of Lords.
#'
#' ref_LordsRanks()
#' # Ranks that peers may hold.
#'
#' ref_OppositionPostDepartments()
#' # The link between opposition posts and the government department they shadow.
#'
#' ref_OppositionPosts()
#' # Opposition posts.
#'
#' ref_OppositionRanks()
#' # How opposition posts are ranked.
#'
#' ref_OtherParliaments()
#' # Other parliaments that a member may have sat in.
#'
#' ref_ParliamentaryPosts()
#' # The different parliamentary posts available.
#'
#' ref_ParliamentaryRanks()
#' # How those parliamentary posts are ranked.
#'
#' ref_ParliamentTypes()
#' # Types of parliaments that parliamentary data may link to.
#'
#' ref_Parties()
#' # All parties that members can be affiliated with.
#'
#' ref_PartySubTypes()
#' # Sub-types of parties.
#'
#' ref_PhotoOutputs()
#' # Outputs that a photo of a member may be linked to.
#'
#' ref_Statuses()
#' # A member's possible current status in the House.
#'
#' ref_titles()
#' # Salutory titles.
#'
#' mnis_Reference()
#' # Returns a list of all possible reference functions.
#' }
#'
#' @export
#' @export
#' @rdname mnis_Reference
mnis_Reference <- function() {
    
    x <- c("ref_AddressTypes()", "ref_AnsweringBodies()", "ref_Areas()", "ref_AreaTypes()", "ref_BiographyCategories()", 
        "ref_Cabinets()", "ref_Committees()", "ref_CommitteeTypes()", "ref_Constituencies()", "ref_ConstituencyAreas()", 
        "ref_ConstituencyTypes()", "ref_Countries()", "ref_Departments()", "ref_DisqualificationTypes()", "ref_Elections()", 
        "ref_ElectionTypes()", "ref_EndReasons()", "ref_ExperienceTypes()", "ref_GovernmentPostDepartments()", "ref_GovernmentPosts()", 
        "ref_GovernmentRanks()", "ref_HonouraryPrefixes()", "ref_HonourLists()", "ref_Honours()", "ref_InterestCategories()", 
        "ref_LordsMembershipTypes()", "ref_LordsRanks()", "ref_OppositionPostDepartments()", "ref_OppositionPosts()", 
        "ref_OppositionRanks()", "ref_OtherParliaments()", "ref_ParliamentaryPosts()", "ref_ParliamentaryRanks()", 
        "ref_ParliamentTypes()", "ref_Parties()", "ref_PartySubTypes()", "ref_PhotoOutputs()", "ref_Statuses()", 
        "ref_Titles()")
    
    message("All Available Reference Functions:")
    
    x
}

#' @export
#' @rdname mnis_Reference
ref_AddressTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_AnsweringBodies <- function() {
    
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
#' @rdname mnis_Reference
ref_Areas <- function() {
    
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
#' @rdname mnis_Reference
ref_AreaTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_BiographyCategories <- function() {
    
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
#' @rdname mnis_Reference
ref_Cabinets <- function() {
    
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
#' @rdname mnis_Reference
ref_Committees <- function() {
    
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
#' @rdname mnis_Reference
ref_CommitteeTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_Constituencies <- function() {
    
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
#' @rdname mnis_Reference
ref_ConstituencyAreas <- function() {
    
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
#' @rdname mnis_Reference
ref_ConstituencyTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_Countries <- function() {
    
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
#' @rdname mnis_Reference
ref_Departments <- function() {
    
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
#' @rdname mnis_Reference
ref_DisqualificationTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_Elections <- function() {
    
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
#' @rdname mnis_Reference
ref_ElectionTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_EndReasons <- function() {
    
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
#' @rdname mnis_Reference
ref_ExperienceTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_GovernmentPostDepartments <- function() {
    
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
#' @rdname mnis_Reference
ref_GovernmentPosts <- function() {
    
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
#' @rdname mnis_Reference
ref_GovernmentRanks <- function() {
    
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
#' @rdname mnis_Reference
ref_HonouraryPrefixes <- function() {
    
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
#' @rdname mnis_Reference
ref_HonourLists <- function() {
    
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
#' @rdname mnis_Reference
ref_Honours <- function() {
    
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
#' @rdname mnis_Reference
ref_InterestCategories <- function() {
    
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
#' @rdname mnis_Reference
ref_LordsMembershipTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_LordsRanks <- function() {
    
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
#' @rdname mnis_Reference
ref_OppositionPostDepartments <- function() {
    
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
#' @rdname mnis_Reference
ref_OppositionPosts <- function() {
    
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
#' @rdname mnis_Reference
ref_OppositionRanks <- function() {
    
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
#' @rdname mnis_Reference
ref_OtherParliaments <- function() {
    
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
#' @rdname mnis_Reference
ref_ParliamentaryPosts <- function() {
    
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
#' @rdname mnis_Reference
ref_ParliamentaryRanks <- function() {
    
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
#' @rdname mnis_Reference
ref_ParliamentTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_Parties <- function() {
    
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
#' @rdname mnis_Reference
ref_PartySubTypes <- function() {
    
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
#' @rdname mnis_Reference
ref_PhotoOutputs <- function() {
    
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
#' @rdname mnis_Reference
ref_Statuses <- function() {
    
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
#' @rdname mnis_Reference
ref_Titles <- function() {
    
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
