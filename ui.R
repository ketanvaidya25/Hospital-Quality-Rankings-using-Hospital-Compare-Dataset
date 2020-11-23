data = read.csv('outcome-of-care-measures.csv')

states = unique(data$State)
shinyServer(
  pageWithSidebar(
    headerPanel("Get the best ranking hospitals in US"),
    
    sidebarPanel(
      selectInput("Task","Please select the task/function",
                  choices=c("Best Hospital",'rankHospital','rankall')),
      selectInput("Medical_Condition",'Specify the disease/medical condition',
                  choices=c('heart attack','heart failure','pneumonia')),
      
      conditionalPanel(condition = "input.Task == 'Best Hospital'",
                       selectInput("State","Specify which state", choices=states)),

      conditionalPanel(condition = "input.Task == 'rankHospital'",
                       numericInput('LowerRank',"Specify the lower limit of rank",1, min=1, max=50),
                       numericInput('HigherRank',"Specify the higher limit of rank",1, min=1, max=50),
                       selectInput("State2","Specify which state", choices=states)
                       ),
      conditionalPanel(condition="input.Task == 'rankall'",
                       numericInput('rank',"Specify the rank for which you want all hospitals",1, min=1, max=50)
                       )

      ),
      
    mainPanel(
      textOutput("selected_var"),
      DT::dataTableOutput('sel2_var'),
      DT::dataTableOutput('h_var')
    )
  )
)