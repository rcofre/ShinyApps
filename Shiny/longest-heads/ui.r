# --------------------------
#  App Title: Longest Run
#     Author: Jimmy Doi
# --------------------------

library(shiny)

# Define the overall UI
shinyUI(

  # Use a fluid Bootstrap layout
  fluidPage(

  tags$head(tags$link(rel = "icon", type = "image/x-icon", href =
  "https://webresource.its.calpoly.edu/cpwebtemplate/5.0.1/common/images_html/favicon.ico")),

    # Give the page a title
    tags$title("Longest Run of Heads or Tails"),
    titlePanel("Longest Run of Heads or Tails"),

    div("Note: Please adjust width of browser if only one column is visible.",
        style = "font-size: 9pt;color:teal"),br(),


    # Generate a row with a sidebar
    sidebarLayout(

      # Define the sidebar with one input
      sidebarPanel(

        sliderInput("trials",
                    label = h5(HTML((paste0("Number of trials (", em("n"),"):")))),
                    min = 10, max = 400, value = 200, step=10),br(),


        sliderInput("minrun",
                    label = h5("Mark run lengths of at least ..."),
                    min = 2, max = 15, value = 5, step=1),
        div("Change of specified run length will impact marked runs in current plot", style = "font-size: 9.5pt;color:teal",align="right"),br(),


        sliderInput("my.cex",
                    label = h5("Font size:"),
                    min = 1, max = 10, value = 4, step=1
                    ),br(),

        checkboxInput("checkbox", label = "Include predicted longest run and
                      prediction interval", value = TRUE),


        checkboxInput("showProp", label = "Modify probability of heads", FALSE),
        conditionalPanel(condition="input.showProp",
               sliderInput("H.prob", label=NULL,
                           #label = h5("Probability of Heads"),
                           min = .01, max = .99, value = .5, step=.01)
            )#end conditionalPanel
        ,

        div(actionButton("save", label="Generate"),align="right"),
        div("Click", tags$b("Generate")," to re-randomize outcomes based on current number of trials", style = "font-size: 9.5pt;color:teal",align="right"),br(),

        br(),



        div("Base R code by",
            a(href="http://statweb.calpoly.edu/jdoi/",target="_blank",
              "Rodrigo Cofre"),align="right", style = "font-size: 8pt"),

        div("Shiny source files:",
            a(href="https://gist.github.com/calpolystat/eee9a9e00dd4ddd68614",
              target="_blank","GitHub Gist"),align="right", style = "font-size: 8pt"),

        div(a(href="http://www.statistics.calpoly.edu/shiny",target="_blank",
              "Cal Poly Statistics Dept Shiny Series"),align="right", style = "font-size: 8pt")
      ),

      # Create a spot for the barplot
      mainPanel(

        plotOutput("coinPlot", width="100%"), HTML("<hr style='height: 2px; color: #de7008;
                                                   background-color: #df7109; border: none;'>"),

        p("If a fair coin is flipped 100 times and a streak of 7 heads (or tails) in a row is
          observed, is that an unusual result? To answer this we can simulate tosses of a fair
          coin and keep track of runs of heads or tails.",style="margin-top:-10px"),
        p("This Shiny app allows you to simulate the outcomes of a coin flipped",
          HTML(paste(em("n"),sep="")), "times. You can specify the probability of heads
          (default is 50%). Any runs of at least the length you specify will
          be marked in color, and the length of the longest run will be given. You may also choose
          to display the predicted approximate length of the longest run and an approximate 95%
          prediction interval for the length of the longest run. Details on these two estimators
          can be found in the first reference below.") ,


        p("More information on the length of the longest run can be found in the following journal
       articles:"),

        div("Schilling, M. 'The Longest Run of Heads'",
            em("The College Mathematics Journal"),", 21(3), 196--207", style="padding-left: 20px;
            display:block; border-left: 5px solid #faebbc;margin-left:0px"),
        div("Schilling, M. 'The Surprising Predictability of Long Runs'",
            em("Mathematics Magazine"),", 85(2), 141--149", style="padding-left: 20px; display:block;
            border-left: 5px solid #faebbc;margin-left:0px")
      )

    )
  )
)
