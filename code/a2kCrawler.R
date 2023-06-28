# Forum Scraper for https://able2know.org/forum/philosophy/
# Required
library(tidyverse)
library(rvest)

# Get topics, urls and metadata
get_info <- function(base_url) {
  base_html <- read_html(base_url)
  ## Get thread index data
  Url <- base_html %>%
    html_nodes(".gridItem") %>%
    html_nodes(".title") %>%
    html_node("a") %>%
    html_attr("href")

  Titles <- base_html %>%
    html_nodes(".gridItem") %>%
    html_nodes(".title") %>%
    html_text2()

  Score <- base_html %>%
    html_nodes(".gridItem") %>%
    html_nodes(".postScore") %>%
    html_text2()
  ## Get Meta-Data
  meta_data <- base_html %>%
    html_nodes(".gridItem") %>%
    html_nodes(".topicMeta ") %>%
    html_text2() %>%
    as_tibble() %>%
    separate(
      "value",
      c("Topics", "OriginalPoster", "PostDate", "Replies", "Views", "LastReply"),
      sep = "\n"
    ) %>%
    mutate(
      Topics = str_remove(Topics, "Forums: "),
      OriginalPoster = str_remove(OriginalPoster, "Question by |Discussion by "),
      PostDate = str_remove(PostDate, "Posted "),
      Replies = str_remove_all(str_remove(Replies, "Replies: "), ","),
      Views = str_remove_all(str_remove(Views, "Views: "), ","),
      LastReply = str_remove(LastReply, "Last Post by ")
    ) %>%
    separate("LastReply", c("LastReplyFrom", "LastReplyAt"), sep = "on ")

  cbind(Url, Titles, Score, meta_data)
}

# Get message content and discussions
get_discussion <- function(thread_url) {
  thread_url %>%
    read_html() %>%
    html_nodes(".expandedPostBody") %>%
    html_text() %>%
    str_squish() %>%
    str_replace_all("\"", "\'")
}

# Crawler
scrape_a2k <- function(page_url = "https://able2know.org/forum/philosophy/", n_pages = 20) {
  seed_url <- page_url
  seed_html <- read_html(seed_url)
  # Total No. of Pages in the Forum
  total_pages <- seed_html %>%
    html_nodes(".box.pagination") %>%
    html_text2() %>%
    str_replace(",", "") %>%
    str_extract_all(., "[0-9]+") %>%
    unlist() %>%
    as.numeric() %>%
    max(na.rm = T)
  # No, of Pages to Scrape
  if (n_pages == "all" & total_pages > 1) {
    crawler_depth <- 2:total_pages
  } else if (!is.numeric(n_pages) & n_pages != "all") {
    print(
      "Error: Please supply the number of pages to scrape or set n_pages = 'all' to scrape all pages in the forum (this may take some time)."
    )
  } else if (n_pages > total_pages | n_pages == 1 | n_pages == 0 | n_pages < 0) {
    crawler_depth <- 1
  } else {
    crawler_depth <- 2:n_pages
  }
  # Page urls to scrape content from
  if (isTRUE(crawler_depth == 1) | !is.numeric(crawler_depth) | isTRUE(is.infinite(crawler_depth))) {
    page_urls <- c(seed_url)
  } else {
    page_urls <- c(
      seed_url,
      paste0(seed_url, "page-", crawler_depth)
    )[crawler_depth] %>% .[complete.cases(.)]
  }

  master <- purrr::map_dfr(page_urls, get_info)

  master %>%
    mutate(posts = Url %>% purrr::map(get_discussion))
}

# Get Data: Uncomment to run.
# data <- scrape_a2k(n_pages = 40)
