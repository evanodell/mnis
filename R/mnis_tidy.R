
# Function to tidy up the variable names returned from the API, and turn dates and datetimes to POSIXct.

mnis_tidy <- function(df, tidy_style) {
  df <- date_tidy(df)

  df <- member_tidy(df)

  names(df) <- gsub("@", "", names(df))

  names(df) <- gsub("#", "", names(df))

  names(df) <- gsub("\\.\\.", "\\.", names(df))

  names(df) <- gsub("^BasicDetails\\.", "", names(df))

  names(df) <- gsub("^BiographyEntries\\.", "", names(df))

  names(df) <- gsub("^Committees\\.", "", names(df))

  names(df) <- gsub("^Addresses\\.", "", names(df))

  names(df) <- gsub(
    "^Constituencies\\.Constituency\\.",
    "Constituency.", names(df)
  )

  names(df) <- gsub("^ElectionsContested\\.", "", names(df))

  names(df) <- gsub("^Experiences\\.", "", names(df))

  names(df) <- gsub("^GovernmentPosts\\.", "", names(df))

  names(df) <- gsub("^Honours\\.", "", names(df))

  names(df) <- gsub("^HouseMemberships\\.", "", names(df))

  names(df) <- gsub("^Statuses\\.", "", names(df))

  names(df) <- gsub("^Staff\\.", "", names(df))

  names(df) <- gsub(
    "^Interests\\.Category\\.Interest\\.",
    "Interest\\.", names(df)
  )

  names(df) <- gsub("^Interests\\.Category\\.", "Interest\\.", names(df))

  names(df) <- gsub("^MaidenSpeeches\\.", "", names(df))

  names(df) <- gsub("^OppositionPosts\\.", "", names(df))

  names(df) <- gsub("^Parties\\.", "", names(df))

  names(df) <- gsub("^PreferredNames\\.", "", names(df))

  names(df) <- gsub("^ParliamentaryPosts\\.", "", names(df))

  names(df) <- gsub("^OtherParliaments\\.", "", names(df))

  names(df) <- gsub("^ParliamentaryPosts\\.", "", names(df))

  names(df) <- gsub(
    "^Post.PostHolders.PostHolder.Member",
    "PostHolder", names(df)
  )

  names(df) <- gsub("^Post\\.PostHolders\\.", "", names(df))

  names(df) <- gsub("xsi:nil", "nil", names(df))

  names(df) <- gsub("xmlns:xsi", "label", names(df))

  names(df) <- gsub("\\.", "_", names(df))

  names(df) <- gsub("([[:lower:]])([[:upper:]])", "\\1_\\2", names(df))

  names(df) <- gsub("__", "_", names(df))

  names(df) <- tolower(names(df))

  names(df)[names(df) == "df_house"] <- "house"

  names(df) <- gsub("_xsi:nil", "_nil", names(df))

  names(df) <- gsub("_xmlns:xsi", "", names(df))

  if (tidy_style == "camelCase") {
    names(df) <- gsub(
      "(^|[^[:alnum:]])([[:alnum:]])",
      "\\U\\2", names(df), perl = TRUE
    )

    substr(names(df), 1, 1) <- tolower(substr(names(df), 1, 1))
  } else if (tidy_style == "period.case") {
    names(df) <- gsub("_", ".", names(df))
  }

  df
}
