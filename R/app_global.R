plotUI <- function(id, label = "Select a Species to filter the plot") {
  ns <- NS(id)
  tagList(
    selectInput(ns("dropDown"), label = label,
                choices = c(iris %>% distinct (Species)),
                selected = NULL),
    plotOutput(ns('plotz'))
    
  )
}

plotz <- function(input, output, session){
  
  df <- reactive({
    iris %>% filter (Species == input$dropDown)
  })
  
  output$plotz <-
    renderPlot({
      ggplot(df(), aes(x=Sepal.Length, y= Sepal.Width)) +
        geom_point()
    })
  
}