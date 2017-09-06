# A function to strip Byte Order Marks (BOM) out of JSON data returned from the API.

tidy_bom <- function(df) {

  got <- as.character(df)

  got <- mnis_bom(got)

  got

}
