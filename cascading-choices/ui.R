# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Menu Test"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    uiOutput("control1"),
    uiOutput("control2"),
    uiOutput("control3"),
    textOutput("result")
    
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    tableOutput("table1")
  )
))