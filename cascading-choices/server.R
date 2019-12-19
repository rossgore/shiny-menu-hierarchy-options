library(shiny)

## test dataframe
df <- data.frame(option1 = c("A","A","B","B","C","C"),
                 option2 = c("A1","A2","B3","B1","C2","C3"),
                 option3 = c(T,F,T,F,T,F),
                 option4 = c("a","b","c","d","e","f"))

shinyServer(function(input, output, session) {
  
  ## would like to be able to change the rows displayed here eventually
  output$table1 <- renderTable({
    df
  })
  
  output$result <- renderText({
    x <- input$menu1
    y <- input$menu2
    z <- as.logical(input$menu3) ## has been changed to a character "true"
    
    if (any(
      is.null(x),
      is.null(y),
      is.null(z)
    )) 
      return("Select")
    
    choice4 <- df[df$option1 == x & df$option2 == y & df$option3 == z,
                  "option4"]
    
    text <- paste("Your choice is: ",as.character(choice4))
    #  browser()
    
  })
  
  output$control1 <- renderUI({
    selectInput("menu1", "Menu1", choices = unique(df$option1))
  })
  
  output$control2 <- renderUI({
    x <- input$menu1
    if (any(
      is.null(x)
    )) 
      return("Select")
    choice2 <- df[df$option1 == x, 
                  "option2"]
    selectInput("menu2", "Menu2", choices = choice2)
  })
  
  output$control3 <- renderUI({
    x <- input$menu1
    y <- input$menu2
    if (any(
      is.null(x),
      is.null(y)
    )) 
      return("Select")
    
    choice3 <- df[df$option1 == x & df$option2 == y,
                  "option3"]
    
    selectInput("menu3", "Menu3", choices = choice3)
  })
  
  ## use these?
  #   outputOptions(output, "menu1", priority = 1)
  #   outputOptions(output, "menu2", priority = 2)
  #   outputOptions(output, "menu3", priority = 3)
  
})