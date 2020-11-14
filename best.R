best <- function(state, outcome){
  
  data = read.csv('outcome-of-care-measures.csv')
  
  states = unique(data$State)
  outcomes = c('heart failure','heart attack','pneumonia')
  
  if(state %in% states == FALSE){
    stop('invalid state')
  }
  if(outcome %in% outcomes == FALSE){
    stop('invalid outcome')
  }
  else {
    
    data['heart attack'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    data['heart failure'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    data['pneumonia'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    
    data1 = subset(data, data[,7] == state)
    data2 = data1[outcome]
    
    max_mortality =  which.min(as.numeric(unlist(data2)))
    hospital_name = ''
    hospital_name = data1$Hospital.Name[max_mortality]
    
  }
  

  
  return(hospital_name)
  
  
}
  

