
#' Biographical details
#'
#' Requests all available biographical information for a given member, and
#' returns it in the form of a tibble.
#' @param ID The ID number of the member, using the default MNIS scheme.
#' If \code{ref_dods=TRUE}, accepts the Dods monitoring scheme instead.
#' If \code{NULL}, returns the same data as \code{\link{mnis_all_members}}
#' with default parameters. Defaults to \code{NULL}.
#' @param ref_dods Request based on the Dods monitoring member ID scheme.
#' If \code{FALSE}, requests using the default MNIS identification scheme.
#' Defaults to \code{FALSE}.
#' @inheritParams mnis_additional
#' @seealso \code{\link{mnis_basic_details}}
#' @seealso \code{\link{mnis_additional}}
#' @seealso \code{\link{mnis_extra}}
#' @export
#' @examples \dontrun{
#' df <- mnis_full_biog(172)
#' }

mnis_full_biog <- function(ID = NULL, ref_dods = FALSE,
                           tidy = TRUE, tidy_style = "snake_case") {

    if (missing(ID)) {

        df <- mnis_all_members()

    } else {

        if (ref_dods == TRUE) {

            ID_Type <- "refDods="

        } else {

            ID_Type <- "id="

        }

        baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

        query <- paste0(baseurl, ID_Type, ID, "/FullBiog")

        df <- get_additional(query, tidy, tidy_style)

    }

    df

}
