
#' mnis_additional
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame. Variable descriptions are taken from the mnis website. The API provides lengthy and complicated variable names, and the functions make some attempts to tidy up those names. To disable this feature, include tidy = TRUE in the function.
#' @param ID The ID number of the member. Defaults to NULL. If NULL, does not return any data.
#' @param mnis_id Request based on the default membership ID scheme.
#' @param ref_dods Request based on the DODS membership ID scheme. Defaults to FALSE.
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

    x <- c("mnis_full_biog()", "mnis_basic_details()", "mnis_biography_entries()", "mnis_committees()", "mnis_addresses()", "mnis_constituencies()", "mnis_elections_contested()", "mnis_experiences()", "mnis_government_posts()", "mnis_honours()", "mnis_house_memberships()", "mnis_statuses()", "mnis_staff()", "mnis_interests()", "mnis_knownas()", "mnis_maiden_speeches()", "mnis_opposition_posts()", "mnis_other_parliaments()", "mnis_parliamentary_posts()","mnis_parties()", "mnis_preferred_names()")
    message("All Available Additional Information Functions:")

    x
}

#' @export
#' @rdname mnis_additional
mnis_basic_details <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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

    } else {

        x

    }

}


#' @export
#' @rdname mnis_additional
#' @usage NULL
mnis_BasicDetails <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_basic_details")
    mnis_basic_details(ID = ID, mnis_id = mnis_id, ref_dods = refDods, tidy = tidy)
}


#' @export
#' @rdname mnis_additional

mnis_biography_entries <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_BiographyEntries <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_biography_entries")
    mnis_biography_entries(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_committees <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Committees <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_committees")
    mnis_committees(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_addresses <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Addresses <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_addresses")
    mnis_addresses(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_constituencies <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Constituencies <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_constituencies")
    mnis_constituencies(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_elections_contested <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_ElectionsContested <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_elections_contested")
    mnis_elections_contested(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_experiences <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Experiences <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_experiences")
    mnis_experiences(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_government_posts <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_GovernmentPosts <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_government_posts")
    mnis_government_posts(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_honours <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Honours <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_honours")
    mnis_honours(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_house_memberships <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_HouseMemberships <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_house_memberships")
    mnis_house_memberships(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional

mnis_statuses <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Statuses <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_statuses")
    mnis_statuses(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional

mnis_staff <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Staff <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_staff")
    mnis_staff(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_interests <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Interests <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_interests")
    mnis_interests(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_known_as <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_KnownAs <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_known_as")
    mnis_known_as(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_maiden_speeches <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_MaidenSpeeches <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_maiden_speeches")
    mnis_maiden_speeches(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional

mnis_opposition_posts <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_OppositionPosts <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_opposition_posts")
    mnis_opposition_posts(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional

mnis_other_parliaments <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_OtherParliaments <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_other_parliaments")
    mnis_other_parliaments(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional
mnis_parliamentary_posts <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }


    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_ParliamentaryPosts <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_parliamentary_posts")
    mnis_parliamentary_posts(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional

mnis_parties <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_Parties <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {
    .Defunct("mnis_parties")
    mnis_parties(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}

#' @export
#' @rdname mnis_additional

mnis_preferred_names <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    if (is.null(ID) == TRUE) {
        stop("ID cannot be empty", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
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
mnis_PreferredNames <- function() {
    .Defunct("mnis_preferred_names")
    mnis_preferred_names(ID = ID, mnis_id = mnis_id, ref_dods = ref_dods)
}
