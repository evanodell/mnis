
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mnis

[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/mnis)](https://cran.r-project.org/package=mnis)
[![GitHub
tag](https://img.shields.io/github/tag/evanodell/mnis.svg)](https://github.com/evanodell/mnis)
[![](https://cranlogs.r-pkg.org/badges/grand-total/mnis)](https://dgrtwo.shinyapps.io/cranview/)
[![Travis-CI Build
Status](https://travis-ci.org/evanodell/mnis.svg?branch=master)](https://travis-ci.org/evanodell/mnis)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/evanodell/mnis?branch=master&svg=true)](https://ci.appveyor.com/project/evanodell/mnis)
[![Coverage
Status](https://img.shields.io/codecov/c/github/evanodell/mnis/master.svg)](https://codecov.io/github/evanodell/mnis?branch=master)
[![DOI](https://zenodo.org/badge/76553907.svg)](https://zenodo.org/badge/latestdoi/76553907)

`mnis` is a package for downloading data from the Members’ Names
Information Service API. For information on the API is available here:
<http://data.parliament.uk/membersdataplatform/default.aspx>.

The package is available on CRAN. To install from CRAN run:

``` r
install.packages("mnis")
```

Or, if using the [`pacman`](https://CRAN.R-project.org/package=pacman)
package:

``` r
pacman::p_load(mnis)
```

The most recent version on GitHub can be installed by running:

``` r
install.packages("devtools")
devtools::install_github("EvanOdell/mnis")
```

The most up to date documentation for the development version will
always be available at <https://docs.evanodell.com/mnis/>

For an introduction to `mnis`, the vignette `vignette("introduction",
package = "mnis")` is the best place to start. If you are unfamiliar
with APIs [this tutorial from Zapier](https://zapier.com/learn/apis/) is
a helpful introduction.

## Future Functions

As the Members’ Names Information Service has dozens of different search
parameters and hundreds of possible combinations of searches, it is not
reasonable to build functions for every possible query to the API.
However, I will be rolling out functions for potentially common queries
as and when I can. If you have any particular queries you would like
functions for please [let me know](mailto:evanodell91@gmail.com) and
I’ll create it.
