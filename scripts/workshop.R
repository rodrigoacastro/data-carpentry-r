## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

rm(list=ls())

#require(readr)
require(tidyverse)

interviews = read.csv("data/SAFI_clean.csv", na="NULL")
#interviews = readr::read_csv("data/SAFI_clean.csv", na="NULL")

#interviews
as.data.frame(interviews)
View(interviews) # tidyverse package
#edit(interviews)

#colnames(interviews)


#length(is.na(interviews))

#interviews$respondent_wall_type = as.factor(interviews$respondent_wall_type)
#items_owned

#str(interviews)
dim(interviews)
#ncol
#nrow
#head
#tail

# round
# ceiling

# factor

respondent_floor_type = factor(c("earth","cement","cement","earth"))
levels(respondent_floor_type)
nlevels(respondent_floor_type)

respondent_floor_type = factor(respondent_floor_type, levels=c("earth","cement"))
respondent_floor_type

levels(respondent_floor_type)[2] = "brick"

year_fct = factor(c(1990,1983,1977,1998,1990))

as.numeric(as.character(year_fct))
as.numeric((year_fct))
as.numeric(levels(year_fct))[year_fct]

affect_conflicts = interviews$affect_conflicts
affect_conflicts = factor(affect_conflicts)
affect_conflicts

levels(affect_conflicts)

#levels(affect_conflicts)[2] = "more_than_once"

plot(affect_conflicts)


affect_conflicts = interviews$affect_conflicts
NA_pos = is.na(affect_conflicts)

affect_conflicts = as.character(affect_conflicts)
affect_conflicts[NA_pos] = 000000

affect_conflicts[NA_pos] = gsub(000000,"undetermined",affect_conflicts[NA_pos])


affect_conflicts = as.factor(affect_conflicts)
affect_conflicts
plot(affect_conflicts)
#affect_conflicts[is.na(affect_conflicts)] = "undetermined"



#affect_conflicts [is.na(affect_conflicts)] = "undetermined"

# DATETIMES - lubridate package

require("lubridate")

dates = interviews$interview_date
head(date)

# fix if dates has not been recognized
dates = ymd_hms(dates)

str(dates)

interviews$day = day(dates)
interviews$month = month(dates)
interviews$year = year(dates)

str(interviews)

