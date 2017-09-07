

## Helper function for mnis_member_date
mnis_mp_date <- function(ID, date) {
    
    id_list <- as.list(ID)
    
    dat <- vector("list", length(id_list))
    
    for (i in 1:length(id_list)) {
        
        dat[[i]] <- mnis::mnis_member_date(ID = id_list[[i]], date = date, tidy = FALSE)
        
    }
    
    df <- dplyr::bind_rows(dat)
    
    df
    
}
