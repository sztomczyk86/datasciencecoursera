
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              "acs.csv")

acs <- tbl_df(read_csv("acs.csv"))

agricultureLogical <- acs$ACR == 3 & acs$AGS == 6

which(agricultureLogical)


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "bla.jpg")

library(jpeg)
jeff <- readJPEG("bla.jpg", native = TRUE)

quantile(jeff, probs = c(0.3, 0.8))

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              "gdp.csv")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              "education.csv")

gdp <- read_csv("gdp.csv", skip = 3, skip_empty_rows = TRUE, trim_ws = TRUE)
gdp_tb <- fread("gdp.csv", skip = 3, header = TRUE, blank.lines.skip = TRUE,	
                        drop = c(3,6:10))
colnames(gdp_tb)[1] <- "CountryCode"

gdp_tb <- gdp_tb[2:191,]

edu <- read_csv("education.csv")

library(dplyr)
df <- tbl_df(merge(gdp_tb, edu, by = "CountryCode", ... =))
df$Ranking <- as.integer(df$Ranking)

bla <- arrange(df, desc(Ranking))
bla[13,]

df %>% group_by(`Income Group`) %>% summarise(mean(Ranking)) %>% print


