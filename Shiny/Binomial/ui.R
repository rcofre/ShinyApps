# ------------------
# App Title: MLE Binomial
#    Author: Gail Potter
# ------------------

# A couple IMPORTANT notes on mathJax:  

# 1) withMathJax right now is only working with the developer version of Shiny,
# so that is needed in order for the math expressions to display properly.

# 2) the math expressions display in a webpage but not in the RStudio that opens
# up when testing the app.  click "Open in browser" for proper display.

if (!require("devtools"))
  install.packages("devtools")


if (!require("shinysky")) devtools::install_github("ShinySky","AnalytixWare")
library(shinysky)

  shinyUI(navbarPage("Maximum Likelihood Estimation for the Binomial distribution",
     tabPanel("Probability Mass Function",
       tags$head(tags$link(rel = "icon", type = "image/x-icon", href = 
       "https://webresource.its.calpoly.edu/cpwebtemplate/5.0.1/common/images_html/favicon.ico")),  

               fluidRow(
                 column(3,
                        wellPanel( 
                          helpText("Parameters for the binomial probability mass function"),
                          
                          shinyalert("shinyalert1", TRUE, auto.close.after=10),
                          numericInput("n", label="Number of trials", value=10),
                          shinyalert("shinyalert2", TRUE, auto.close.after=10),
                          numericInput("prob", label="Probability of success", value=0.5, min=0, max=1),
                          br(),br(),br(),
                          div("Shiny app by", 
                              a(href="http://www.gailpotter.org",target="_blank", 
                                "Gail Potter"),align="right", style = "font-size: 8pt"),
                          
                          div("Base R code by", 
                              a(href="http://www.gailpotter.org",target="_blank", 
                                "Gail Potter"),align="right", style = "font-size: 8pt"),
                          
                          div("Shiny source files:",
                              a(href="https://gist.github.com/calpolystat/8ace862e9e43f8e29d43",
                                target="_blank","GitHub Gist"),align="right", style = "font-size: 8pt"),
                          
                          div(a(href="http://www.statistics.calpoly.edu/shiny",target="_blank", 
                                "Cal Poly Statistics Dept Shiny Series"),align="right", style = "font-size: 8pt")
                        )),
                 column(9,
                        wellPanel(h3("Probability Mass Function"),
                        withMathJax(p("You have learned about the ", em("probability mass function"), "(PMF) for the binomial random variable.  
                           This is a function which has two parameters, n (number of trials) and p (probability of success), which determine its shape.
                           The function takes as input the number of successes, and gives as output the probability of that many successes in n trials.
                          The equation for the probability mass function is $$P(X=x) ={n \\choose x} p^x (1-p)^{n-x}$$")),
                          plotOutput("pmf"),
                          br(),
                          p("In an experiment, you usually don't know which of these possible PMFs is the truth, and 
                          you observe a single value of x, the number of successes.
                          The goal is to estimate p based on your observation, x.
                          This motivates the ", em("likelihood function."), " In the likelihood function, the functional form
                          is the same, but we treat p as variable and x, as fixed.  The number of trials, n, is also fixed (by the experimental design).")
                        ))
                        
                        
                      )),
  tabPanel("Likelihood Function", 
           fluidRow(
             column(3, 
                    wellPanel(
                      helpText("Specifications for the likelihood function:"),
                      shinyalert("shinyalert3", TRUE, auto.close.after=10),
                      numericInput("n2", label="Number of trials", value=10),
                      shinyalert("shinyalert4", TRUE, auto.close.after=10),
                      numericInput("x", label="Number of successes", value=0),
                      br(), br(), br(),
                      
                      div("Shiny app by", 
                          a(href="http://www.gailpotter.org",target="_blank", 
                            "Gail Potter"),align="right", style = "font-size: 8pt"),
                      
                      div("Base R code by", 
                          a(href="http://www.gailpotter.org",target="_blank", 
                            "Gail Potter"),align="right", style = "font-size: 8pt"),
                      
                      div("Shiny source files:",
                          a(href="https://gist.github.com/calpolystat/8ace862e9e43f8e29d43",
                            target="_blank","GitHub Gist"),align="right", style = "font-size: 8pt"),
                      
                      div(a(href="http://www.statistics.calpoly.edu/shiny",target="_blank", 
                            "Cal Poly Statistics Dept Shiny Series"),align="right", style = "font-size: 8pt")
                    )), 
             column(9, 
                    wellPanel(
                      h3("Likelihood function"),
                      withMathJax(p("Since the likelihood function treats p as a variable and x as fixed, it is written L(p|x, n). 
                                  The likelihood function for this example is $$L(p|x, n) ={n \\choose x} p^x (1-p)^{n-x} $$")),
                      br(),
                      plotOutput("lik"),
                      br(),
                      p("For different values of x and n, determine the value of p where the likelihood function achieves its max. 
                      This value of p is called the Maximum Likelihood Estimate (MLE) for p.  
                      Can you derive the formula for this estimator of p, in terms of x and n?")
                    )))
           
           ),
  tabPanel("Log Likelihood Function",
  fluidRow(
    column(3, 
           wellPanel(
             helpText("Specifications for the log likelihood function:"),
             shinyalert("shinyalert5", TRUE, auto.close.after=10),
             numericInput("n3", label="Number of trials", value=10),
             shinyalert("shinyalert6", TRUE, auto.close.after=10),
             numericInput("x2", label="Number of successes", value=0),
             br(), br(), br(),
             
             div("Shiny app by", 
                 a(href="http://www.gailpotter.org",target="_blank", 
                   "Gail Potter"),align="right", style = "font-size: 8pt"),
             
             div("Base R code by", 
                 a(href="http://www.gailpotter.org",target="_blank", 
                   "Gail Potter"),align="right", style = "font-size: 8pt"),
             
             div("Shiny source files:",
                 a(href="https://gist.github.com/calpolystat/8ace862e9e43f8e29d43",
                   target="_blank","GitHub Gist"),align="right", style = "font-size: 8pt"),
             
             div(a(href="http://www.statistics.calpoly.edu/shiny",target="_blank", 
                   "Cal Poly Statistics Dept Shiny Series"),align="right", style = "font-size: 8pt")
           )),
    column(9, 
           wellPanel(
             h3("Log Likelihood function"),
             withMathJax(p("In practice, it is usually easier to find the MLE by maximizing the ", em("log likelihood function"), 
                           " instead of the likelihood function.  Since the log transformation is monotone, 
                           the two functions achieve their maximum in the same place.  The log likelihood function for this example is
                           $$ \\log (L(p|x, n)) = \\log \\Big( {n \\choose x} p^x (1-p)^{n-x} \\Big) $$"
             )),
             plotOutput("loglik"),
             br(),
             p("We have introduced the concept of maximum likelihood in the context of estimating a binomial proportion, but the concept
               of maximum likelihood is very general.  Maximum likelihood is used to estimate parameters for a wide variety of distributions.")
             )),
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"
))
)
))