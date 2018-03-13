
#' Additional member information
#'
#' A series of basic function for the API lookup. Each of these functions
#' accepts a member's ID and returns information; if no ID is given basic
#' information on all members of both houses is returned.
#'
#' All functions return basic details about the member (name, date of birth,
#' gender, constituency, party, IDs, current status, etc.), as well as any
#' available additional information requested by the specific function.
#'
#' @param ID The member ID. If \code{NULL}, function calls
#' \code{\link{mnis_all_members}} and returns basic information on all
#' members of both houses. Defaults to \code{NULL}.
#' @param ref_dods If \code{TRUE}, Request based on the DODS membership ID
#' scheme. If \code{FALSE}, requests data based on the default membership
#' ID scheme. Defaults to \code{FALSE}.
#' @param tidy If \code{TRUE}, fixes the variable names in the tibble to
#' remove non-alphanumeric characters and superfluous text, and convert to
#' a consistent style. Defaults to \code{TRUE}.
#' @param tidy_style The style to convert variable names to, if
#' \code{tidy=TRUE}. Accepts one of \code{'snake_case'}, \code{'camelCase'}
#' and \code{'period.case'}. Defaults to \code{'snake_case'}.
#' @return A tibble with the data corresponding to the
#' particular function called.
#' @export
#' @rdname mnis_additional
#'
#' @section \code{mnis_additional} functions:
#' \describe{
#' \item{\code{mnis_additional}}{Returns a character vector listing all function
#' options for \code{mnis_additional}}
#' \item{\code{mnis_basic_details}}{Basic biographical details
#' on a given Member}
#' \item{\code{mnis_biography_entries}}{Member biographical information (e.g.
#'  countries of interest, policy expertise etc...)}
#' \item{\code{mnis_committees}}{Committees a Member sits or has sat on as
#' well details on committee chairing}
#' \item{\code{mnis_addresses}}{Member address information (e.g. website,
#' twitter, consituency address etc...)}
#' \item{\code{mnis_constituencies}}{Constituencies a Member has represented}
#' \item{\code{mnis_elections_contested}}{Elections a Member has
#' contested but not won}
#' \item{\code{mnis_experiences}}{Non-parliamentary experience of a Member}
#' \item{\code{mnis_government_posts}}{Government posts a Member has held}
#' \item{\code{mnis_honours}}{Honours (e.g. MBE, OBE etc...) held by a Member}
#' \item{\code{mnis_house_memberships}}{House membership list of a Member}
#' \item{\code{mnis_statuses}}{Status history (e.g. suspensions and
#' disqualifications) for a Member}
#' \item{\code{mnis_staff}}{The staff employed by a Member}
#' \item{\code{mnis_interests}}{Registered (financial) interests
#' of a Member}
#' \item{\code{mnis_known_as}}{Details of names a Member has chosen to
#' be known as instead of their full title, only applicable to members
#' of the House of Lords}
#' \item{\code{mnis_maiden_speeches}}{Maiden speech dates for a Member}
#' \item{\code{mnis_opposition_posts}}{Opposition posts a Member has held}
#' \item{\code{mnis_other_parliaments}}{Other Parliaments that a Member
#' has held a membership of}
#' \item{\code{mnis_parliamentary_posts}}{Parliamentary posts
#' a Member has held}
#' \item{\code{mnis_parties}}{Party affiliations of a Member}
#' \item{\code{mnis_preferred_names}}{Full set of data about a
#' Members' name (e.g. surname, forename, Honorary prefixes, full
#' details of House of Lords title and rank if applicable, etc...)}
#' }
#' @seealso \code{\link{mnis_full_biog}}
#' @seealso \code{\link{mnis_extra}}
#' @examples \dontrun{
#' x <- mnis_basic_details(172)
#' }

mnis_additional <- function() {
  x <- c(
    "mnis_basic_details()",
    "mnis_biography_entries()",
    "mnis_committees()",
    "mnis_addresses()",
    "mnis_constituencies()",
    "mnis_elections_contested()",
    "mnis_experiences()",
    "mnis_government_posts()",
    "mnis_honours()",
    "mnis_house_memberships()",
    "mnis_statuses()",
    "mnis_staff()",
    "mnis_interests()",
    "mnis_known_as()",
    "mnis_maiden_speeches()",
    "mnis_opposition_posts()",
    "mnis_other_parliaments()",
    "mnis_parliamentary_posts()",
    "mnis_parties()",
    "mnis_preferred_names()"
  )

  message("All Available Additional Information Functions:")

  print(x)
}


#' @export
#' @rdname mnis_additional
mnis_basic_details <- function(ID = NULL, ref_dods = FALSE,
                               tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/BasicDetails"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}

#' @export
#' @rdname mnis_additional
mnis_biography_entries <- function(ID = NULL, ref_dods = FALSE,
                                   tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/BiographyEntries"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional
mnis_committees <- function(ID = NULL, ref_dods = FALSE,
                            tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Committees"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional
mnis_addresses <- function(ID = NULL, ref_dods = FALSE,
                           tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Addresses"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional
mnis_constituencies <- function(ID = NULL, ref_dods = FALSE,
                                tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Constituencies"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional
mnis_elections_contested <- function(ID = NULL, ref_dods = FALSE,
                                     tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/ElectionsContested"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional
mnis_experiences <- function(ID = NULL, ref_dods = FALSE,
                             tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Experiences"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional
mnis_government_posts <- function(ID = NULL, ref_dods = FALSE,
                                  tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/GovernmentPosts"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional
mnis_honours <- function(ID = NULL, ref_dods = FALSE,
                         tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Honours"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional
mnis_house_memberships <- function(ID = NULL, ref_dods = FALSE,
                                   tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/HouseMemberships"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}



#' @export
#' @rdname mnis_additional
mnis_statuses <- function(ID = NULL, ref_dods = FALSE,
                          tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Statuses"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional

mnis_staff <- function(ID = NULL, ref_dods = FALSE,
                       tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Staff"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}



#' @export
#' @rdname mnis_additional
mnis_interests <- function(ID = NULL, ref_dods = FALSE,
                           tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Interests"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}



#' @export
#' @rdname mnis_additional
mnis_known_as <- function(ID = NULL, ref_dods = FALSE,
                          tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/KnownAs"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}



#' @export
#' @rdname mnis_additional
mnis_maiden_speeches <- function(ID = NULL, ref_dods = FALSE,
                                 tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/MaidenSpeeches"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}



#' @export
#' @rdname mnis_additional
mnis_opposition_posts <- function(ID = NULL, ref_dods = FALSE,
                                  tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/OppositionPosts"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}



#' @export
#' @rdname mnis_additional

mnis_other_parliaments <- function(ID = NULL, ref_dods = FALSE,
                                   tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/OtherParliaments"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}



#' @export
#' @rdname mnis_additional
mnis_parliamentary_posts <- function(ID = NULL, ref_dods = FALSE,
                                     tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/ParliamentaryPosts"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}


#' @export
#' @rdname mnis_additional

mnis_parties <- function(ID = NULL, ref_dods = FALSE,
                         tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/Parties"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}

#' @export
#' @rdname mnis_additional
mnis_preferred_names <- function(ID = NULL, ref_dods = FALSE,
                                 tidy = TRUE, tidy_style = "snake_case") {
  if (missing(ID)) {
    df <- mnis_all_members()
  } else {
    query_type <- "/PreferredNames"

    df <- additional_generic(ID, ref_dods, tidy, tidy_style, query_type)
  }

  df
}
