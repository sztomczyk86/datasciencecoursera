rankall <- function(outcome, num = "best") {
        ## Read outcome data
        outcomedata <- read.csv("outcome-of-care-measures.csv", 
                                colClasses = "character")
        ## Subset only part of the table that we will use
        outcomedata <- outcomedata[, c(2, 7, 11, 17, 23)]
        
        ## convert the character vectors to factor or numeric
        outcomedata[, 2] <- as.factor(outcomedata[, 2])
        outcomedata[, 3] <- as.numeric(outcomedata[, 3])
        outcomedata[, 4] <- as.numeric(outcomedata[, 4])
        outcomedata[, 5] <- as.numeric(outcomedata[, 5])
        
        outnames <- c("heart attack", "heart failure", 
                      "pneumonia")
        
        ## Check that state and outcome are valid
       # if (is.element(state, outcomedata[,2])==FALSE){
        #        stop('invalid state')
        #}
        
        if (is.element(outcome, outnames)==FALSE) {
                stop('invalid outcome')
        }
        
        #asign name value according to outcome to chose the correct column for
        #analysis
        if (outcome == "heart attack"){
                name <- colnames(outcomedata[3])
        } else if ( outcome == "heart failure"){
                name <- colnames(outcomedata[4])
        } else if (outcome == "pneumonia") {
                name <- colnames(outcomedata[5])
        }
        
        ## For each state, find the hospital of the given rank
        if (num == "best") {
                ranknum <- 1
        } else if ( num == "worst") {
                ranknum <- nrow(ourcomedata)
        } else if (is.numeric(num)) {
                ranknum <- num
        }
        
        #subset by outcome
        datastate <- cbind(outcomedata[1:2], outcomedata[name])
        sorted <- datastate[order(datastate[, 2],datastate[, 3],datastate[, 1]
                                 ), ]
        ranking <- data.frame()
        n <- NULL
        for (i in levels(datastate$State)){
                outcome_sub <- subset(datastate, datastate$State == i)
                ranking$ <- outcome_sub[ranknum,]
                tapply(datastate[, name], datastate$State, summary)
        }
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
        
}

levels(datastate$State)
bla <- split(datastate, datastate$State)


