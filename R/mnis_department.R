#' Minister/shadow minister posts
#'
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

  bench <- utils::URLencode(stringi::stri_trans_totitle(bench))

  q_url <- paste0(base_url, "Department/")

  query <- paste0(q_url, department_id, "/", bench, "/", query_former, "/")

  got <- get_generic(query)

  df <- tibble::as_tibble(as.data.frame(got$Department$Posts))

  if (tidy == TRUE) {
    df <- mnis_tidy(df, tidy_style)
  }

  df
}
