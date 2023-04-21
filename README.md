# qselfr

<!-- badges: start -->

<!-- badges: end -->

QSelfr is a collection of useful self-tracking functions.

## Installation

You can install the released version of qselfr from Github with:

``` r
devtools::install_github("personalscience/qselfr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(qselfr)
my_blood_file_csv <- "path/to/file.csv"
qselfr::inside_tracker_df()

```

will load an Inside Tracker CSV file and convert it into a nice dataframe.
