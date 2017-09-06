
full_biog_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_full_biog(ID=id_list[[i]], ref_dods=ref_dods, tidy=tidy, tidy_style=tidy_style)

  }

  df <- dplyr::bind_rows(dat)

  df

}



basic_details_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_basic_details(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

biography_entries_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_biography_entries(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

committees_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_committees(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

addresses_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_addresses(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

constituencies_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_constituencies(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

elections_contested_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_elections_contested(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

experiences_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_experiences(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

government_posts_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_government_posts(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

honours_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_honours(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

house_memberships_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_house_memberships(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

statuses_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_statuses(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

staff_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_staff(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

interests_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_interests(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

known_as_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_known_as(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

maiden_speeches_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_maiden_speeches(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

opposition_posts_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_opposition_posts(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

other_parliaments_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_other_parliaments(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

parliamentary_posts_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_parliamentary_posts(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

parties_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_parties(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}

preferred_names_list <- function(ID, ref_dods, tidy, tidy_style) {

  id_list <- as.list(ID)

  dat <- vector("list", length(id_list))

  for (i in 1:length(id_list)) {

    dat[[i]] <- mnis::mnis_preferred_names(ID=id_list[[i]], ref_dods=ref_dods, tidy=FALSE)

  }

  df <- dplyr::bind_rows(dat)

  df

}
