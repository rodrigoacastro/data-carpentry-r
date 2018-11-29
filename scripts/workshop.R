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


#
ex1 = c("rod","bob","tina","rod")
ex1

ex1 = as.factor(ex1)
ex1

levels(ex1)
levels(ex1)[2] = "gary"
ex1

ex1 = as.character(ex1)
ex1
