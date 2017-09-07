

## Generic get function to reduce total amount of code in package and make maintenance easier used in: - mnis_all_members - mnis_base -
## mnis_constituency_results - mnis_eligible - mnis_general_election_results - mnis_joined_between - mnis_lords_type - mnis_member_date -
## mnis_mps_on_date - mnis_party_state - mnis_peers_on_date

get_generic <- function(query) {
    
    got <- httr::GET(query, httr::accept_json(), encoding = "UTF-8")
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- tidy_bom(got)
    
    got <- jsonlite::fromJSON(got, flatten = TRUE)
    
    got
    
}
