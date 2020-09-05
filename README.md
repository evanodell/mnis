
<!-- README.md is generated from README.Rmd. Please edit that file -->

mnis
====

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/EvanOdell/mnis/blob/master/LICENSE)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/mnis)](https://cran.r-project.org/package=mnis)
[![GitHub
tag](https://img.shields.io/github/tag/evanodell/mnis.svg)](https://github.com/evanodell/mnis)
[![](https://cranlogs.r-pkg.org/badges/grand-total/mnis)](https://dgrtwo.shinyapps.io/cranview/)
[![Build
Status](https://travis-ci.org/EvanOdell/mnis.png?branch=master)](https://travis-ci.org/EvanOdell/mnis)
[![DOI](https://zenodo.org/badge/76553907.svg)](https://zenodo.org/badge/latestdoi/76553907)
[![codecov](https://codecov.io/gh/EvanOdell/mnis/branch/master/graph/badge.svg)](https://codecov.io/gh/EvanOdell/mnis)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/EvanOdell/mnis?branch=master&svg=true)](https://ci.appveyor.com/project/EvanOdell/mnis)

`mnis` is a package for downloading data from the Members’ Names
Information Service API. For information on the API is available here:
<a href="http://data.parliament.uk/membersdataplatform/default.aspx" class="uri">http://data.parliament.uk/membersdataplatform/default.aspx</a>.

The package is available on CRAN. To install from CRAN run:

    install.packages("mnis")

The most recent version on GitHub can be installed by running:

    install.packages("devtools")
    devtools::install_github("EvanOdell/mnis")

The most up to date documentation for the development version will
always be available at
<a href="https://docs.evanodell.com/mnis/" class="uri">https://docs.evanodell.com/mnis/</a>.

For an introduction to `mnis`, the vignette
`vignette("introduction", package = "mnis")` is the best place to start.
If you are unfamiliar with APIs
<a href="https://zapier.com/learn/apis/" class="uri">https://zapier.com/learn/apis/</a>
is a helpful introduction.

Future Functions
----------------

As the Members’ Names Information Service has dozens of different search
parameters and hundreds of possible combinations of searches, it is not
reasonable to build functions for every possible query to the API.
However, I will be rolling out functions for potentially common queries
as and when I can. If you have any particular queries you would like
functions for please let me know and I’ll create it.
