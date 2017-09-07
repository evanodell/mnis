
## additional function to reduce total amount of code in package and make maintenance easier used in: - mnis_additional - mnis_full_biog

get_additional <- function(query, tidy, tidy_style) {

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))

    df <- t(dl)

    df <- as.data.frame(df)

    df <- df[rownames(df) != "ID", ]

    df <- tibble::as_tibble(df)

    if (tidy == TRUE) {

        df <- mnis_tidy(df, tidy_style)

    }

    df

}


## generic to construct mnis_additional queries to reduce code sizes
additional_generic <- function(ID, ref_dods, tidy, tidy_style, query_type) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

    if (ref_dods == TRUE) {

        ID_Type <- "refDods="

    } else {

        ID_Type <- "id="

    }

    query <- paste0(baseurl, ID_Type, ID, query_type)

    df <- get_additional(query, tidy, tidy_style)

    df

}
