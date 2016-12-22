
#' mnis_additional
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame. Variable descriptions are taken from the mnis website.
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme.
#' @param refDods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @keywords mnis
#' @examples \dontrun{
#' x <- mnis_BasicDetails(172)
#'
#' }
#' @export
#' @rdname mnis_Additional
#' @seealso \code{\link{mnis_FullBiog}} \code{\link{mnis_Extra}}


#' @rdname mnis_Additional

mnis_BasicDetails <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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

#' @rdname mnis_Additional

mnis_BiographyEntries <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_Committees <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

mnis_Addresses <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_Constituencies <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_ElectionsContested <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

mnis_Experiences <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

mnis_GovernmentPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

mnis_Honours <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

mnis_HouseMemberships <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

mnis_Statuses <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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

#' @rdname mnis_Additional

mnis_Staff <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_Interests <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_KnownAs <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_MaidenSpeeches <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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



#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_OppositionPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_OtherParliaments <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

mnis_ParliamentaryPosts <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

mnis_Parties <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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


#' @rdname mnis_Additional

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_PreferredNames <- function(ID = NULL, mem_id = TRUE, refDods = FALSE) {

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
