rm(list = ls())
# in Window
setwd('C:\\Users\\sena-\\Dropbox\\Sx data\\R_programming')
.libPaths(c("C:\\Users\\sena-\\Dropbox\\Sx data\\R_programming\\Rlib", .libPaths()))
install.packages("magrittr")
library(magrittr)
# Question 1

df <- read.csv("bike_sharing.csv", row.names = 1, header = TRUE)
df %>% head
names(df)[names(df) == "dteday"] <- "date"
names(df)[names(df) == "yr"] <- "year"
names(df)[names(df) == "mnth"] <- "month"
names(df)[names(df) == "hr"] <- "hour"
names(df)[names(df) == "holiday"] <- "holiday"
names(df)[names(df) == "weekday"] <- "dayofweek"
names(df)[names(df) == "weathersit"] <- "weather"
names(df)[names(df) == "temp"] <- "temperature"
names(df)[names(df) == "atemp"] <- "feelslike"
names(df)[names(df) == "hum"] <- "humidity"
names(df)[names(df) == "cnt"] <- "total"

df$date <- as.Date(df$date)
df$season <- as.factor(df$season)
df$year <- as.factor(df$year)
df$holiday <- as.factor(df$holiday)
df$dayofweek <- as.factor(df$dayofweek)
df$workingday <- as.factor(df$workingday)
df$weather <- as.factor(df$weather)

str(df)

# Question 2

levels(df$year) <- c("2011", "2012")
levels(df$year)

# Question 3

df$weekend <- as.factor(df$dayofweek)
levels(df$weekend) <- c("1", "0", "0", "0", "0", "0", "1")

df$dayofweek <- NULL
df %>% head
df$weekend
df$windspeed %>% mean(na.rm = TRUE)
df1 <-na.omit(df)
df2 <-df[complete.cases(df),]
df1 %>% dim 
df2 %>% dim 

# Question 4

df$temperature
df$temperature <- 50 * df$temperature - 9
df$temperature

# Question 5

AvgSpring11Rental <- mean(df$total[df$season == "2" &
                                     df$hour == "11"],
                                  na.rm = TRUE)
AvgSpring11Rental

# Question 6

df_tmp <- subset(df, total >= 70)
df_tmp

df_tmp <- df[df$total >= 70 & complete.cases(df$total), ]
df_tmp

# Question 7

dim(df)[1]
df <- na.omit(df)
dim(df)[1]

# Question 8

df$AM <- ifelse(df$hour >= 0 & df$hour < 12, TRUE, FALSE)
df$AM
