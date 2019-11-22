#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
        output$angle <- reactive({
            x <-input$Angle[1]
            })
        output$speed <- reactive({
            v <- input$Speed
            })
        output$height <- reactive({
            h <- (input$Speed^2*sin(input$Angle[1]*pi/180)^2)/(2*9.81)
            })
        output$val1 <- reactive({
            dst <- (input$Speed^2*sin(2*input$Angle[1]*pi/180))/9.81
            })
        output$plot1 <- renderPlot({
            p1 <-seq(0,((input$Speed^2*sin(2*input$Angle[1]*pi/180))/9.81),0.01)
            y <- tan(input$Angle[1]*pi/180)*p1-(9.81/(2*(input$Speed*cos(input$Angle[1]*pi/180))^2))*p1^2
            plot(p1,y,xlab="Range [m]",ylab = "Height [m]",
                xlim = c(0,((input$Speed^2*sin(2*input$Angle[1]*pi/180))/9.81)),
                ylim = c(0,(1.01*input$Speed^2*sin(input$Angle[1]*pi/180)^2)/(2*9.81)),
                col="blue")
           })
})
