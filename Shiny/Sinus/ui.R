fluidPage(
  
  titlePanel("Seno"),
  
  column(4, wellPanel(
    sliderInput("n", "Amplitud:",
                min = -20, max = 20, value = 10, step = 1)
  )),
  column(4, wellPanel(
    sliderInput("k", "Frecuencia:",
                min = 1, max = 10, value = 50, step = 1)
  )),
  column(4, wellPanel(
    sliderInput("s", "Fase:",
                min = 0, max = 10, value = 5, step = 0.1)
  )),
  
  column(5,
         "The plot below will be not displayed when the slider value",
         "is less than 1.",
         
         # With the conditionalPanel, the condition is a JavaScript
         # expression. In these expressions, input values like
         # input$n are accessed with dots, as in input.n
        
                          plotOutput("scatterPlot", height = 400)
         
  )
)