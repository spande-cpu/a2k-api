Forum Scraper for able2know.org
================

# Description

A simple web-crawler to get forum and post information from [able2know.org](https://able2know.org).

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

## Function: get_info

``` r
get_info <- function(base_url) {
  # Code omitted for brevity
}
```

`get_info`: Takes a base URL as input and is responsible
for extracting topics, URLs and metadata from the forum page.

## Function: get_discussion

``` r
get_discussion <- function(thread_url) {
  # Code omitted for brevity
}
```

`get_discussion`: Takes a thread URL as input and extracts
the message content and discussions from that particular thread.

## Function: scrape_a2k

``` r
scrape_a2k <- function(page_url = "https://able2know.org/forum/philosophy/", n_pages = 20) {
  # Code omitted for brevity
}
```

`scrape_a2k`: Main crawling function. It takes a page
URL (defaulting to the philosophy forum on able2know.org) and the number
of pages to scrape as input. It then performs the web scraping process
by calling the `get_info` and `get_discussion` functions.

## Execute the Scraper

``` r
data <- scrape_a2k(n_pages = 40)
```

The extracted data will be stored in the `data` object.

Running the scraper may take some time, depending on
the number of pages to scrape, the website’s responsiveness and your internet connection.


