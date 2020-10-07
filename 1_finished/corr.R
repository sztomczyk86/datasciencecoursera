corr  <- function(directory, treshold =0) {
        
        filelist <- list.files(path = directory)
        
        correlation <- vector()
        
        for (i in 1:length(filelist)) {
                
                temp <- read.csv(file=paste(directory,"/", filelist[i],  sep = ""))
                
                test <- !is.na(temp$sulfate) & !is.na(temp$nitrate)
                
                sum_test <- sum(test)
                
                if (sum_test > treshold){
                        correlation[i] <- cor(temp$sulfate, temp$nitrate,
                                              use = "complete.obs")
                }
                
        }
        correlation
}

cr <- corr(".")
summary(cr)

cr <- corr(".")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr(".", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr(".", 2000)                
n <- length(cr)                
cr <- corr(".", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
