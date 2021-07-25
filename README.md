
<!-- README.md is generated from README.Rmd. Please edit that file -->

# learningtower <img src='man/figures/logo.png' align="right" height="211" />

![R-CMD-check](https://github.com/priya51096/learningtower/actions/workflows/R-CMD-check/badge.svg)

The goal of learningtower is to provide a user-friendly R package to
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

You can install the development version of `learningtower` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kevinwang09/learningtower")
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
#>   year country school_id student_id mother_educ father_educ gender computer
#> 1 2000     ALB      1001          1        <NA>        <NA> female     <NA>
#> 2 2000     ALB      1001          3        <NA>        <NA> female     <NA>
#> 3 2000     ALB      1001          6        <NA>        <NA>   male     <NA>
#> 4 2000     ALB      1001          8        <NA>        <NA> female     <NA>
#> 5 2000     ALB      1001         11        <NA>        <NA> female     <NA>
#> 6 2000     ALB      1001         12        <NA>        <NA> female     <NA>
#>   internet   math   read science stu_wgt desk room dishwasher television
#> 1       no 324.35 397.87  345.66    2.16  yes   no         no          1
#> 2       no     NA 368.41  385.83    2.16  yes  yes         no          2
#> 3       no     NA 294.17  327.94    2.16  yes  yes         no          2
#> 4       no 235.79 241.49  341.09    2.16  yes  yes         no          1
#> 5       no     NA 287.16  307.15    2.16  yes  yes         no          2
#> 6       no 290.74 307.84  277.04    2.16  yes  yes        yes          1
#>   computer_n car  book wealth       escs
#> 1         3+   1 11-50  -0.60  0.1057558
#> 2          0   0  1-10  -1.84 -1.4240446
#> 3          0   0  1-10  -1.46 -1.3066839
#> 4          1   0 11-50  -1.46 -0.4624639
#> 5          0   1 11-50  -1.13 -1.2816273
#> 6       <NA>  3+ 11-50  -0.40 -0.2299722
```

See `?student` for information pertaining to variables captured.

We can get further information on the schools and country codes in the
`school` and `countrycode` data, respectively.

``` r
data(school)
head(school)
#>   year country school_id fund_gov fund_fees fund_donation enrol_boys
#> 1 2000     ALB     01001      100         0             0       1191
#> 2 2000     ALB     01004       98         1             1        334
#> 3 2000     ALB     01005       91         5             2        403
#> 4 2000     ALB     01010      100         0             0        114
#> 5 2000     ALB     01013        0        50            30        250
#> 6 2000     ALB     01017       95         2             3        771
#>   enrol_girls stratio public_private staff_shortage sch_wgt school_size
#> 1        1176   23.67         public           0.60       1        2367
#> 2         479   24.64         public          -0.95       1         813
#> 3         600      NA         public          -0.17       1        1003
#> 4         201   22.50         public           1.87       1         315
#> 5         248   26.92        private          -0.95       1         498
#> 6         626   25.40         public           0.27       1        1397

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
[here](https://kevinwang09.github.io/learningtower/articles/exploring_time.html).

# Acknowledgement

The work to make the data available is the effort of several researchers
from Australia, New Zealand and Indonesia, conducted as part of the
[ROpenSci OzUnconf](https://ozunconf19.ropensci.org) held in Sydney, Dec
11-13, 2019.
