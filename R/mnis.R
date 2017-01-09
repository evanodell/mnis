#' mnis: Easy Downloading Capabilities for the Member Name Information Service
#'
#' An API package for the Members' Name Information Service operated by the UK parliament. The package is intended to simplify pulling data from an API for users unfamiliar with APIs. Documentation for the API itself can be found here: http://data.parliament.uk/membersdataplatform/default.aspx.
#'
#' Note that on Unix-like systems there may be a warning message stating 'JSON string contains (illegal) UTF8 byte-order-mark!'. This does not appear to have any impact on the data itself, but is due to the encoding used by the API.
#'
#'
#' @section mnis functions:
#'
#' \code{\link{mnis_additional}}
#'
#' \code{\link{mnis_base}}
#'
#' \code{\link{mnis_constituency_results}}
#'
#' \code{\link{mnis_department}}
#'
#' \code{\link{mnis_extra}}
#'
#' \code{\link{mnis_full_biog}}
#'
#' \code{\link{mnis_general_election_results}}
#'
#' \code{\link{mnis_lords_type}}
#'
#' \code{\link{mnis_member_date}}
#'
#' \code{\link{mnis_party_state}}
#'
#' \code{\link{mnis_reference}}
#'
#' @docType package
#' @name mnis
#' @import utils
#' @import httr
#' @import jsonlite
#' @import plyr
NULL
