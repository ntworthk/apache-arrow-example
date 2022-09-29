#--- Script details ------------------------------------------------------------
# Creation date: 29 September 2022
# Client:        Internal
# Project:       apache-arrow-example
# Description:   Using Apache Arrow
# Author:        Nick Twort

library(tidyverse)
library(arrow)

#--- Import data ---------------------------------------------------------------

# Normal
data_csv <- read_csv("data/raw/au.csv")

# Faster to read?
data_csv_arrow <- read_csv_arrow("data/raw/au.csv")

# Read in as an ARROW TABLE
data_arrow <- read_csv_arrow("data/raw/au.csv", as_data_frame = FALSE)

#--- Look at differences -------------------------------------------------------

# Normal table
data_csv

# Also table
data_csv_arrow

# Not a normal table
data_arrow

#--- Analysis ------------------------------------------------------------------

# Normal
data_csv %>%
  filter(admin_name == "New South Wales")

# Also
data_csv_arrow %>%
  filter(admin_name == "New South Wales")

# Not normal
data_arrow %>%
  filter(admin_name == "New South Wales")

# Need to actually "collect" the dataset
data_arrow %>%
  filter(admin_name == "New South Wales") %>%
  collect()
