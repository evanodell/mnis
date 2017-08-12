
#' All reference datasets
#'
#' Returns a list of 39 tibbles, with the name and data returned from each respective reference function.
#' @return Returns a list of 39 tibbles, with the name and data returned from each respective reference function.
#' @param tidy Fix the variable names in each tibble to remove special characters and superfluous text, and convert all the variable names to snake_case. Defaults to TRUE.
#' @param tidy_style The style to convert variable names to, if tidy=TRUE. Accepts one of "snake_case", "camelCase" and "period.case". Defaults to "snake_case".
#' @seealso \code{\link{mnis_reference}}
#' @rdname mnis_all_reference
#' @export
#' @examples \dontrun{
#'
#' z <- mnis_all_reference()
#'
#'}

mnis_all_reference <- function(tidy = TRUE, tidy_style="snake_case") {

    ref_list <- list(address_types = mnis::ref_address_types(tidy = tidy, tidy_style=tidy_style),
                     answering_bodies = ref_answering_bodies(tidy = tidy, tidy_style=tidy_style),
                     area_types = ref_area_types(tidy = tidy, tidy_style=tidy_style),
                     areas = ref_areas(tidy = tidy, tidy_style=tidy_style),
                     biography_categories = ref_biography_categories(tidy = tidy, tidy_style=tidy_style),
                     cabinets = ref_cabinets(tidy = tidy, tidy_style=tidy_style),
                     committee_types = ref_committee_types(tidy = tidy, tidy_style=tidy_style),
                     committees = ref_committees(tidy = tidy, tidy_style=tidy_style),
                     constituencies = ref_constituencies(tidy = tidy, tidy_style=tidy_style),
                     constituency_areas = ref_constituency_areas(tidy = tidy, tidy_style=tidy_style),
                     constituency_types = ref_constituency_types(tidy = tidy, tidy_style=tidy_style),
                     countries = ref_countries(tidy = tidy, tidy_style=tidy_style),
                     departments = ref_departments(tidy = tidy, tidy_style=tidy_style),
                     disqualification_types = ref_disqualification_types(tidy = tidy, tidy_style=tidy_style),
                     election_types = ref_election_types(tidy = tidy, tidy_style=tidy_style),
                     elections = ref_elections(tidy = tidy, tidy_style=tidy_style),
                     end_reasons = ref_end_reasons(tidy = tidy, tidy_style=tidy_style),
                     experience_types = ref_experience_types(tidy = tidy, tidy_style=tidy_style),
                     government_post_departments = ref_government_post_departments(tidy = tidy, tidy_style=tidy_style),
                     government_posts = ref_government_posts(tidy = tidy, tidy_style=tidy_style),
                     government_ranks = ref_government_ranks(tidy = tidy, tidy_style=tidy_style),
                     honour_lists = ref_honour_lists(tidy = tidy, tidy_style=tidy_style),
                     honourary_prefixes = ref_honourary_prefixes(tidy = tidy, tidy_style=tidy_style),
                     honours = ref_honours(tidy = tidy, tidy_style=tidy_style),
                     interest_categories = ref_interest_categories(tidy = tidy, tidy_style=tidy_style),
                     lords_membership_types = ref_lords_membership_types(tidy = tidy, tidy_style=tidy_style),
                     lords_ranks = ref_lords_ranks(tidy = tidy, tidy_style=tidy_style),
                     opposition_post_departments = ref_opposition_post_departments(tidy = tidy, tidy_style=tidy_style),
                     opposition_posts = ref_opposition_posts(tidy = tidy, tidy_style=tidy_style),
                     opposition_ranks = ref_opposition_ranks(tidy = tidy, tidy_style=tidy_style),
                     other_parliaments = ref_other_parliaments(tidy = tidy, tidy_style=tidy_style),
                     parliament_types = ref_parliament_types(tidy = tidy, tidy_style=tidy_style),
                     parliamentary_posts = ref_parliamentary_posts(tidy = tidy, tidy_style=tidy_style),
                     parliamentary_ranks = ref_parliamentary_ranks(tidy = tidy, tidy_style=tidy_style),
                     parties = ref_parties(tidy = tidy, tidy_style=tidy_style),
                     party_sub_types = ref_party_sub_types(tidy = tidy, tidy_style=tidy_style),
                     photo_outputs = ref_photo_outputs(tidy = tidy, tidy_style=tidy_style),
                     statuses = ref_statuses(tidy = tidy, tidy_style=tidy_style),
                     titles = ref_titles(tidy = tidy, tidy_style=tidy_style))

    ref_list <- ref_tidy(ref_list, tidy_style)

}
