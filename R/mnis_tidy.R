#' mnis_tidy
#'
#' Internal tidying functions
#' @param x The dataframe to tidy
#'
#'
#' @export
#' @rdname mnis_tidy
mnis_tidy <- function(x) {

    names(x) <- gsub("@", "", names(x))

    names(x) <- gsub("#", "", names(x))

    names(x) <- gsub("\\.\\.", "\\.", names(x))

    names(x) <- gsub("^Members\\.Member\\.", "", names(x))

    names(x) <- gsub("^BasicDetails\\.", "", names(x))

    names(x) <- gsub("^BiographyEntries\\.", "", names(x))

    names(x) <- gsub("^Committees\\.", "", names(x))

    names(x) <- gsub("^Addresses\\.", "", names(x))

    names(x) <- gsub("^Constituencies\\.", "", names(x))

    names(x) <- gsub("^ElectionsContested\\.", "", names(x))

    names(x) <- gsub("^Experiences\\.", "", names(x))

    names(x) <- gsub("^GovernmentPosts\\.", "", names(x))

    names(x) <- gsub("^Honours\\.", "", names(x))

    names(x) <- gsub("^HouseMemberships\\.", "", names(x))

    names(x) <- gsub("^Statuses\\.", "", names(x))

    names(x) <- gsub("^Staff\\.", "", names(x))

    names(x) <- gsub("^Interests\\.Category\\.Interest\\.", "Interest\\.", names(x))

    names(x) <- gsub("^Interests\\.Category\\.", "Interest\\.", names(x))

    names(x) <- gsub("^MaidenSpeeches\\.", "", names(x))

    names(x) <- gsub("^OppositionPosts\\.", "", names(x))

    names(x) <- gsub("^Parties\\.", "", names(x))

    names(x) <- gsub("^PreferredNames\\.", "", names(x))

    names(x) <- gsub("^ParliamentaryPosts\\.", "", names(x))

    names(x) <- gsub("^OtherParliaments\\.", "", names(x))

    names(x) <- gsub("^ParliamentaryPosts\\.", "", names(x))

    names(x) <- gsub("^Post.PostHolders.PostHolder.Member", "PostHolder", names(x))

    names(x) <- gsub("^Post\\.PostHolders\\.", "", names(x))

    names(x) <- gsub("xsi:nil", "nil", names(x))

    names(x) <- gsub("xmlns:xsi", "label", names(x))

    names(x) <- gsub("xsi.nil", "nil", names(x))

    names(x) <- gsub("xmlns.xsi", "label", names(x))

    names(x) <- gsub("\\.", "_", names(x))

    names(x) <- gsub("([[:lower:]])([[:upper:]])", "\\1_\\2", names(x))

    names(x) <- tolower(names(x))

    x

}

#' @export
#' @rdname mnis_tidy
ref_tidy <- function(x) {

    names(x) <- gsub(".*\\.", "", names(x))

    names(x) <- gsub("([[:lower:]])([[:upper:]])", "\\1_\\2", names(x))

    names(x) <- tolower(names(x))

    x

}

#' @param results The data frame to tidy
#' @param details The list to tidy
#' @export
#' @rdname mnis_tidy
constituency_results_tidy <- function(results, details) {

    names(results) <- gsub("Candidates\\.Candidate\\.", "", names(results))

    names(results) <- gsub("\\.", "", names(results))

    names(results) <- gsub("([[:lower:]])([[:upper:]])", "\\1_\\2", names(results))

    names(details) <- gsub("([[:lower:]])([[:upper:]])", "\\1_\\2", names(details))

    names(results) <- tolower(names(results))

    names(details) <- tolower(names(details))

    y <- c(list(results = results), list(details = details))

    y

}



#' @param x The GET returned from call to API
#' @export
#' @rdname mnis_tidy
tidy_bom <- function(x) {

  iconv(readBin(x$content[4:length(x$content)], character()), from = "UTF-8", to = "UTF-8")

}

#

