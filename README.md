
<!-- README.md is generated from README.Rmd. Please edit that file -->

# learningtower <img src='man/figures/logo.png' align="right" height="139" />

<!-- badges: start -->

<!-- badges: end -->

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
learning in the areas of reading, mathematical and scientific literacy

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

The PISA assessment measures responses from individual students, school
principals, and parents. A subset of features of these questionnaires
can be found in `student`, `school`, and `parent` respectively. As an
example, we can load the `student` data as follows:

``` r
library(learningtower)
library(tidyverse)
data(student)
```

We can produce a graph of Australian student math scores over time as
follows:

``` r
student %>% 
  filter(country == "AUS") %>%
  group_by(year) %>%
  summarise(math = weighted.mean(math, stu_wgt, na.rm=TRUE)) %>%
  ggplot() + 
    geom_line(aes(x=year, y=math)) +
    ylim(c(0,1000)) +
  ggtitle("Australian PV1 Math Scores, 2000-2018")
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

Changing the scales over-highlights differences in the means between
various countries.

<img src="man/figures/README-unnamed-chunk-4-1.gif" width="100%" />
