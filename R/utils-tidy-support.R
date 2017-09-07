## Specific functions for tidying within `mnis_tidy`



## A function to strip superfluous member labelling from variable names
member_tidy <- function(df) {
    
    names(df) <- gsub("^Members\\.Member\\.", "", names(df))
    
    df
    
}



# A function that makes date variables returned from the API datable, ie by converting them to POSIXct. Does the same thing for
# datetimes.
date_tidy <- function(df) {
    
    date_vars <- grepl("date", colnames(df), ignore.case = TRUE)
    
    df[date_vars] <- lapply(df[date_vars], function(y) gsub("T", " ", y))
    
    df[date_vars] <- lapply(df[date_vars], as.POSIXct, format = "%Y-%m-%d %H:%M:%S")
    
    df
    
}
