# --------------------------
#  App Title: Longest Run
#     Author: Jimmy Doi
# --------------------------

library(shiny)
source("Coin_Flips_Runs.R")

options(shiny.error=browser)


shinyServer(function(input, output) {

  dataInput <- reactive({
    flip.gen(input$trials*(input$save>-1),input$H.prob)
    })

  
  # Fill in the spot we created for a plot
  output$coinPlot <- renderPlot({
    
    plot.flips(input$minrun,dataInput(),input$my.cex,input$checkbox)
    

####################################################################

    })
  
})
