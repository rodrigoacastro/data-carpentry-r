# dplyr and tidyr

require (tidyverse)

interviews = read_csv("data/SAFI_clean.csv",na="NULL")
select(interviews, village, no_membrs, years_liv)
select(interviews, village:rooms)

