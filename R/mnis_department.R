#' Minister/shadow minister posts
#'
#' Request the holders of posts in specific departments by department ID
#' (see \code{\link{mnis_reference}}), or all current and former
#' minister/shadow minister positions.
#'
#' @param department_id The department to look up. \code{0} returns the
#' cabinet/shadow cabinet, \code{-1} returns a list of all ministers.
#' For departmental IDs, see the \code{ref_departments} function in
#' \code{\link{mnis_reference}}.
#' Defaults to \code{0}.
#' @param bench Flag to return either Government or Opposition information.
#' This parameter is case insensitive, so both \code{'Opposition'} and
#' \code{'opposition'} will return the same data.
#' Defaults to \code{'Government'}.
#' @param former Logical parameter to include both current and
#' former ministers/shadow ministers. If \code{FALSE}, only includes
#' current ministers/shadow ministers. Defaults to \code{TRUE}.
#' @inheritParams mnis_additional
#' @return A tibble with information on departments and
#' ministers/shadow ministers.
#' @export
#' @seealso \code{\link{mnis_reference}}
#' @examples \dontrun{
#' x <- mnis_department(departmentId = 0, bench = 'Government', former=TRUE)
#' }


mnis_department <- function(department_id = 0, bench = "Government", former = TRUE,
                            tidy = TRUE, tidy_style = "snake_case") {

    if (former == TRUE) {

        query_former <- "former"

    } else {

        query_former <- "current"
    }

    bench <- utils::URLencode(stringi::stri_trans_totitle(bench))

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/Department/"

    query <- paste0(baseurl, department_id, "/", bench, "/", query_former, "/")

    got <- get_generic(query)

    df <- tibble::as_tibble(as.data.frame(got$Department$Posts))

    if (tidy == TRUE) {

        df <- mnis_tidy(df, tidy_style)

    }

    df

}
