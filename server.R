library(shiny)
library(datasets)

run_lm <- function(df, column_name)
{
    column_name <- c("mpg", column_name)
    column_id <- c()

    for (i in 1:length(names(df)))
    {
        if ( names(df)[i] %in% column_name )
        {
            column_id <- c(column_id, i)
        }
    }
    d <- df[,column_id]
    if (length(column_name) >= 2)
    {
        fit <- lm(mpg ~ ., data = d)
    }
    fit
}

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
    
    # By declaring datasetInput as a reactive expression we ensure that:
    #
    #  1) It is only called when the inputs it depends on changes
    #  2) The computation and result are shared by all the callers (it 
    #     only executes a single time)
    #
#    datasetInput <- reactive({
#        switch(input$dataset,
#               "rock" = rock,
#               "pressure" = pressure,
#               "cars" = cars)
#    })
    
    # The output$caption is computed based on a reactive expression that
    # returns input$caption. When the user changes the "caption" field:
    #
    #  1) This expression is automatically called to recompute the output 
    #  2) The new caption is pushed back to the browser for re-display
    # 
    # Note that because the data-oriented reactive expressions below don't 
    # depend on input$caption, those expressions are NOT called when 
    # input$caption changes.
#    output$caption <- renderText({
#        input$caption
#    })
    
    # The output$summary depends on the datasetInput reactive expression, 
    # so will be re-executed whenever datasetInput is invalidated
    # (i.e. whenever the input$dataset changes)
#    output$summary <- renderPrint({
#        dataset <- datasetInput()
#        summary(dataset)
#    })
    
    # The output$view depends on both the databaseInput reactive expression
    # and input$obs, so will be re-executed whenever input$dataset or 
    # input$obs is changed. 
#    output$view <- renderTable({
#        head(datasetInput(), n = input$obs)
#    })
    
    output$desc <- renderText({
        print("The Dataset is mtcars, and the outcome variable is MPG.
              Now, you can select predictor variable(s) from the left checkbox.
              The summary of the regression model and the residuals would be shown below.")
    })

    output$column <- renderPrint({
        data(mtcars)
        
        fit <- run_lm(mtcars, input$column_name)
        (summary(fit))
    })

    output$residual <- renderPlot({
        data(mtcars)
        
        fit <- run_lm(mtcars, input$column_name) 
        e <- resid(fit)
        plot(e, main = "Residual")
        abline(0, 0)
        })
})
