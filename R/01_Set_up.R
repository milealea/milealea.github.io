library(labelled)
library(tidyverse)
library(readr)
library(usethis)
library(here)
library(gtsummary)
library(dplyr)
library(lubridate)
library(ggplot2)


#Body Temperature Series of a beaver
beaver1 <- beaver1
beaver2 <- beaver2


#Calculate total minutes for each time point
beavers1_time <- beaver1 %>%
  mutate(
    hours = time %/% 100,
    minutes = time %% 100,
    total_minutes = (hours * 60) + minutes,
  )


beavers2_time <- beaver2 %>%
  mutate(
    hours = time %/% 100,
    minutes = time %% 100,
    total_minutes = (hours * 60) + minutes,
  )

#Clean and modify data, because measurments were done after midnight, 1140 minutes were added to day 2 total minutes. 
beavers1_time <- beavers1_time |>
  mutate(day = ifelse(day == 346,1,2)) |>
  mutate(total_minutes = ifelse(day== 2,
                       total_minutes + 1440,
                       total_minutes))
       

beavers2_time <- beavers2_time |>
  mutate(day = ifelse(day == 307,1,2)) |>
  mutate(total_minutes = ifelse(day== 2,
                                total_minutes + 1440,
                                total_minutes))

#combine data
beavers_complete <- bind_rows(
  beavers1_time = beavers1_time,
  beavers2_time = beavers2_time,
.id = "beaver_id"
)