library(ggplot2)
library(reshape2)
library(dplyr)

### Data Wrangling
Formating <- function(results, intervals,factorLevels){
  intervals.melt <- melt(intervals, id = c('porphyrin', 'level'),
                         variable.name='type')
  intervals.cast <- dcast(intervals.melt, porphyrin + type ~ level)
  intervals.cast$porphyrin <- ordered(intervals.cast$porphyrin, levels = factorLevels) # ordered factor

  patient <- data.frame(
               porphyrin = levels(intervals.cast$porphyrin),
               type = rep('Patient',length(factorLevels)),
               high = results,
               low = results)

  intervalsWPatient <- rbind(intervals.cast,patient)
  return(intervalsWPatient)
}

Proportion <- function(intervalsWPatient){
    intervals.sum <- intervalsWPatient %>%
        group_by(type) %>%
        summarize(low.sum = sum(low),
                  high.sum = sum(high))
    intervals.merge <- merge(intervalsWPatient, intervals.sum, by='type')
    intervalsPercent <- intervals.merge %>%
        group_by(type, porphyrin) %>%
        mutate(low.per = 100 * low/low.sum,
               high.per = 100 * high/high.sum)

    intervalsPercent$low.per[is.na(intervalsPercent$low.per)] <- 0

    return(intervalsPercent)
}

RIPlot <- function(intervalsWPatient, sample, units){
    titleRI <- paste('Reference Intervals for', method,
                     'Porphyrins', sep=' ')
    RI <- ggplot(intervalsWPatient, aes(x=porphyrin, colour=porphyrin)) +
        geom_errorbar(aes(ymin=low, ymax=high) ,position='dodge', size=2) +
        facet_grid(~type) +
 #       labs(title= titleRI) +
        ylab(units) +
        theme(axis.text.x=element_text(angle=90, hjust=1))
    return(RI)
}

PropPlot <- function(intervalsPercent, sample){
  titleProp <- paste('Proportions for', sample,
                     'Porphyrins', sep=' ')
  P <- ggplot(intervalsPercent, aes(x=porphyrin, colour=porphyrin)) +
      geom_errorbar(aes(ymin=low.per, ymax=high.per) ,position='dodge' ,size=2) +
      facet_grid(~type) +
        ylab('Percent') +
#          labs(title= titleProp) +
              theme(axis.text.x=element_text(angle=90, hjust=1))
  P
}

output_percent <- function(data){
    ## Create and percent table 
    temp <- temp2[data$type == "Patient", c(2,3,7)]
    colnames(temp) <- c("Porphyrin", "conc", "percent")
    return(temp)
}


## results <- c(38,12,9,0,5,101,259)
## sample <- 'Urine24'
## factorLevels <- c('UI','UIII', 'Hepta', 'Hexa', 'Penta','CI', 'CIII')
## intervals <- urineRI.24
## units <- 'nmol/d'
## ##method <- 'Urine24'
## ##method <- 'Fecal'
## temp <- Formating(results, intervals, factorLevels)
## temp2 <- Proportion(temp)
## RIPlot(temp,method, units)
## PropPlot(temp2,method)
