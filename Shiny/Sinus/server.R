function(input, output) {
  
  output$scatterPlot <- renderPlot({
    x <- seq(0,10,0.01)
    y <- (input$n)*sin(input$k*x+input$s)
    plot(x, y, type="l", ylim=c(-20, 20))
  })
  
}


#plot(LakeHuron, type="l", main='type="l"')
#plot(xrange, yrange, type="n", xlab="Age (days)", ylab="Circumference (mm)" ) 