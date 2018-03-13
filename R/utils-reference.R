


get_reference <- function(query, tidy, tidy_style) {
  q_url <- paste0(base_url, "ReferenceData/")

  got <- httr::GET(paste0(q_url, query), httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- tidy_bom(got)

  got <- jsonlite::fromJSON(got, flatten = TRUE)

  got
}
