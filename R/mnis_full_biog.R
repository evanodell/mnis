
#' mnis_FullBiog
#'
#' Requests all available biographical information for a given member.
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme. Defaults to TRUE.
#' @param refDods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @param tidy Fix the variable names in the data frame to remove '@' characters and superfluous text. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_FullBiog(172)
#'
#' }

mnis_full_biog <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    
    ID <- as.character(ID)
    
    if (refDods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }
    
    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"
    
    query <- paste0(baseurl, ID_Type, ID, "/FullBiog")
    
    got <- httr::GET(query, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- jsonlite::fromJSON(httr::content(got, "text"), flatten = TRUE)
    
    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))
    
    x <- t(dl)
    
    x <- as.data.frame(x)
    
    x <- x[rownames(x) != "ID", ]
    
    if (tidy == TRUE) {
        
        x <- mnis_tidy(x)
        
        x
        
    } else {
        
        x
        
    }
    
}

mnis_FullBiog <- function(ID = NULL, mem_id = TRUE, refDods = FALSE, tidy = TRUE) {
    .Deprecated("mnis_FullBiog")
    mnis_full_biog(ID = ID, mem_id = mem_id, refDods = refDods, tidy = tidy)
}
