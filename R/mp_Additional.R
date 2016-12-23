
#' mp_additional
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame. Variable descriptions are taken from the mnis website.
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme.
#' @param refDods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @keywords mnis
#' @examples \dontrun{
#' x <- mp_BasicDetails(172)
#'
#' }
#' @export
#' @rdname mp_Additional
#' @seealso \code{\link{mp_FullBiog}} \code{\link{mp_Extra}}


#' @rdname mp_Additional

mp_BasicDetails <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/BasicDetails")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    x
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}

#' @rdname mp_Additional

mp_BiographyEntries <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/BiographyEntries")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_Committees <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Committees")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

mp_Addresses <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Addresses")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_Constituencies <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Constituencies")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_ElectionsContested <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/ElectionsContested")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

mp_Experiences <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Experiences")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

mp_GovernmentPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/GovernmentPosts")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

mp_Honours <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Honours")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

mp_HouseMemberships <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/HouseMemberships")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

mp_Statuses <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Statuses")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}

#' @rdname mp_Additional

mp_Staff <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Staff")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_Interests <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Interests")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    
    x
    
}


#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_KnownAs <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/KnownAs")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_MaidenSpeeches <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/MaidenSpeeches")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}



#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_OppositionPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/OppositionPosts")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_OtherParliaments <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/OtherParliaments")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

mp_ParliamentaryPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/ParliamentaryPosts")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

mp_Parties <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/Parties")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}


#' @rdname mp_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mp_PreferredNames <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/PreferredNames")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    names(x) <- gsub("@", "", names(x))
    
    names(x) <- gsub("#", "", names(x))
    
    names(x) <- gsub("Members.Member.", "", names(x))
    
    x
    
}
