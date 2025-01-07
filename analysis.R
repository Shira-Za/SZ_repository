#Assignment 9 by Shira Zadok ID 318958311
library(dplyr)

#### Creating data file ----
#N is not set:
subject = seq(1,N,1)
age = runif(N, 18, 60)
gender = factor(sample(c('female', 'male'), N, replace = T))
rt = runif(N, 200, 6000) #mean time in msec
depression = runif(N, 0, 100) #depression scores
sleep_duration = runif(N, 2, 12) #mean time in hours

df <- data.frame(subject, age, gender, rt, depression, sleep_duration)

#save
save(df, file = "./df.rdata")

source("functions.R")
results <- create_df(df,x,y)
