
#' Additional member information
#'
#' A series of basic function for the API lookup. Each of these functions
#' accepts a member's ID and returns information; if no ID is given basic
#' information on all members of both houses is returned.
#' All functions return basic details about the member (name, date of birth,
#' gender, constituency, party, IDs, current status, etc.), as well as any
#' available additional information requested by the specific function.
#'
#' @param ID The member ID. If `NULL`, function calls
#' [mnis_all_members()] and returns basic information on all
#' members of both houses. Defaults to `NULL`.
#' @param ref_dods If `TRUE`, Request based on the DODS membership ID
#' scheme. If `FALSE`, requests data based on the default membership
#' ID scheme. Defaults to `FALSE`.
#' @param tidy If `TRUE`, fixes the variable names in the tibble to
#' remove non-alphanumeric characters and superfluous text, and convert to
#' a consistent style. Defaults to `TRUE`.
#' @param tidy_style The style to convert variable names to, if
#' `tidy=TRUE`. Accepts one of "snake_case", "camelCase" and
#' "period.case". Defaults to "snake_case".
#' @keywords mnis
#' @return A list with the data corresponding to the particular function
#' called.
#' @section `mnis_additional` functions:
#' \describe{
#' \item{`mnis_additional`}{Returns a character vector listing all function
#' options for `mnis_additional`}
#' \item{`mnis_basic_details`}{Basic biographical details
#' on a given Member}
#' \item{`mnis_biography_entries`}{Member biographical information (e.g.
#'  countries of interest, policy expertise etc...)}
#' \item{`mnis_committees`}{Committees a Member sits or has sat on as
#' well details on committee chairing}
#' \item{`mnis_addresses`}{Member address information (e.g. website,
#' twitter, constituency address etc...)}
#' \item{`mnis_constituencies`}{Constituencies a Member has represented}
#' \item{`mnis_elections_contested`}{Elections a Member has
#' contested but not won}
#' \item{`mnis_experiences`}{Non-parliamentary experience of a Member}
#' \item{`mnis_government_posts`}{Government posts a Member has held}
#' \item{`mnis_honours`}{Honours (e.g. MBE, OBE etc...) held by a Member}
#' \item{`mnis_house_memberships`}{House membership list of a Member}
#' \item{`mnis_statuses`}{Status history (e.g. suspensions and
#' disqualifications) for a Member}
#' \item{`mnis_staff`}{The staff employed by a Member}
#' \item{`mnis_interests`}{Registered (financial) interests
#' of a Member}
#' \item{`mnis_known_as`}{Details of names a Member has chosen to
#' be known as instead of their full title, only applicable to members
#' of the House of Lords}
#' \item{`mnis_maiden_speeches`}{Maiden speech dates for a Member}
#' \item{`mnis_opposition_posts`}{Opposition posts a Member has held}
#' \item{`mnis_other_parliaments`}{Other Parliaments that a Member
#' has held a membership of}
#' \item{`mnis_parliamentary_posts`}{Parliamentary posts
#' a Member has held}
#' \item{`mnis_parties`}{Party affiliations of a Member}
#' \item{`mnis_preferred_names`}{Full set of data about a
#' Members' name (e.g. surname, forename, Honorary prefixes, full
#' details of House of Lords title and rank if applicable, etc...)}
#' }
#' @seealso [mnis_full_biog()]
#' @seealso [mnis_extra()]
#' @examples
#' \dontrun{
#' x <- mnis_basic_details(172)
#' }
#'
mnis_additional <- function() {
  x <- c("mnis_full_biog()", "mnis_basic_details()", "mnis_biography_entries()", "mnis_committees()", "mnis_addresses()", "mnis_constituencies()", "mnis_elections_contested()", "mnis_experiences()", "mnis_government_posts()", "mnis_honours()", "mnis_house_memberships()", "mnis_statuses()", "mnis_staff()", "mnis_interests()", "mnis_known_as()", "mnis_maiden_speeches()", "mnis_opposition_posts()", "mnis_other_parliaments()", "mnis_parliamentary_posts()", "mnis_parties()", "mnis_preferred_names()")
  message("All Available Additional Information Functions:")

  print(x)
}

#' @export
#' @rdname mnis_additional
mnis_basic_details <- function(ID = NULL, ref_dods = FALSE,
                               tidy = TRUE, tidy_style = "snake_case") {

  type <- "/BasicDetails"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional

mnis_biography_entries <- function(ID = NULL, ref_dods = FALSE,
                                   tidy = TRUE, tidy_style = "snake_case") {
  type <- "/BiographyEntries"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)
}

#' @export
#' @rdname mnis_additional
mnis_committees <- function(ID = NULL, ref_dods = FALSE,
                            tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Committees"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)
}

#' @export
#' @rdname mnis_additional
mnis_addresses <- function(ID = NULL, ref_dods = FALSE,
                           tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Addresses"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)
}

#' @export
#' @rdname mnis_additional
mnis_constituencies <- function(ID = NULL, ref_dods = FALSE,
                                tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Constituencies"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}


#' @export
#' @rdname mnis_additional
mnis_elections_contested <- function(ID = NULL, ref_dods = FALSE,
                                     tidy = TRUE, tidy_style = "snake_case") {
  type <- "/ElectionsContested"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional
mnis_experiences <- function(ID = NULL, ref_dods = FALSE,
                             tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Experiences"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional
mnis_government_posts <- function(ID = NULL, ref_dods = FALSE,
                                  tidy = TRUE, tidy_style = "snake_case") {
  type <- "/GovernmentPosts"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional
mnis_honours <- function(ID = NULL, ref_dods = FALSE,
                         tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Honours"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional
mnis_house_memberships <- function(ID = NULL, ref_dods = FALSE,
                                   tidy = TRUE, tidy_style = "snake_case") {
  type <- "/HouseMemberships"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}



#' @export
#' @rdname mnis_additional

mnis_statuses <- function(ID = NULL, ref_dods = FALSE,
                          tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Statuses"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional

mnis_staff <- function(ID = NULL, ref_dods = FALSE,
                       tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Staff"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional
mnis_interests <- function(ID = NULL, ref_dods = FALSE,
                           tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Interests"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional
mnis_known_as <- function(ID = NULL, ref_dods = FALSE,
                          tidy = TRUE, tidy_style = "snake_case") {
  type <- "/KnownAs"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional
mnis_maiden_speeches <- function(ID = NULL, ref_dods = FALSE,
                                 tidy = TRUE, tidy_style = "snake_case") {
  type <- "/MaidenSpeeches"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional

mnis_opposition_posts <- function(ID = NULL, ref_dods = FALSE,
                                  tidy = TRUE, tidy_style = "snake_case") {
  type <- "/OppositionPosts"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional

mnis_other_parliaments <- function(ID = NULL, ref_dods = FALSE,
                                   tidy = TRUE, tidy_style = "snake_case") {
  type <- "/OtherParliaments"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}
#' @export
#' @rdname mnis_additional
mnis_parliamentary_posts <- function(ID = NULL, ref_dods = FALSE,
                                     tidy = TRUE, tidy_style = "snake_case") {
  type <- "/ParliamentaryPosts"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}

#' @export
#' @rdname mnis_additional

mnis_parties <- function(ID = NULL, ref_dods = FALSE,
                         tidy = TRUE, tidy_style = "snake_case") {
  type <- "/Parties"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}
#' @export
#' @rdname mnis_additional

mnis_preferred_names <- function(ID = NULL, ref_dods = FALSE,
                                 tidy = TRUE, tidy_style = "snake_case") {
  type <- "/PreferredNames"

  mnis_additional_engine(ID, ref_dods, tidy, tidy_style, type)

}
