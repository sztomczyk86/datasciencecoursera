#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$table1 <- renderPrint({
        data("diamonds")

        radio1 <- switch(input$radio1,
                         carat = diamonds$carat,
                         color = as.factor(diamonds$color),
                         cut = as.factor(diamonds$cut),
                         clarity = as.factor(diamonds$clarity))

        fit<-lm(price ~ radio1, data = diamonds)

        summary(fit)
        
    })

    output$distPlot <- renderPlot({

        data("diamonds")
        

        radio1 <- switch(input$radio1,
                       carat = diamonds$carat,
                       color = diamonds$color,
                       cut = diamonds$cut,
                       clarity = diamonds$clarity)
        
        plot1 <- ggplot(diamonds ,aes(radio1, price)) +
            xlab("Variable you chose") +
            ylab("Diamond price")
        
        if (input$radio1 == "carat"){
            plot1 + geom_jitter(aes(color=cut))
        } else {
            plot1 + geom_boxplot(aes(fill=radio1)) + scale_color_discrete()
        }

    })

})
