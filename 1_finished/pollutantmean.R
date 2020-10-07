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

pollutantmean(".", "sulfate")

pollutantmean(".", "nitrate")