
#' mnis_Interests
#'
#' Basic function for the MNIS API lookup. The function requests data in JSON format and parses it to a data frame.
#' @param ID The ID number of the member. Defaults to NULL.
#' @param mem_id Request based on the default membership ID scheme. Defaults to TRUE.
#' @param dods_id Request based on the DODS membership ID scheme. Defaults to TRUE.
#' @param pims_id  Request based on the PIMS membership ID scheme. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_Interests(172)
#'
#' }

# http://data.parliament.uk/membersdataplatform/memberquery.aspx

mnis_Interests <- function(ID=NULL, mem_id = TRUE, dods_id=FALSE, pims_id=FALSE) {

  ID <- as.character(ID)

  if(dods_id == TRUE){
    ID_Type <- "dodsid="
  } else if ( pims_id== TRUE){
    ID_Type <- "pimsid="
  } else {
    ID_Type <- "id="
  }

  baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/id="

  query <- paste0(baseurl, ID, "/Interests")

  got <- httr::GET(query, httr::accept_json())

  if (httr::http_type(got) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  got <- jsonlite::fromJSON(httr::content(got, "text"), simplifyVector = FALSE, simplyDataFrame = TRUE)

  #is.null(got$Members) <- got$Members = NA

  got$Members$Member$Interests[is.null(got$Members$Member$Interests)] <- NA

  #got$Members[which(got$Members==NULL)] = NA

  #x<-do.call(rbind, got$Members)

  replaceInList <- function (x, FUN, ...)
  {
    if (is.list(x)) {
      for (i in seq_along(x)) {
        x[i] <- list(replaceInList(x[[i]], FUN, ...))
      }
      x
    }
    else FUN(x, ...)
  }
  got <- replaceInList(got, function(x)if(is.null(x))NA else x)

  #x <- data.table::rbindlist(got$Members, fill=TRUE, use.names = TRUE)

  #dfs <- data.table::rbindlist(lapply(got, FUN=data.table::as.data.table))

  dfs <- lapply(got$Members$Member, data.frame, stringsAsFactors = FALSE)

  y <- do.call(rbind, lapply(dfs, data.frame, stringsAsFactors=FALSE))

  df <- plyr::rbind.fill(dfs)

  y <-dplyr::bind_rows(dfs)

  #z <- data.frame(matrix(as.numeric(as.character(unlist(got, recursive=F))), nrow=length(got), byrow=T))

  #t<-plyr::cbind.fill.matrix(lapply(got$Members$Member, function(f) {
    #as.data.frame(Filter(Negate(is.null), f))
  #}))###Neeed to get this shit sorted out. Still producing lists in some variables that I don't want and I'm just too tired to deal with right now

}
