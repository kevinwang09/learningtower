
<!-- README.md is generated from README.Rmd. Please edit that file -->

# learningtower <img src='man/figures/logo.png' align="right" height="211" />

![R-CMD-check](https://github.com/ropenscilabs/learningtower/workflows/R-CMD-check/badge.svg)

The goal of learningtower is to provide a userfriendly R package to
provide easy access to a subset of variables from PISA data collected
from the [OECD](http://www.oecd.org/pisa/data/), for years 2000 - 2018,
collected on a three year basis.

**What is PISA?**

The Programme for International Student Assessment (PISA) is an
international assessment measuring student performance in reading,
mathematical and scientific literacy.

PISA assesses the extent to which 15-year-old students have acquired
some of the knowledge and skills that are essential for full
participation in society, and how well they are prepared for lifelong
learning in the areas of reading, mathematical and scientific literacy.

In 2018, PISA involved 79 countries and 600,000+ students worldwide.

Read more about the Programme
[here](http://www.oecd.org/pisa/aboutpisa/).

## Installation

You can install the development version of learningtower from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ropenscilabs/learningtower")
```

## Usage

The PISA assessment measures responses from individual students and
school principals. A subset of features of these questionnaires can be
found in `student` and `school` respectively (the latter coming soon).
As an example, we can load the `student` data as follows:

``` r
library(learningtower)
data(student)
head(student)
#>   year school_id student_id mother_educ father_educ gender computer internet
#> 1 2000      1001          1          NA          NA      1       NA        2
#> 2 2000      1001          3          NA          NA      1       NA        2
#> 3 2000      1001          6          NA          NA      2       NA        2
#> 4 2000      1001          8          NA          NA      1       NA        2
#> 5 2000      1001         11          NA          NA      1       NA        2
#> 6 2000      1001         12          NA          NA      1       NA        2
#>     math   read science stu_wgt desk room dishwasher television computer_n car
#> 1 324.35 397.87  345.66    2.16    1    2          2          2          4   2
#> 2     NA 368.41  385.83    2.16    1    1          2          3          1   1
#> 3     NA 294.17  327.94    2.16    1    1          2          3          1   1
#> 4 235.79 241.49  341.09    2.16    1    1          2          2          2   1
#> 5     NA 287.16  307.15    2.16    1    1          2          3          1   2
#> 6 290.74 307.84  277.04    2.16    1    1          1          2         NA   4
#>   book wealth       escs country
#> 1    3  -0.60  0.1057558     ALB
#> 2    2  -1.84 -1.4240446     ALB
#> 3    2  -1.46 -1.3066839     ALB
#> 4    3  -1.46 -0.4624639     ALB
#> 5    3  -1.13 -1.2816273     ALB
#> 6    3  -0.40 -0.2299722     ALB
```

See `?student` for information pertaining to variables captured.

We can get futher information on the country codes in the `countrycode`
data.

``` r
data(countrycode)
head(countrycode)
#>   country country_name
#> 1     AZE   Azerbaijan
#> 2     ARG    Argentina
#> 3     AUS    Australia
#> 4     AUT      Austria
#> 5     BEL      Belgium
#> 6     BRA       Brazil
```

## Exploring the data

Changing the scales over-highlights differences in the means between
various countries.

<img src="man/figures/README-unnamed-chunk-4-1.gif" width="100%" />

Further data exploration can be found in our vignette exploring temporal
trends
[here](https://ropenscilabs.github.io/learningtower/articles/exploring_time.html).
