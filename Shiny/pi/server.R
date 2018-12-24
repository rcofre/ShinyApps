function(input, output) {
  
  output$scatterPlot <- renderPlot({
    x=runif(input$n,0,1)
    y=runif(input$n,0,1)
    d=(x^2+y^2<1)
    
    in.the.circle<-sum(d)
    off.the.circle<-(input$n-in.the.circle)
    
    pi_hat<-(in.the.circle/input$n)*4 
    
    title_part1 <- 'Montecarlo experiment  -  '
    title_part2 <- ' = '
    pi_hat<-(in.the.circle/input$n)*4 
 
    
    title <- bquote(.(title_part1) ~ hat(pi)[MC] ~ .(title_part2) ~ .(pi_hat))
    
    
    
    plot(x,y,col=d+1,pch=1,main = title)
    
    
    
  })
  
}


#plot(LakeHuron, type="l", main='type="l"')
#
#x=runif(input$n,0,1)
#y=runif(input$n,0,1)
#d=(x^2+y^2<1)
#plot(x,y,col=d+1,pch=1)


#in.the.circle<-sum(d)
#off.the.circle<-(input$n-in.the.circle)

#pi<-(in.the.circle/input$n)*4 

#pi