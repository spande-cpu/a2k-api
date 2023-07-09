Forum Scraper for able2know.org
================

# Description

This code is a scraper written in R for extracting information from the
the website [able2know.org](https://able2know.org).

## Required Libraries

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(rvest)
```

    ## 
    ## Attaching package: 'rvest'
    ## 
    ## The following object is masked from 'package:readr':
    ## 
    ##     guess_encoding

The code begins by loading the necessary libraries, namely `tidyverse`
and `rvest`. The `tidyverse` library provides a set of packages for data
manipulation and visualization, while `rvest` is used for web scraping
in R.

## Function: get_info

``` r
get_info <- function(base_url) {
  # Code omitted for brevity
}
```

This function, `get_info`, takes a base URL as input and is responsible
for extracting topics, URLs, and metadata from the forum page.

## Function: get_discussion

``` r
get_discussion <- function(thread_url) {
  # Code omitted for brevity
}
```

The `get_discussion` function takes a thread URL as input and extracts
the message content and discussions from that particular thread.

## Function: scrape_a2k

``` r
scrape_a2k <- function(page_url = "https://able2know.org/forum/philosophy/", n_pages = 20) {
  # Code omitted for brevity
}
```

The `scrape_a2k` function is the main crawler function. It takes a page
URL (defaulting to the philosophy forum on able2know.org) and the number
of pages to scrape as input. It then performs the web scraping process
by calling the `get_info` and `get_discussion` functions.

## Execute the Scraper

To run the web scraping process and retrieve the data, uncomment the
following code:

``` r
data <- scrape_a2k(n_pages = 40)
```

By uncommenting this line, you can run the `scrape_a2k` function and
specify the number of pages to scrape (in this case, 40). The extracted
data will be stored in the `data` variable.

Please note that running the scraper may take some time, depending on
the number of pages to scrape and the website’s responsiveness.

That’s it! This code provides a framework for scraping information from
the philosophy forum on able2know.org using R Markdown. Feel free to
modify it according to your needs.
