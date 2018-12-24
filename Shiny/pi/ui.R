fluidPage(
  
  titlePanel("Pi"),
  
  column(4, wellPanel(
    sliderInput("n", "N:",
                min = 100, max = 100000, value = 1000, step = 10)
  )),
 
  column(5,
         "Montecarlo approximation",
         
         # With the conditionalPanel, the condition is a JavaScript
         # expression. In these expressions, input values like
         # input$n are accessed with dots, as in input.n
        
                          plotOutput("scatterPlot", height = 400)
         
  )
)