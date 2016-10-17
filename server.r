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

    intervals <- eventReactive(input$sample,{
          if(is.null(input$sample))
            return()
          switch(input$sample,
                 'Urine24'= urineRI.24,
                 'UrineR'= urineRI.R,
                 'Fecal'= stoolRI)
    })

    factorLevels <- eventReactive(input$sample,{
        if (is.null(input$sample))
            return()
        switch(input$sample,
               'Urine24' = c('UI','UIII', 'Hepta', 'Hexa', 'Penta','CI', 'CIII'),
               'UrineR' = c('UI','UIII', 'Hepta', 'Hexa', 'Penta','CI', 'CIII'),
               'Fecal' = c('UI','UIII', 'Hepta', 'Hexa', 'Penta', 'CI', 'CIII','Deutero', 'Meso', 'Proto'))
    })

    units <- eventReactive(input$sample,{
        if (is.null(input$sample))
            return()
        switch(input$sample,
               'Urine24'= 'nmol/d',
               'UrineR' = 'umol/mol creat',
               'Fecal'='nmol/g dry wt')
    })

    results <- eventReactive(input$submit, {
        if (is.null(input$sample))
            return()
        switch(input$sample,
               "Urine24" =  c(input$uroI,input$uroIII,input$hepta,input$hexa,input$penta, input$coproI, input$coproIII),
               "UrineR" =  c(input$uroI,input$uroIII,input$hepta,input$hexa,input$penta, input$coproI, input$coproIII),
               "Fecal" =  c(input$uroI,input$uroIII,input$hepta,input$hexa,input$penta, input$coproI, input$coproIII, input$deutero, input$meso, input$proto))
            })
  
    data <- eventReactive(input$submit, {
        ## print(intervals())
        ## print(factorLevels())
        ## print(results())
        Formating(results(), intervals(), factorLevels())
    })

    output$conc <- renderPlot({
        RIPlot(data(),input$sample, units())
    })

    output$percent <- renderPlot({
        PropPlot(Proportion(data()),input$sample)
    })
}
