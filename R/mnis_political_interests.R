




#' Political and Geographical Interests
#'
#' @param interest
#' @param tidy
#' @param tidy_style
#'
#' @return
#' @export
#'
#' @examples
#'
#'
#'

mnis_political_interests <- function(interest = NULL,
                           tidy = TRUE, tidy_style = "snake_case") {

        interest <- as.character(interest) ## deal with multiple interests


        baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/biographyinterest="

        query <- paste0(baseurl, interest)

        got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    df <- tibble::as.tibble(got$Members$Member)

}
