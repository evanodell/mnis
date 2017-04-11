#' mnis_department
#'
#' @param department_id The department look up. 0 returns the cabinet/shadow cabinet, -1 returns a list of all ministers. Defaults to 0.
#' @param bench Flag to return either Government or Opposition information. Defaults to 'Government'. The API is case sensitive on this parameter, so 'Government' or 'Opposition' will work, but 'government' and 'opposition' will not.
#' @param former Flag to include both current and former ministers/shadow ministers. Defaults to TRUE. If FALSE, only includes current ministers/shadow ministers.
#' @param tidy Fix the variable names in the tibble to remove non-alphanumeric characters and superfluous text. Defaults to TRUE.
#' @return A tibble with information on departments and ministers/shadow ministers.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_department(departmentId = 0, bench = 'Government', former=TRUE)
#'
#' }
#'


mnis_department <- function(department_id = 0, bench = "Government", former = TRUE, tidy = TRUE) {
    
    if (former == TRUE) {
        
        former <- "former"
        
    } else {
        
        former <- "current"
    }
    
    department_id <- as.character(department_id)
    
    bench <- utils::URLencode(bench)
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/Department/"
    
    query <- paste0(baseurl, department_id, "/", bench, "/", former, "/")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- tidy_bom(got)
    
    got <- jsonlite::fromJSON(got, flatten = TRUE)
    
    x <- got$Department$Posts
    
    x <- tibble::as_tibble(x)
    
    if (tidy == TRUE) {
        
        x <- mnis_tidy(x)
        
        x
        
    } else {
        
        x
        
    }
    
}
