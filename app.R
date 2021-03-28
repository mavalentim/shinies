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
ui <- fluidPage(theme = "cerulean",

    # Application title
    titlePanel("Tuítes não tão anônimos"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "nome",
                        label = "Escolha um nome:",
                        choices = c("Ana Paula", "Beatriz",
                                    "Camila", "Marcello"))
        ),

        # Show the text
        mainPanel(
           textOutput(outputId = "escolha")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$escolha <- renderText({
        x    <- c("Gosto muito de vc!! Por que me odeias??",
                  "Ou namoral!! Quer namorar comigo?",
                  "Koe fi? Já aprendeu a bja?", "Tamo no shiny fi")
        names(x) <- c("Ana Paula", "Beatriz", "Camila", "Marcello")
        print(x[input$nome])
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
