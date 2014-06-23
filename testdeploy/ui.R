library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("mtcars: Selecting variables for Lenear Regression"),
    
    # Sidebar with controls to provide a caption, select a dataset, and 
    # specify the number of observations to view. Note that changes made
    # to the caption in the textInput control are updated in the output
    # area immediately as you type
    sidebarPanel(
#        textInput("caption", "Caption:", "Data Summary"),
        
#        selectInput("dataset", "Choose a dataset:", 
#                    choices = c("rock", "pressure", "cars")),
        
#        numericInput("obs", "Number of observations to view:", 10),
        
        checkboxGroupInput("column_name", 
                           label = h3("Variable Name"), 
                           choices = list("cyl" = "cyl",
                                          "disp" = "disp",
                                          "hp" = "hp",
                                          "drat" = "drat",
                                          "wt" = "wt",
                                          "qsec" = "qsec",
                                          "vs" = "vs",
                                          "am" = "am",
                                          "gear" = "gear",
                                          "carb" = "carb")
                           )
        
    ),
    
    
    # Show the caption, a summary of the dataset and an HTML table with
    # the requested number of observations
    mainPanel(
        textOutput("desc"), 
#        verbatimTextOutput("summary"), 
        
#        tableOutput("view"),

        verbatimTextOutput("column"),
        
        plotOutput("residual")
    )
))
