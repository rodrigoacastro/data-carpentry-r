replaceNAinLevel = function(factor_vector) {
# inspiration: https://stackoverflow.com/questions/39126537/replace-na-in-a-factor-column
  NA_pos = is.na(factor_vector)
  
  string_vector = as.character(factor_vector)
  string_vector[NA_pos] = 000000
  
  string_vector[NA_pos] = gsub(000000,"undetermined",string_vector[NA_pos])
  
  
  factor_vector = as.factor(string_vector)
  #factor_vector
  return (factor_vector)
  
}


replaceNAinLevel(affect_conflicts2)
