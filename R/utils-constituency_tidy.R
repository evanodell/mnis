## Specific function for tidying constituency results

constituency_results_tidy <- function(results, details) {
  names(results) <- gsub("Candidates\\.Candidate\\.", "", names(results))

  names(results) <- gsub("\\.", "", names(results))

  names(results) <- gsub(
    "([[:lower:]])([[:upper:]])", "\\1_\\2",
    names(results)
  )

  names(details) <- gsub(
    "([[:lower:]])([[:upper:]])", "\\1_\\2",
    names(details)
  )

  names(results) <- tolower(names(results))

  names(details) <- tolower(names(details))

  y <- c(list(results = results), list(details = details))

  y
}
