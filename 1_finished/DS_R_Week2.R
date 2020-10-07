#part 1

bla <- read.csv("332.csv")

bla$sulfate[!is.na(bla$sulfate)]

mean(bla["sulfate"][!is.na(bla["sulfate"])])

directory <- getwd()

id <- 1:332

pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        filelist <- list.files(path = directory)
        
        pol_mean <- vector(mode="numeric")
        
        for (i in id) {
                
        temp <- read.csv(file=paste(directory,"/", filelist[i],  sep = ""))
        
        
        pol_mean <- append(pol_mean, temp[pollutant][!is.na(temp[pollutant])],
                           after=length(pol_mean))
        
        }
        mean(pol_mean)
        
}


sulfate <- pollutantmean(".", "sulfate")

nitrate <- pollutantmean(".", "nitrate")


#part 2

bla <- read.csv("001.csv")

test <- !is.na(bla$sulfate) & !is.na(bla$nitrate)  
sum(test)
id <- 1:332

complete <- function(directory, id = 1:332) {
        
        filelist <- list.files(path = directory)
        
        nobs <- vector()
        
        for (i in id) {
                
                temp <- read.csv(file=paste(directory,"/", filelist[i],  sep = ""))
                
                test <- !is.na(temp$sulfate) & !is.na(temp$nitrate)
                
                nobs[i] <- sum(test)
        }
        data <- cbind(id, nobs)
        data        

}

complete(".")

#part 3

bla <- read.csv("001.csv")

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




