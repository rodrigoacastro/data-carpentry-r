# dplyr and tidyr

require (tidyverse)

interviews = read_csv("data/SAFI_clean.csv",na="NULL")
select(interviews, village, no_membrs, years_liv)
select(interviews, village:rooms)

# filtering
dplyr::filter(interviews, village == "God" | village == "Chirodzo")

test = interviews$village == "God" | interviews$village == "Chirodzo"
dplyr::filter(interviews, test)

dplyr::filter(interviews, village == "God" | village == "Chirodzo") [1:10]
dplyr::filter(interviews, village == "God", rooms > 2)


dplyr::filter(interviews, 1:nrow(interviews) %in% 1:10)
dplyr::filter(interviews, no_membrs > 2)

interviews_god = filter(interviews, village == "God")
interviews_god = select(interviews_god, no_membrs, years_liv)

interviews_god2 = select(dplyr::filter(interviews, village == "God"),  
                                 no_membrs, years_liv)
interviews_god2

identical (interviews_god, interviews_god2)
# TRUE

interviews %>% dplyr::filter (village == "God") %>% 
            select (no_membrs, years_liv)

# Pipes

interviews %>% dplyr::filter (memb_assoc == "yes") %>% 
  select (affect_conflicts, liv_count, no_meals)


# Mutate

interviews3 = interviews %>%
                mutate(total_meals = no_membrs * no_meals)

colnames(interviews3)

###

interviews4 = interviews %>%
                mutate(people_per_room = no_membrs / rooms)

round(interviews4$people_per_room,2)

# Transmute
interviews_total_meals = interviews %>%
  transmute(total_meals = no_membrs * no_meals)

interviews_total_meals


######### summarizing

mean(interviews$no_membrs)

interviews %>% group_by(village) %>%
    summarize(mean_no_members = mean (no_membrs))

interviews %>% group_by(village) %>%
    filter(memb_assoc == "yes") %>%
    summarize (mean_no_membrs = mean (no_membrs))

interviews %>%  summarise (mean_no_membrs = mean (no_membrs))

#######
interviews %>% group_by(village,memb_assoc) %>%
  summarize (mean_no_membrs = mean (no_membrs))

interviews %>% #group_by(village) %>%
  group_by(memb_assoc) %>%
  summarize (mean_no_membrs = mean (no_membrs))

interviews %>% count(village)
interviews %>% count(village, sort = TRUE)

#######

interviews %>% group_by(village,memb_assoc) %>%
  summarize (mean_membrs = mean (no_membrs),
             min_membrs = min (no_membrs),
               max_membrs = max (no_membrs),
             n())

# reshaping data

# creating more logical columns
interviews = interviews %>% mutate (wall_type_logical = TRUE) %>%  
              spread(key = respondent_wall_type, 
                     value = wall_type_logical, fill = FALSE)

# compressing several columns into one
interviews = interviews %>% 
  gather(key = respondent_wall_type, 
          value = "wall_type_logical", burntbricks:sunbricks)

# prepare 

interviews = read_csv("data/SAFI_clean.csv",na="NULL")

interviews_plotting = interviews %>% # data
  mutate (split_items = str_split(items_owned,";")) %>%  # split items
  unnest() %>% # unlist items
  mutate(items_owned_logical = TRUE) %>%  # create new column for items
  spread(key = split_items, value = items_owned_logical,  fill = FALSE) %>% # spread items in new columns
  rename(no_listed_items = '<NA>')  %>% # rename spare colums 
  mutate(split_months = str_split(months_lack_food, ";")) %>% # split months
  unnest() %>% # unlist months
  mutate(months_lack_food_logical = TRUE) %>% # create new column for months
  spread(key=split_months, value=months_lack_food_logical, fill = FALSE) %>% # spread items in new columns
  mutate(number_month_lack_food=rowSums(select(.,Apr:Sept))) %>% # create new column for food
  mutate(number_items=rowSums(select(.,bicycle:television))) # create new column for items

# export data
write_csv(interviews_plotting, path = "data_output/interviews_plotting.csv")


### dividing into 2 or 3

# items
interviews_plotting2 = interviews %>% # data
  mutate (split_items = str_split(items_owned,";")) %>%  # split items
  unnest() %>% # unlist items
  mutate(items_owned_logical = TRUE) %>%  # create new column for items
  spread(key = split_items, value = items_owned_logical,  fill = FALSE) %>% # spread items in new columns
  rename(no_listed_items = '<NA>')  # rename spare colums

# months
interviews_plotting3 = interviews_plotting2 %>% # data
  mutate(split_months = str_split(months_lack_food, ";")) %>% # split months
  unnest() # unlist months

# food
interviews_plotting4 =  interviews_plotting3 %>% # data
  mutate(months_lack_food_logical = TRUE) %>% # create new column for months
  spread(key=split_months, value=months_lack_food_logical, fill = FALSE) %>% # spread items in new columns
  mutate(number_month_lack_food=rowSums(select(.,Apr:Sept))) %>% # create new column for food
  mutate(number_items=rowSums(select(.,bicycle:television))) # create new column for items

# division successfull
identical (interviews_plotting4,interviews_plotting)
