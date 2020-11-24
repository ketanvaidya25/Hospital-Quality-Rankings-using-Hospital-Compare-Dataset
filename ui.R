data = read.csv('outcome-of-care-measures.csv')

states = unique(data$State)
if (interactive()){
shinyServer(
  fluidPage(
    setBackgroundImage(
      src = "https://cdn.hipwallpaper.com/i/15/72/wgMLUS.jpg"),
    shinythemes::themeSelector(),
    

    headerPanel(strong("Get the best ranking hospitals in US")),
    
    sidebarPanel(
      strong(p("Function Descriptions"),
      p("1. Best Hospital - Input a state and the required medical condition, it will show you the best hospital for that respective condition in the state"),
      p("2. rankHospital - Takes input the state, medical condition and a upper and lower limit of rank and displays the hospitals in the given rank range for the state"),
      p("3. rankall - Takes input medical condition and a rank and displays hospitals at the given rank in all states")),
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
      DT::dataTableOutput('h_var'),
      textOutput('besthosp')
      
    )
  )
)
}