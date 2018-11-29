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

