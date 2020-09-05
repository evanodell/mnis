
mnis_additional_utility <- function(query) {
  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- mnis::tidy_bom(got)

  got <- jsonlite::fromJSON(got, flatten = TRUE)

  mem <- purrr::discard(got$Members$Member, is.null)

  names(mem) <- janitor::make_clean_names(names(mem))

  mem
}
