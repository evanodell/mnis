
#' Request the holders of posts in specific departments by department ID
#' (see [mnis_reference()]), or all current and former
#' minister/shadow minister positions.
#'
#' @param department_id The department to look up. `0` returns the
#' cabinet/shadow cabinet, `-1` returns a list of all ministers.
#' For departmental IDs, see the `ref_departments` function in
#' [mnis_reference()].
#' Defaults to `0`.
#' @param bench Flag to return either Government or Opposition information.
#' This parameter is case insensitive, so both `'Opposition'` and
#' `'opposition'` will return the same data.
#' Defaults to `'Government'`.
#' @param former Logical parameter to include both current and
#' former ministers/shadow ministers. If `FALSE`, only includes
#' current ministers/shadow ministers. Defaults to `TRUE`.
#' @inheritParams mnis_additional
#' @return A tibble with information on departments and
#' ministers/shadow ministers.
#' @export
#' @seealso [mnis_reference()]
#' @examples
#' \dontrun{
#' x <- mnis_department(department_id = 0, bench = "Government", former = TRUE)
#' }
#'
mnis_department <- function(department_id = 0, bench = "Government",
                            former = TRUE, tidy = TRUE,
                            tidy_style = "snake_case") {
  if (former == TRUE) {
    query_former <- "former"
  } else {
    query_former <- "current"
  }

  department_id <- as.character(department_id)

  bench <- utils::URLencode(bench)

  query <- paste0(base_url, "Department/", department_id, "/", bench,
                  "/", query_former, "/")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- mnis::tidy_bom(got)

  got <- jsonlite::fromJSON(got, flatten = TRUE)

  x <- tibble::as_tibble(as.data.frame(got$Department$Posts))

  if (tidy == TRUE) {
    x <- mnis::mnis_tidy(x, tidy_style)
  }
  x
}
