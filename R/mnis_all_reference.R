
#' mnis_all_reference
#' @return Returns a list of 39 tibbles, with the name and data returned from each respective reference function.
#' @param tidy Fix the variable names in each tibble to remove special characters and superfluous text, and convert all the variable names to snake_case. Defaults to TRUE.
#'
#' @rdname mnis_all_reference
#' @export
#' @examples \dontrun{
#'
#' mnis_all_reference()
#'
#'}

mnis_all_reference <- function(tidy=TRUE) {

  address_types <- ref_address_types(tidy = tidy)

  answering_bodies <- ref_answering_bodies(tidy = tidy)

  area_types <- ref_area_types(tidy = tidy)

  areas <- ref_areas(tidy = tidy)

  biography_categories <- ref_biography_categories(tidy = tidy)

  cabinets <- ref_cabinets(tidy = tidy)

  committee_types <- ref_committee_types(tidy = tidy)

  committees <- ref_committees(tidy = tidy)

  constituencies <- ref_constituencies(tidy = tidy)

  constituency_areas <- ref_constituency_areas(tidy = tidy)

  constituency_types <- ref_constituency_types(tidy = tidy)

  countries <- ref_countries(tidy = tidy)

  departments <- ref_departments(tidy = tidy)

  disqualification_types <- ref_disqualification_types(tidy = tidy)

  election_types <- ref_election_types(tidy = tidy)

  elections <- ref_elections(tidy = tidy)

  end_reasons <- ref_end_reasons(tidy = tidy)

  experience_types <- ref_experience_types(tidy = tidy)

  government_post_departments <- ref_government_post_departments(tidy = tidy)

  government_posts <- ref_government_posts(tidy = tidy)

  government_ranks <- ref_government_ranks(tidy = tidy)

  honour_lists <- ref_honour_lists(tidy = tidy)

  honourary_prefixes <- ref_honourary_prefixes(tidy = tidy)

  honours <- ref_honours(tidy = tidy)

  interest_categories <- ref_interest_categories(tidy = tidy)

  lords_membership_types <- ref_lords_membership_types(tidy = tidy)

  lords_ranks <- ref_lords_ranks(tidy = tidy)

  opposition_post_departments <- ref_opposition_post_departments(tidy = tidy)

  opposition_posts <- ref_opposition_posts(tidy = tidy)

  opposition_ranks <- ref_opposition_ranks(tidy = tidy)

  other_parliaments <- ref_other_parliaments(tidy = tidy)

  parliament_types <- ref_parliament_types(tidy = tidy)

  parliamentary_posts <- ref_parliamentary_posts(tidy = tidy)

  parliamentary_ranks <- ref_parliamentary_ranks(tidy = tidy)

  parties <- ref_parties(tidy = tidy)

  party_sub_types <- ref_party_sub_types(tidy = tidy)

  photo_outputs <- ref_photo_outputs(tidy = tidy)

  statuses <- ref_statuses(tidy = tidy)

  titles <- ref_titles(tidy = tidy)

  ## make the reference list thingy

    ref_list <- list()

    ref_list <- list("address_types" = address_types,
                     "answering_bodies" = answering_bodies,
                     "area_types" = area_types,
                     "areas" = areas,
                     "biography_categories" = biography_categories,
                     "cabinets" = cabinets,
                     "committee_types" = committee_types,
                     "committees" = committees,
                     "constituencies" = constituencies,
                     "constituency_areas" = constituency_areas,
                     "constituency_types" = constituency_types,
                     "countries" = countries,
                     "departments" = departments,
                     "disqualification_types" = disqualification_types,
                     "election_types" = election_types,
                     "elections" = elections,
                     "end_reasons" = end_reasons,
                     "experience_types" = experience_types,
                     "government_post_departments" = government_post_departments,
                     "government_posts" = government_posts,
                     "government_ranks" = government_ranks,
                     "honour_lists" = honour_lists,
                     "honourary_prefixes" = honourary_prefixes,
                     "honours" = honours,
                     "interest_categories" = interest_categories,
                     "lords_membership_types" = lords_membership_types,
                     "lords_ranks" = lords_ranks,
                     "opposition_post_departments" = opposition_post_departments,
                     "opposition_posts" = opposition_posts,
                     "opposition_ranks" = opposition_ranks,
                     "other_parliaments" = other_parliaments,
                     "parliament_types" = parliament_types,
                     "parliamentary_posts" = parliamentary_posts,
                     "parliamentary_ranks" = parliamentary_ranks,
                     "parties" = parties,
                     "party_sub_types" = party_sub_types,
                     "photo_outputs" = photo_outputs,
                     "statuses" = statuses,
                     "titles" = titles)

    ref_list

}
