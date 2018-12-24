# ------------------
# App Title: MLE Binomial
#    Author: Gail Potter
# ------------------

shinyServer(
  function(input, output, session) {
    observe({
      if (input$n > 0 & input$n %% 1 ==0& is.numeric(input$n) & !is.na(input$n)) 
        return()
      showshinyalert(session, "shinyalert1", 
                     paste("Please enter a positive integer for n:"))
    })
    observe({
      if (input$prob >= 0 & input$prob <=1 & is.numeric(input$prob)) 
        return()
      showshinyalert(session, "shinyalert2", 
                     paste("Please enter a number between 0 and 1:"))
    })
    observe({
      if (input$n2 > 0 & input$n2 %% 1 ==0& is.numeric(input$n2) & !is.na(input$n2)) 
        return()
      showshinyalert(session, "shinyalert3", 
                     paste("Please enter a positive integer for n:"))
    })
    observe({
      if (input$x <= input$n2  & input$x %% 1 ==0& is.numeric(input$x) & 
            !is.na(input$n2) & input$x >=0) 
        return()
      showshinyalert(session, "shinyalert4", 
                     paste("Please enter an integer between 0 and ", input$n2, ":", sep=""))
    })
    
    observe({
      if (input$n3 > 0 & input$n3 %% 1 ==0& is.numeric(input$n3) & !is.na(input$n3)) 
        return()
      showshinyalert(session, "shinyalert5", 
                     paste("Please enter a positive integer for n:"))
    })
    observe({
      if (input$x2 <= input$n3  & input$x2 %% 1 ==0& is.numeric(input$x2) & 
            !is.na(input$n3) & input$x2 >=0) 
        return()
      showshinyalert(session, "shinyalert6", 
                     paste("Please enter an integer between 0 and ", input$n3, ":", sep=""))
    })
    
    output$pmf <- renderPlot({
      # draw.plotmath.cell(expression (bgroup("(", atop(x,y), ")")))
      if (!(input$n <= 0 | input$n %% 1 !=0)) n=input$n else n=10
      
      if (input$prob >= 0 & input$prob <=1 & is.numeric(input$prob)) prob = input$prob else prob=0.5
      
      plot(0:n, dbinom(0:n, size=n, prob=prob), col="blue",pch=16,
           xlab="X (number of successes)", ylab="", main=paste("Binomial Probability Mass Function, P(X=x), when p=", prob, "n=",n))
      segments(x0=0:n, y0=rep(0, (n+1)), x1=0:n, y1=dbinom(0:n, size=n, prob=prob),lwd=2,col="blue")
      abline(h=0)
      
    })
    
    output$lik = renderPlot({
      p=seq(0,1,by=0.0001)
      if (input$x <= input$n2  & input$x %% 1 ==0& is.numeric(input$x) & 
            !is.na(input$n2) & input$x >=0) x=input$x else x=0
      if (input$n2 > 0 & input$n2 %% 1 ==0& 
            is.numeric(input$n2) & !is.na(input$n2)) n=input$n2 else n2=10
      plot(p, dbinom(x=x, size=n, prob=p), type="l", ylab="", main=
             paste("Binomial likelihood function, L(p|X=", x, ", ", "n=", n, ")", sep="") )
      abline(v=x/n, col="red", lty=2)
    })
    
    output$loglik = renderPlot({
      p=seq(0,1,by=0.0001)
      if (input$x2 <= input$n3  & input$x2 %% 1 ==0& is.numeric(input$x2) & 
            !is.na(input$n3) & input$x2 >=0) x=input$x2 else x=0
      if (input$n3 > 0 & input$n3 %% 1 ==0& 
            is.numeric(input$n3) & !is.na(input$n3)) n=input$n3 else n=10
      par(mfrow=c(1,2))
      
      plot(p, dbinom(x=x, size=n, prob=p), type="l", ylab="", main=
             paste("Likelihood function, \n L(p|X=", x, ", ", "n=", n, ")", sep="") )
      abline(v=x/n, col="red", lty=2)
      
      plot(p, log(dbinom(x=x, size=n, prob=p)), type="l", ylab="", main=
             paste("Log likelihood function, \n log(L(p|X=", x, ", ", "n=", n, "))", sep="") )
      abline(v=x/n, col="red", lty=2)
      
      
      
    })
  }
)