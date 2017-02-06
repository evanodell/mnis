
<!-- cran-comments.md is generated from README.Rmd. Please edit that file -->
Resubmission
============

This is the first update of this package. The previous version, 0.1.0, was accepted and published on cran on 2016-12-29.

In this release I:

-   Introduced a function parameter called `tidy` that can make the names of columns on the data frames returned by the API more legible.

-   Made the default function names all lower case, in place of the ungainly mixture of upper and lower case they were previously. The previous spelling still functions as usual, although it has been deprecated.

-   Introduced new `mnis_eligible` and `mnis_all_members` functions that are not pre-set in the API but that are likely to be commonly looked up.

Test environments
-----------------

-   Ubuntu 12.04 (on Travis-CI): R 3.3.1
-   local MacOS 10.11.6 installation, R 3.3.2
-   win-builder (devel and release)

R CMD check results
-------------------

R CMD check results 0 errors | 0 warnings | 1 note

\*Note:

Maintainer: 'Evan Odell <evanodell91@gmail.com>'

Possibly mis-spelled words in DESCRIPTION: API (10:17, 10:124)
