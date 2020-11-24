rankall <- function(outcome, num = 'best'){
  
  data <- read.csv('outcome-of-care-measures.csv')
  
  data['heart attack'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  data['heart failure'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  data['pneumonia'] = data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  
  states = sort(unique(data$State))
  
  hospital_names = vector(length=54)
  hospital_df = data.frame()
  
  if (num == 1){
    for (i in 1:length(states)){
      hospital_names[i] = best(states[i], outcome)
    }
    hospital_df = rbind(hospital_df, data.frame(State = states, Hospital.Name = hospital_names))
    return (hospital_df)
  }
  
  if (num == 'worst'){
    for (i in 1:length(states)){
      hospital_names[i] = worst(states[i], outcome)
    }
    hospital_df = rbind(hospital_df, data.frame(State = states, Hospital.Name = hospital_names))
    return (hospital_df)
  }
  else {
    for (i in 1:length(states)){
      data_monitor = subset(data, data[,7] == states[i])
      #data_monitor[outcome] = as.numeric(unlist(data_monitor[outcome]))
      data_monitor_sort = data_monitor[order(data_monitor[outcome], data_monitor[,2]),]
      
      hospital_names[i] = data_monitor_sort$Hospital.Name[num]
      
    }
    hospital_df = rbind(hospital_df, data.frame(State = states, Hospital.Name = hospital_names))
    return(hospital_df)
    
  }
}




