# ggplot2

rm(list=ls())

require(ggplot2)
require(tidyverse)

interviews = read_csv("data/SAFI_clean.csv",na="NULL")



interviews_plotting = interviews %>% # data
  mutate (split_items = str_split(items_owned,";")) %>%  # split items
  unnest() %>% # unlist items
  mutate(items_owned_logical = TRUE) %>%  # create new column for items
  spread(key = split_items, value = items_owned_logical,  fill = FALSE) %>% # spread items in new columns
  rename(no_listed_items = '<NA>')  # rename spare colums

# months lacking food
interviews_plotting = interviews_plotting %>% # data
  mutate(split_months = str_split(months_lack_food, ";")) %>% # split months
  unnest() # unlist months

# summary
interviews_plotting =  interviews_plotting %>% # data
  mutate(months_lack_food_logical = TRUE) %>% # create new column for months
  spread(key=split_months, value=months_lack_food_logical, fill = FALSE) %>% # spread items in new columns
  mutate(number_month_lack_food=rowSums(select(.,Apr:Sept))) %>% # create new column for food
  mutate(number_items=rowSums(select(.,bicycle:television))) # create new column for items

interviews_plotting

# Plotting

ggplot(data=interviews_plotting)

ggplot(data=interviews_plotting,
       aes(x=no_membrs, y=number_items)) + # stetics
       geom_point() # geometry
       
interview_plot = ggplot(data=interviews_plotting,
                        aes(x=no_membrs, y=number_items)) + # stetics
                        geom_point() # geometry

interview_plot + geom_point(alpha=0.5)
interview_plot + geom_jitter(alpha=0.5)      
interview_plot + geom_jitter(alpha=0.5, color = "blue")
interview_plot + geom_jitter(aes(color = village), alpha=0.5)      

##############

# village = Ruaca
ggplot(filter(interviews_plotting,village == "Ruaca"),
       aes(x=no_membrs, y=number_items)) + # stetics
  geom_point() # geometry


ggplot(data=interviews_plotting, aes(x=village, y=rooms)) + # stetics
  geom_jitter(aes(color=respondent_wall_type)) # geometry



