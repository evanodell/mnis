
#' mnis_additional
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame. Variable descriptions are taken from the mnis website. The API provides lengthy and complicated variable names, and the functions make some attempts to tidy up those names. To disable this feature, include tidy = TRUE in the function.
#' @param ID The ID number of the member. Defaults to NULL. If NULL, does not return any data.
#' @param mem_id Request based on the default membership ID scheme.
#' @param refDods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @param tidy Fix the variable names in the data frame to remove '@' characters and superfluous text. Defaults to TRUE.
#' @keywords mnis
#' @examples \dontrun{
#' x <- mnis_basic_details(172)
#'
#' }
#' @export
#' @rdname mnis_additional
#' @seealso \code{\link{mnis_full_biog}} \code{\link{mnis_extra}}

#' @export
#' @rdname mnis_additional
mnis_additional <- function() {

    x <- c("mnis_fullbiog()", "mnis_basic_details()", "mnis_biography_entries()", "mnis_committees()", "mnis_addresses()",
        "mnis_constituencies()", "mnis_elections_contested()", "mnis_experiences()", "mnis_government_posts()", "mnis_honours()",
        "mnis_house_memberships()", "mnis_statuses()", "mnis_staff()", "mnis_interests()", "mnis_knownas()", "mnis_maiden_speeches()",
        "mnis_opposition_posts()", "mnis_other_parliaments()", "mnis_parliamentary_posts()", "mnis_parties()", "mnis_preferred_names()")
    message("All Available Additional Information Functions:")

    x
}

#' @export
#' @rdname mnis_additional
mnis_basic_details <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_BasicDetails <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_basic_details")
    mnis_basic_details(ID = ID, mem_id = mem_id, refDods = refDods, tidy = tidy)
}


#' @export
#' @rdname mnis_additional

mnis_biography_entries <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_BiographyEntries <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_biography_entries")
    mnis_biography_entries(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_committees <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Committees <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_committees")
    mnis_committees(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_addresses <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Addresses <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_addresses")
    mnis_addresses(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_constituencies <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}
#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Constituencies <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_constituencies")
    mnis_constituencies(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_elections_contested <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_ElectionsContested <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_elections_contested")
    mnis_elections_contested(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_experiences <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Experiences <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_experiences")
    mnis_experiences(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_government_posts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_GovernmentPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_government_posts")
    mnis_government_posts(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_honours <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Honours <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_honours")
    mnis_honours(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_house_memberships <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_HouseMemberships <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_house_memberships")
    mnis_house_memberships(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional

mnis_statuses <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Statuses <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_statuses")
    mnis_statuses(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional

mnis_staff <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Staff <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_staff")
    mnis_staff(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_interests <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    x <- as.list(got$Members$Member)

    x <- unlist(x)

    x <- t(x)

    x <- as.data.frame(x)

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Interests <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_interests")
    mnis_interests(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_known_as <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_KnownAs <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_known_as")
    mnis_known_as(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_maiden_speeches <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_MaidenSpeeches <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_maiden_speeches")
    mnis_maiden_speeches(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional

mnis_opposition_posts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_OppositionPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_opposition_posts")
    mnis_opposition_posts(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional

mnis_other_parliaments <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_OtherParliaments <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_other_parliaments")
    mnis_other_parliaments(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional
mnis_parliamentary_posts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_ParliamentaryPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_parliamentary_posts")
    mnis_parliamentary_posts(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional

mnis_parties <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

        x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_Parties <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_parties")
    mnis_parties(ID = ID, mem_id = mem_id, refDods = refDods)
}

#' @export
#' @rdname mnis_additional

mnis_preferred_names <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

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

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

        x

    } else {

        x

    }

}

#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_PreferredNames <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_preferred_names")
    mnis_preferred_names(ID = ID, mem_id = mem_id, refDods = refDods)
}
