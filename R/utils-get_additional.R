
## additional function to reduce total amount of code in package and make
# maintenance easier used in: - mnis_additional - mnis_full_biog

get_additional <- function(query, tidy, tidy_style) {
  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  } else if (httr::status_code(got) != 200)

  got <- tidy_bom(got)

  #got2 <- httr::content(got)

  got2 <- jsonlite::fromJSON(got, flatten = TRUE)

  x <- got2$Members$Member

  ##Need to sort this out, use listcols, etc

  q <- as.data.frame(tibble::enframe(unlist(got2$Members$Member)))

  df <- tibble::as_tibble(t(q))

  colnames(df) <- q$name # the first row will be the header

  df <- df[2, ]

  if (tidy == TRUE) {
    df <- mnis_tidy(df, tidy_style)
  }

  df
}


## generic to construct mnis_additional queries to reduce amount of code
# and keep changes in one place
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
