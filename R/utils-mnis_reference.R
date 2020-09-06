
mnis_reference_utils <- function(type, tidy, tidy_style) {
  got <- httr::GET(
    paste0(base_url, "ReferenceData/", type, "/"),
    httr::accept_json()
  )

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- mnis::tidy_bom(got)

  got <- jsonlite::fromJSON(got, flatten = TRUE)

  x <- tibble::as_tibble(as.data.frame(got[[type]]))

  if (tidy == TRUE) {
    x <- mnis::ref_tidy(x, tidy_style)
  }
  x
}
