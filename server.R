#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(plotly)
library(ggplot2)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        temp <- subset(iris, Species == input$species, select = c(Sepal.Length, Sepal.Width))
      
        ggplot(temp, aes(x=Sepal.Length, y=Sepal.Width)) + 
          geom_point(shape=24, color="blue", fill="blue", size=3) +
          xlab("Sepal Length") +
          ylab("Sepal Width") +
          theme(axis.title.x = element_text(hjust = 0.5, size=16, face="bold"),
                axis.title.y = element_text(hjust = 0.5, size=16, face="bold")
                )
    })

}
