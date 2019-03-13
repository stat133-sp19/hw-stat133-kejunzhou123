#title:data preparation and cleaning
#description: this file is about to prepare the data, to combine something and filter the data.
#input: the csv files downloaded before
#output: the cleaning data and the txt files 
library(dplyr)
getwd()
#setwd("Desktop/workout01")
thompson<-read.table("data/klay-thompson.csv",sep = ",",header = TRUE)
andre<-read.table("data/andre-iguodala.csv",sep = ",",header = TRUE)
green<-read.table("data/draymond-green.csv",sep = ",",header = TRUE)
curry<-read.table("data/stephen-curry.csv",sep = ",",header = TRUE)
kevin<-read.table("data/kevin-durant.csv",sep = ",",header = TRUE)

thompson$name='Klay Thompson'
andre$name="Andre Iguodala"
green$name="Graymond Green"
curry$name="Stephen Curry"
kevin$name="Kevin Durant"
# attach(thompson)
# attach(andre)
# attach(green)
# attach(curry)
# attach(kevin)



thompson$shot_made_flag<-ifelse(thompson$shot_made_flag=="y","shot_yes","shot_no")
andre$shot_made_flag<-ifelse(andre$shot_made_flag=="y","shot_yes","shot_no")
green$shot_made_flag<-ifelse(green$shot_made_flag=="y","shot_yes","shot_no")
curry$shot_made_flag<-ifelse(curry$shot_made_flag=="y","shot_yes","shot_no")
kevin$shot_made_flag<-ifelse(kevin$shot_made_flag=="y","shot_yes","shot_no")

thompson$minute<-thompson$period*12-thompson$minutes_remaining
andre$minute<-andre$period*12-andre$minutes_remaining
green$minute<-green$period*12-green$minutes_remaining
curry$minute<-curry$period*12-curry$minutes_remaining
kevin$minute<-kevin$period*12-kevin$minutes_remaining


sink(file='output/klay-thompson.txt')
#str(thompson)
summary(thompson)
sink()

sink(file='output/andre-iguodala.txt')
#str(thompson)
summary(andre)
sink()

sink(file='output/draymond-green.txt')
#str(thompson)
summary(green)
sink()

sink(file='output/stephen-curry.txt')
#str(thompson)
summary(curry)
sink()

sink(file='output/kevin-durant.txt')
#str(thompson)
summary(kevin)
sink()

player<-rbind(thompson,andre,green,curry,kevin)

write.csv(x=player,
          file='data/shots-data.csv')


sink(file='output/shots-data-summary.txt')
#str(thompson)
summary(player)
sink()



