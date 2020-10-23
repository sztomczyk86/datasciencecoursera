#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Plot diamond properties against its price and construct simple 
               linear model with price as outcome and the variable of your choice
               as the predictor"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            radioButtons(
                "radio1",
                "Choose variable to analyze",
                choices = c("Carat"="carat","Color"="color","Cut"="cut",
                            "Clarity"="clarity")
            ),
        ),

        # Show a plot of the generated distribution
        mainPanel(h4("Plot of the diamond price against your selected variable"),
            plotOutput("distPlot"),
            h4("The linear model with price as outcome and your selected variable
               as predictor"),
            verbatimTextOutput("table1")
        )
    )
))
