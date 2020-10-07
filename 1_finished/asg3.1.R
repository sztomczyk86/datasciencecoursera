
rankhospital <- function(state, outcome, num = "best") {
        
        ## Read outcome data
        outcomedata <- read.csv("outcome-of-care-measures.csv", 
                                colClasses = "character")
        ## Subset only part of the table that we will use
        outcomedata <- outcomedata[, c(2, 7, 11, 17, 23)]
        
        ## convert the character vectors to factorx      or numeric
        outcomedata[, 2] <- as.factor(outcomedata[, 2])
        outcomedata[, 3] <- as.numeric(outcomedata[, 3])
        outcomedata[, 4] <- as.numeric(outcomedata[, 4])
        outcomedata[, 5] <- as.numeric(outcomedata[, 5])
        
        
        outnames <- c("heart attack", "heart failure", 
                      "pneumonia")
        
        ## Check that state and outcome are valid
        if (is.element(state, outcomedata[,2])==FALSE){
                stop('invalid state')
        }
        
        if (is.element(outcome, outnames)==FALSE) {
                stop('invalid outcome')
        }
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        
        #asign name value according to outcome to chose the correct column for
        #analysis
        if (outcome == "heart attack"){
                name <- colnames(outcomedata[3])
        } else if ( outcome == "heart failure"){
                name <- colnames(outcomedata[4])
        } else if (outcome == "pneumonia") {
                name <- colnames(outcomedata[5])
        }
        
        
        #subset by state and outcome
        datastate <- subset(outcomedata, outcomedata$State == state)
        datastate <- cbind(datastate[1], datastate[name])
        testNA <- !is.na(datastate[2])
        datastate <- subset(datastate, testNA == TRUE)
        
        #assign num value 
        
        if (num == "best") {
                ranknum <- 1
        } else if ( num == "worst") {
                ranknum <- nrow(datastate)
        } else if (is.numeric(num)) {
                ranknum <- num
        }
        
        #show the rank number
        sorted <- datastate[order(datastate[, 2],datastate[, 1], na.last = TRUE), ]
        sorted$Hospital.Name[ranknum]
        
}

rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)
