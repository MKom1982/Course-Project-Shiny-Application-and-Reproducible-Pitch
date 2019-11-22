#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(fluidPage(
    titlePanel("Basic physics - projectile motion"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("Angle",
                        "Trajectory angle:",
                        min = 0,
                        max = 90,
                        value = 0),
            numericInput("Speed", "Speed of throw in m/s", value = 1, min = 1, max = 1000),
        ),
        mainPanel(
            h3("Selected angle of motion:"),
            textOutput("angle"),
            h3("Selected speed of motion in m/s:"),
            textOutput("speed"),
            h3("Height of projectile motion in m:"),
            textOutput("height"),
            h3("Range of projectile motion in m:"),
            textOutput("val1"),
            plotOutput("plot1")
        )
    )
))
