# title: make-shot-charts
# description: this R code is used to generate charts of the hotspot of 5 players and save the chart in .pdf or .jpg to the folder
# inputs is the csv files of 5 players
# output is the plots of the hotspot of each player and the save the plot to the folder

library(ggplot2)
library(jpeg)
library(grid)
setwd("Desktop/workout01")
thompson<-read.table("data/klay-thompson.csv",sep = ",",header = TRUE)
andre<-read.table("data/andre-iguodala.csv",sep = ",",header = TRUE)
green<-read.table("data/draymond-green.csv",sep = ",",header = TRUE)
curry<-read.table("data/stephen-curry.csv",sep = ",",header = TRUE)
kevin<-read.table("data/kevin-durant.csv",sep = ",",header = TRUE)

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

pdf(file="images/klay-thompson-shot-chart.pdf",width=6.5,height=5)
ggplot(data = thompson) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object

ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

dev.off()

pdf(file="images/andre-iguodala-shot-chart.pdf",width=6.5,height=5)
ggplot(data = andre) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object

ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: andre-iguodala (2016 season)') +
  theme_minimal()

dev.off()


pdf(file="images/draymond-green-shot-chart.pdf",width=6.5,height=5)
ggplot(data = green) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object

ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: draymond-green (2016 season)') +
  theme_minimal()

dev.off()


pdf(file="images/kevin-durant-shot-chart.pdf",width=6.5,height=5)
ggplot(data = kevin) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object

ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: kevin-durant (2016 season)') +
  theme_minimal()

dev.off()

pdf(file="images/stephen-curry-shot-chart.pdf",width=6.5,height=5)
ggplot(data = curry) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object

ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: stephen-curry (2016 season)') +
  theme_minimal()

dev.off()


pdf(file="images/gsw-shot-charts.pdf",width=8,height=7)
ggplot(data = player) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))+facet_wrap(~name)

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object

ggplot(data = player) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +facet_wrap(~name)+
ggtitle('Shot Chart: gsw-shot (2016 season)') +
  theme_minimal()

dev.off()

png(filename="images/gsw-shot-charts.png",width=8,height=7,units = "in",res=200)
ggplot(data = player) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))+facet_wrap(~name)

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object

ggplot(data = player) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +facet_wrap(~name)+
  ggtitle('Shot Chart: gsw-shot (2016 season)') +
  theme_minimal()

dev.off()
