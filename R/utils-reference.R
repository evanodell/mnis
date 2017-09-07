


get_reference <- function(baseurl, tidy, tidy_style) {
    
    got <- httr::GET(baseurl, httr::accept_json())
    
    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    got <- tidy_bom(got)
    
    got <- jsonlite::fromJSON(got, flatten = TRUE)
    
    got
    
}
