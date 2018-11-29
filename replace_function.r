# function to replace strings using factors

rm(list=ls())
ls()


#########
ex1 = c("rod","bob","tina","rod")
ex1

ex1 = as.factor(ex1)
ex1

levels(ex1)
levels(ex1)[2] = "gary"
ex1

ex1 = as.character(ex1)
ex1



#############
old_term = "gary"
new_term ="jim"
string = ex1
############

substitute_string = function(old_term,new_term, string) {
  # check if all arguments are strings
  if (!is_character(old_term)) {
    cat("old_term must be a string")
    
  } else if (!is_character(new_term)) {
    cat("new_term must be a string")
    
  } else if (!is_character(string)) {
    cat("new_term must be a string")
    
  }
  

  # factorize vector
  factor_vec = as.factor(string)
  
  # verify if old_term is present in the string
  
  occur = length(grep(old_term, factor_vec))
  
  if (occur == 0) {
    cat("old_term cannot be found, try another")
  } else {
    factor_pos = grep(old_term,levels(factor_vec))
    
    levels(factor_vec)[factor_pos] = new_term
    new_string = as.character(factor_vec)
    return(new_string)
  }

}

# TEST

substitute_string("gary","richard",ex1)
