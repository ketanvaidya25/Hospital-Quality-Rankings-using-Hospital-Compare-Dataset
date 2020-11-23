
shinyServer(

  function(input, output, session){
    
    output$selected_var <- renderText({
      function_type <- input$Task
      condition <- input$Medical_Condition
      state <- input$State
      
      if(function_type=='Best Hospital'){
        hospital_name = best(state, condition)
        paste("The Best Hospital in", input$State, "for", 
              input$Medical_Condition, "is", hospital_name)
      }

    })
    
    output$sel2_var <- DT::renderDataTable({
      function_type <- input$Task
      highrank <- input$HigherRank
      lowrank <- input$LowerRank
      condition <- input$Medical_Condition
      state2 <- input$State2
      
      if(function_type=='rankHospital'){
        hospital = rankhospital(state2, condition, highrank:lowrank)
      }
      
    })
    
    
    output$h_var <- DT::renderDataTable({
      function_type <- input$Task
      rank <- input$rank
      condition <- input$Medical_Condition
      
      h = data.frame()
      if(function_type=='rankall'){
       rankall(condition, rank)
      }
      
    })
  }
)