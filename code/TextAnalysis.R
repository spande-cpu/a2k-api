# Dependencies
library(tidyverse)
library(tidytext)

# Data
data <- read_rds("./processed_data/a2k_40_page_nested_extract.rds")

# Top Words
data %>%
  unnest(cols = "posts") %>%
  unnest_tokens(word, posts) %>%
  ## Remove stop words
  anti_join(stop_words, by = "word") %>%
  filter(!str_detect(word, "[0-9]+"), !str_detect(word, "_")) %>%
  count(word) %>%
  arrange(desc(n))
  


