
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quickselect <img src="tools/quickselect_hex4.png" width = 167 align="right"/>

<!-- badges: start -->

[![Build
Status](https://travis-ci.com/camkay/quickselect.svg?branch=main)](https://travis-ci.com/camkay/quickselect)
[![Build
status](https://ci.appveyor.com/api/projects/status/7vy4wwladyg29iy9/branch/main?svg=true)](https://ci.appveyor.com/project/camkay/quickselect/branch/main)
[![Codecov test
coverage](https://codecov.io/gh/camkay/quickselect/branch/main/graph/badge.svg)](https://codecov.io/gh/camkay/quickselect?branch=main)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-stable.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- badges: end -->

Quickly select columns from a data frame or tibble using
[regex](https://en.wikipedia.org/wiki/Regular_expression). It is
essentially a wrapper for `select(matches("my_var"))` from `{dyplr}` and
`{tidyselect}`. It includes two functions `match()` and `unmatch()`

<p align="center">
<img src="tools/quickselect_meme.png" height = 400/>
</p>

## Installation

The development version of `quickselect` can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("camkay/quickselect")
```

## Descriptions and Examples

### match

`match` extracts columns in a data frame that match a specified
[regex](https://en.wikipedia.org/wiki/Regular_expression) string.

``` r
# look at example data
data_example
#>   group mach narc psyc  des  mor
#> 1     A   NA    2    3  100   10
#> 2     A    2    4    4  100   10
#> 3     B  300  500 1800    2  500
#> 4     B  200  700 2000   10 1000
#> 5     A    3   10    5 1000   20

# match columns that start with m
data_example %>%
  match("^m")
#>   mach  mor
#> 1   NA   10
#> 2    2   10
#> 3  300  500
#> 4  200 1000
#> 5    3   20
```

### unmatch

`unmatch` extracts columns in a data frame that DO NOT match a specified
[regex](https://en.wikipedia.org/wiki/Regular_expression) string.

``` r
# look at example data
data_example
#>   group mach narc psyc  des  mor
#> 1     A   NA    2    3  100   10
#> 2     A    2    4    4  100   10
#> 3     B  300  500 1800    2  500
#> 4     B  200  700 2000   10 1000
#> 5     A    3   10    5 1000   20

# return columns that do not start with m
data_example %>%
  unmatch("^m")
#>   group narc psyc  des
#> 1     A    2    3  100
#> 2     A    4    4  100
#> 3     B  500 1800    2
#> 4     B  700 2000   10
#> 5     A   10    5 1000
```
