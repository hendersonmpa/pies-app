library("shiny")
library("shinythemes")
source("comments.r")



# Define UI for miles per gallon application
fluidPage(
    ## shinythemes::themeSelector(),
    theme =  shinytheme("superhero"),
    fluidRow(
        column(width = 3,
               img(height=150, width = 300, src = "OH-logo.png")),
        column(width = 6, offset = 1,
               ## Application title
               headerPanel("Porphyrins Interpretation Aid"))
        ),
        br(),
    ## Sidebar with controls to select the sample type
    sidebarPanel(
        radioButtons(inputId = "sample",
                     label = "Sample type",
                     choices = list("24 hour Urine" = "Urine24",
                                    "Random Urine" = "UrineR",
                                    "Fecal" = "Fecal")),
        uiOutput("ui"),
        br(),
        actionButton("submit", "Submit"),
    width = 3),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Concentration Plot",
                     h3("Concentration Plot"),
                     plotOutput("conc")),
            tabPanel("Proportion Plot",
                     h3("Proportion Plot"),
                     plotOutput("percent")
                     ),
            comments()
        )),
    fluidRow(
        column(width = 4, offset =10,
               p("Made by Matthew P.A. Henderson, PhD, FCACB")
               p("email: mhenderson at cheo dot on dot ca")
               ))
)
