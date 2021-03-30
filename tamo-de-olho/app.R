#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Expondo os Vereadores de Juiz de Fora"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("nome_vereador",
                        "Performance do Vereador:")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("grafico")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        tabela <- rio::import('/home/matheus/Documentos/jfemdados/vereadores/meus-vereadores.csv')%>%
            filter(Autor == input$nome_vereador)

        # draw the histogram with the specified number of bins
        ggplot(data = tabela, aes(x = ))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
