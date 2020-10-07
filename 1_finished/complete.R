complete <- function(directory, id = 1:332) {
        
        filelist <- list.files(path = directory)
        
        nobs <- vector()
        
        idlist <- id
        
        for (i in idlist) {
                
                temp <- read.csv(file=paste(directory,"/", filelist[i],  sep = ""))
                
                test <- !is.na(temp$sulfate) & !is.na(temp$nitrate)
                
                nobs[i] <- sum(test)
        }
        data <- cbind(idlist, nobs)
        data        
        
}

complete(".")

cc <- complete(".", 6)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete(".", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

