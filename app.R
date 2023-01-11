library(DT)
library(xlsx)

urlfile<-'https://raw.githubusercontent.com/erica-scarpa/hidden-in-plain-sight/main/unpublished-literature-main.csv'
df<-read.csv(url(urlfile), sep=";", row.names=NULL)

ui <- fluidPage(
  titlePanel("Quote, Mentioned, and Referenced Ebla Tablets"),
  
  # Main panel for displaying outputs ----
  mainPanel(
    dataTableOutput("dynamic"),
    width = 12
  )
)

server <- function(input, output, session) {
  # output$plot <- renderPlot({
  #   dist <- input$Published
  #   n <- input$Status
  #   
  #   hist(d(),
  #        main = paste("r", dist, "(", n, ")", sep = ""),
  #        col = "#75AADB", border = "white")
  # })
  output$dynamic <- renderDataTable(df, 
                                    colnames = c('ID' = 1),
                                    filter = list(position = 'top', clear = TRUE),
                                    options = list(
                                      pageLength = 15,
                                      autoWidth = TRUE
                                      )
  )
}

shinyApp(ui, server)