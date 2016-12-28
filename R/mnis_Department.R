#' mnis_Department
#'
#' @param departmentId The department look up. 0 returns the cabinet/shadow cabinet, -1 returns a list of all ministers/
#' @param bench Flag to return either Government or Opposition information. Defaults to Government.
#' @param former Flag to include both current and former ministers/shadow ministers. Defaults to TRUE.
#' @return A list with information on the outcome of the most recent election in a constituency
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_Department()
#'
#' }
#'


mnis_Department <- function(departmentId = 0, bench = "Government", former=TRUE) {

  if(former==TRUE) {
    former <- "former"
  } else {
    former <- "current"
  }

  bench <-  utils::URLencode(bench)

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/Department/"

  query <- paste0(baseurl, departmentId, "/", bench, "/", former, "/")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)

  x <- got$Department$Posts

  x <- as.data.frame(x)

  names(x) <- gsub("Post.PostHolders.", "", names(x))

  x

}
