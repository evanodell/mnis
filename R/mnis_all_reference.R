
#' All reference tables in a list
#'
#' All 39 reference functions, presented as a list of tibbles.
#' @return Returns a list of 39 tibbles, with the name and data returned from
#' each respective reference function.
#' @param tidy If `TRUE`, fixes the variable names in each reference
#' tibble to remove non-alphanumeric characters and superfluous text, and
#' convert to a consistent style. Also applies a consistent style to each
#' tibble name in the list. If `FALSE`, tibble names will be in
#' `snake_case` style, and the variable names in each tibble will not
#' be altered. Defaults to `TRUE`.
#' @inheritParams mnis_additional
#' @seealso [mnis_reference()]
#' @rdname mnis_all_reference
#' @export
#' @examples \dontrun{
#' z <- mnis_all_reference()
#' }

mnis_all_reference <- function(tidy = TRUE, tidy_style = "snake_case") {
  ref_list <- list(
    address_types = mnis::ref_address_types(tidy, tidy_style),
    answering_bodies =
      mnis::ref_answering_bodies(tidy, tidy_style),
    area_types = mnis::ref_area_types(tidy, tidy_style),
    areas = mnis::ref_areas(tidy, tidy_style),
    biography_categories =
      mnis::ref_biography_categories(tidy, tidy_style),
    cabinets = mnis::ref_cabinets(tidy, tidy_style),
    committee_types =
      mnis::ref_committee_types(tidy, tidy_style),
    committees = mnis::ref_committees(tidy, tidy_style),
    constituencies = mnis::ref_constituencies(tidy, tidy_style),
    constituency_areas =
      mnis::ref_constituency_areas(tidy, tidy_style),
    constituency_types =
      mnis::ref_constituency_types(tidy, tidy_style),
    countries = mnis::ref_countries(tidy, tidy_style),
    departments = mnis::ref_departments(tidy, tidy_style),
    disqualification_types =
      mnis::ref_disqualification_types(tidy, tidy_style),
    election_types = mnis::ref_election_types(tidy, tidy_style),
    elections = mnis::ref_elections(tidy, tidy_style),
    end_reasons = mnis::ref_end_reasons(tidy, tidy_style),
    experience_types =
      mnis::ref_experience_types(tidy, tidy_style),
    government_post_departments =
      mnis::ref_government_post_departments(tidy, tidy_style),
    government_posts =
      mnis::ref_government_posts(tidy, tidy_style),
    government_ranks =
      mnis::ref_government_ranks(tidy, tidy_style),
    honour_lists = mnis::ref_honour_lists(tidy, tidy_style),
    honourary_prefixes =
      mnis::ref_honourary_prefixes(tidy, tidy_style),
    honours = mnis::ref_honours(tidy, tidy_style),
    interest_categories =
      mnis::ref_interest_categories(tidy, tidy_style),
    lords_membership_types =
      mnis::ref_lords_membership_types(tidy, tidy_style),
    lords_ranks = mnis::ref_lords_ranks(tidy, tidy_style),
    opposition_post_departments =
      mnis::ref_opposition_post_departments(tidy, tidy_style),
    opposition_posts =
      mnis::ref_opposition_posts(tidy, tidy_style),
    opposition_ranks =
      mnis::ref_opposition_ranks(tidy, tidy_style),
    other_parliaments =
      mnis::ref_other_parliaments(tidy, tidy_style),
    parliament_types =
      mnis::ref_parliament_types(tidy, tidy_style),
    parliamentary_posts =
      mnis::ref_parliamentary_posts(tidy, tidy_style),
    parliamentary_ranks =
      mnis::ref_parliamentary_ranks(tidy, tidy_style),
    parties = mnis::ref_parties(tidy, tidy_style),
    party_sub_types =
      mnis::ref_party_sub_types(tidy, tidy_style),
    photo_outputs = mnis::ref_photo_outputs(tidy, tidy_style),
    statuses = mnis::ref_statuses(tidy, tidy_style),
    titles = mnis::ref_titles(tidy, tidy_style)
  )

  ref_list <- ref_tidy(ref_list, tidy_style)
}
