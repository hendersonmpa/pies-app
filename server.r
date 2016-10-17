#options(error = browser) # enter browser when there is an error
library(shiny)

source("script.r")
urineRI <- read.csv("data/UrineRI.csv", header=TRUE ,stringsAsFactors=TRUE)
urineRI.24 <- subset(urineRI,select=-c(PCT.R,NORMAL.R))
urineRI.R <- subset(urineRI,select=c(porphyrin,level,PCT.R,NORMAL.R))
stoolRI <- read.csv("data/StoolRI.csv", header=TRUE, stringsAsFactors=TRUE)

urinepanel <- function(){
    panel <- wellPanel(
        numericInput(inputId = "uroI", "Uro I",
                     value = 0),
        numericInput(inputId = "uroIII", "Uro III",
                     value = 0),
        numericInput(inputId = "hepta", "Hepta",
                     value = 0),
        numericInput(inputId = "hexa", "Hexa",
                     value = 0),
        numericInput(inputId = "penta", "Penta",
                     value = 0),
        numericInput(inputId = "coproI", "Copro I",
                     value = 0),
        numericInput(inputId = "coproIII", "Copro III",
                     value = 0)
    )
    return(panel)
}

fecalpanel <- function(){
    panel <- wellPanel(
        numericInput(inputId = "uroI", "Uro I",
                     value = 0),
        numericInput(inputId = "uroIII", "Uro III",
                     value = 0),
        numericInput(inputId = "hepta", "Hepta",
                     value = 0),
        numericInput(inputId = "hexa", "Hexa",
                     value = 0),
        numericInput(inputId = "penta", "Penta",
                     value = 0),
        numericInput(inputId = "coproI", "Copro I",
                     value = 0),
        numericInput(inputId = "coproIII", "Copro III",
                     value = 0),
        numericInput(inputId = "deutero", "Deutero",
                     value = 0),
        numericInput(inputId = "meso", "Meso",
                     value = 0),
        numericInput(inputId = "proto", "Proto",
                     value = 0)
    )
    return(panel)
}

function(input, output) {
    ## Depending on input$sample, we'll generate a different of result inputs.

    output$ui <- renderUI({
        if(is.null(input$sample))
            return()
        switch(input$sample,
               "Urine24" =  urinepanel(),
               "UrineR" =   urinepanel(),
               "Fecal" =   fecalpanel(),
               )
    })
    
    observe(if (is.null(input$sample)){
                return()
            } else if(input$sample == 'Urine24') {
                factorLevels <- c('UI','UIII', 'Hepta', 'Hexa', 'Penta','CI', 'CIII')
                intervals <- urineRI.24
                units <- 'nmol/d'
                print(units)
            }else if(input$sample == 'UrineR') {
                factorLevels <- c('UI','UIII', 'Hepta', 'Hexa', 'Penta','CI', 'CIII')
                intervals <- urineRI.R
                units <- 'umol/mol creat'
                print(units)
            }else if(input$sample == 'Fecal') {
                factorLevels <- c('UI','UIII', 'Hepta', 'Hexa', 'Penta', 'CI', 'CIII','Deutero', 'Meso', 'Proto')
                intervals <- stoolRI
                units <- 'nmol/g dry wt'
                print(units)
            })

    data <- eventReactive(input$submit, {
        if (is.null(input$sample))
            return()
        results <- switch(input$sample,
                          "Urine24" =  c(input$uroI,input$uroIII,input$hepta,input$hexa,input$penta, input$coproI, input$coproIII),
                          "UrineR" =  c(input$uroI,input$uroIII,input$hepta,input$hexa,input$penta, input$copI, input$coproIII),
                          "Fecal" =  c(input$uroI,input$uroIII,input$hepta,input$hexa,input$penta, input$coproI, input$coproIII, input$deutro, input$meso, input$proto))
        Formating(results, intervals,factorLevels)
    })
  
      
    output$conc <- renderPlot({
        RIPlot(data(),input$sample, units)
    })

    output$percent <- renderPlot({
        PropPlot(Proportion(data()),input$sample)
    })



}

## temp <- Formating(results, intervals,factorLevels)
## temp2 <- Proportion(temp)


