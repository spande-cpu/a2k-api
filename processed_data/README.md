Features and Descriptive Statitics
================

## Note: `posts` containts a `list()` nested within the the `[Url, Titles]` indices.

``` r
data <- read_rds("a2k_40_page_nested_extract.rds") %>%
  mutate_at(vars(Score, Replies, Views), as.numeric) %>%
  # Total No. of Posts in posts
  mutate(PostCount = lengths(posts))
```

``` r
skimr::skim(data, .data_name = "A2K Philosophy Sub-Forum")
```

|                                                  |                          |
|:-------------------------------------------------|:-------------------------|
| Name                                             | A2K Philosophy Sub-Forum |
| Number of rows                                   | 975                      |
| Number of columns                                | 12                       |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |                          |
| Column type frequency:                           |                          |
| character                                        | 5                        |
| list                                             | 1                        |
| numeric                                          | 4                        |
| POSIXct                                          | 2                        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |                          |
| Group variables                                  | None                     |

Data summary

**Variable type: character**

| skim_variable  | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:---------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| Url            |         0 |             1 |  34 |  36 |     0 |      975 |          0 |
| Titles         |         0 |             1 |   4 | 100 |     0 |      967 |          0 |
| Topics         |         0 |             1 |  10 |  88 |     0 |      737 |          0 |
| OriginalPoster |         0 |             1 |   2 |  21 |     0 |      461 |          0 |
| LastReplyFrom  |         0 |             1 |   3 |  20 |     0 |      279 |          0 |

**Variable type: list**

| skim_variable | n_missing | complete_rate | n_unique | min_length | max_length |
|:--------------|----------:|--------------:|---------:|-----------:|-----------:|
| posts         |         0 |             1 |      975 |          1 |         20 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |    mean |       sd |  p0 |    p25 |  p50 |  p75 |   p100 | hist  |
|:--------------|----------:|--------------:|--------:|---------:|----:|-------:|-----:|-----:|-------:|:------|
| Score         |         0 |             1 |    5.45 |    10.97 |   0 |    0.0 |    2 |    7 |    136 | ▇▁▁▁▁ |
| Replies       |         0 |             1 |   78.30 |   239.84 |   0 |    4.0 |   15 |   50 |   4143 | ▇▁▁▁▁ |
| Views         |         0 |             1 | 8085.97 | 20812.34 | 443 | 1443.5 | 2462 | 6808 | 388262 | ▇▁▁▁▁ |
| PostCount     |         0 |             1 |   12.78 |     7.50 |   1 |    5.0 |   16 |   20 |     20 | ▃▂▂▁▇ |

**Variable type: POSIXct**

| skim_variable | n_missing | complete_rate | min                 | max                 | median              | n_unique |
|:--------------|----------:|--------------:|:--------------------|:--------------------|:--------------------|---------:|
| PostDate      |         0 |             1 | 2002-11-17 02:24:00 | 2022-11-07 12:42:00 | 2014-12-11 22:08:00 |      974 |
| LastReplyAt   |         1 |             1 | 2013-09-24 17:22:00 | 2022-11-23 08:09:00 | 2016-01-31 21:32:30 |      973 |
