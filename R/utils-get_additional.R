
## additional data get function to reduce total amount of code in package and make maintenance easier
# used in:
# - mnis_additional
# - mnis_full_biog

get_additional <- function(query, tidy, tidy_style) {

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))

    x <- t(dl)

    x <- as.data.frame(x)

    x <- x[rownames(x) != "ID", ]

    x <- tibble::as_tibble(x)


    if (tidy == TRUE) {

      x <- mnis_tidy(x, tidy_style)

    }


}
