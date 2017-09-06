


additional_generic <- function(ID, ref_dods, tidy, tidy_style, query){

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

  if (ref_dods == TRUE) {

    ID_Type <- "refDods="

  } else {

    ID_Type <- "id="

  }

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    query_list <- paste0(baseurl, ID_Type, id_list[[i]], query)

    dat[[i]] <- get_additional(query_list, tidy, tidy_style)

  }

  df <- dplyr::bind_rows(dat)

  df

}
