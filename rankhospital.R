rankhospital <- function(state, outcome, num='best'){
  data <- read.csv('outcome-of-care-measures.csv')
  
  states = sort(unique(data$State))
  outcomes = c('heart failure','heart attack','pneumonia')
  
  data['heart attack'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  data['heart failure'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  data['pneumonia'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  if(state %in% states == FALSE){
    stop('invalid state')
  }
  
  if(outcome %in% outcomes == FALSE){
    stop('invalid outcome')
  }

  if (num == 'best'){
    return(best(state, outcome))
  }
  
  if (num == 'worst'){
    return(worst(state,outcome))
  }
  
  else{
    data1 = subset(data, data[ ,7] == state)
    
    #data1[outcome] = as.numeric(data1[outcome])
    data1[outcome] = as.numeric(unlist(data1[outcome]))
    data_sort = data1[order(data1[outcome], data1[,2]),]
    
    hospital_name = data_sort$Hospital.Name[num]
  }
  return(hospital_name)
}




