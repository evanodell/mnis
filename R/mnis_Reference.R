
#' mnis_Reference
#'
#' A series of functions to return reference data. This data is useful for providing parameters for other function calls. The functions do not accept any arguments.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- ref_AddressTypes()
#'
#' x <- ref_AnsweringBodies()
#'
#' }
#'
#' @export
#' @rdname mnis_Reference


#' @rdname mnis_Reference
ref_AddressTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AddressTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$AddressTypes)

}

#' @rdname mnis_Reference
ref_AnsweringBodies <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AnsweringBodies/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$AnsweringBodies)

}

#' @rdname mnis_Reference
ref_Areas <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Areas/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Areas)

}

#' @rdname mnis_Reference
ref_AreaTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AreaTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$AreaTypes)

}

#' @rdname mnis_Reference
ref_BiographyCategories <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/BiographyCategories/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$BiographyCategories)

}

#' @rdname mnis_Reference
ref_Cabinets <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Cabinets/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Cabinets)

}

#' @rdname mnis_Reference
ref_Committees <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Committees/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Committees)

}

#' @rdname mnis_Reference
ref_CommitteeTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/CommitteeTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$CommitteeTypes)

}

#' @rdname mnis_Reference
ref_Constituencies <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Constituencies/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Constituencies)

}

#' @rdname mnis_Reference
ref_ConstituencyAreas <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyAreas/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ConstituencyAreas)

}

#' @rdname mnis_Reference
ref_ConstituencyTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ConstituencyTypes)

}

#' @rdname mnis_Reference
ref_Countries <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Countries/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Countries)

}

#' @rdname mnis_Reference
ref_Departments <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Departments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Departments)

}

#' @rdname mnis_Reference
ref_DisqualificationTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/DisqualificationTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$DisqualificationTypes)

}

#' @rdname mnis_Reference
ref_Elections <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Elections/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Elections)

}

#' @rdname mnis_Reference
ref_ElectionTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ElectionTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ElectionTypes)

}

#' @rdname mnis_Reference
ref_EndReasons <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/EndReasons/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$EndReasons)

}

#' @rdname mnis_Reference
ref_ExperienceTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ExperienceTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ExperienceTypes)

}
#' @rdname mnis_Reference
ref_GovernmentPostDepartments <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPostDepartments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$GovernmentPostDepartments)

}
#' @rdname mnis_Reference
ref_GovernmentPosts <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$GovernmentPosts)

}
#' @rdname mnis_Reference
ref_GovernmentRanks <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$GovernmentRanks)

}
#' @rdname mnis_Reference
ref_HonouraryPrefixes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonouraryPrefixes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$HonouraryPrefixes)

}
#' @rdname mnis_Reference
ref_HonourLists <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonourLists/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$HonourLists)

}
#' @rdname mnis_Reference
ref_Honours <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Honours/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Honours)

}
#' @rdname mnis_Reference
ref_InterestCategories <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/InterestCategories/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$InterestCategories)

}
#' @rdname mnis_Reference
ref_LordsMembershipTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsMembershipTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$LordsMembershipTypes)

}
#' @rdname mnis_Reference
ref_LordsRanks <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$LordsRanks)

}
#' @rdname mnis_Reference
ref_OppositionPostDepartments <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPostDepartments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$OppositionPostDepartments)

}
#' @rdname mnis_Reference
ref_OppositionPosts <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$OppositionPosts)

}
#' @rdname mnis_Reference
ref_OppositionRanks <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$OppositionRanks)

}
#' @rdname mnis_Reference
ref_OtherParliaments <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OtherParliaments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$OtherParliaments)

}
#' @rdname mnis_Reference
ref_ParliamentaryPosts <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ParliamentaryPosts)

}
#' @rdname mnis_Reference
ref_ParliamentaryRanks <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ParliamentaryRanks)

}
#' @rdname mnis_Reference
ref_ParliamentTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$ParliamentTypes)

}
#' @rdname mnis_Reference
ref_Parties <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Parties/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Parties)

}
#' @rdname mnis_Reference
ref_PartySubTypes <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PartySubTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$PartySubTypes)

}
#' @rdname mnis_Reference
ref_PhotoOutputs <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PhotoOutputs/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$PhotoOutputs)

}
#' @rdname mnis_Reference
ref_Statuses <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Statuses/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Statuses)

}

#' @rdname mnis_Reference
ref_titles <- function() {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Titles/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

    x <- as.data.frame(got$Titles)

}
