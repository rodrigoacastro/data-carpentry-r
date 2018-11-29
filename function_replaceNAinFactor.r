replaceNAinLevel = function(factor_vector,new_string="undetermined") {
# inspiration: https://stackoverflow.com/questions/39126537/replace-na-in-a-factor-column
  NA_pos = is.na(factor_vector)
  
  string_vector = as.character(factor_vector)
  string_vector[NA_pos] = 999999
  
  string_vector[NA_pos] = gsub(999999,new_string,string_vector[NA_pos])
  
  
  factor_vector = as.factor(string_vector)
  #factor_vector
  return (factor_vector)
  
}

# TEST

replaceNAinLevel(affect_conflicts2)
