#airquality = read.csv('path/airquality.csv',header=TRUE, sep=",")
#dataset::--to see all the datasets that are preloaded default
airquality <- datasets::airquality
dfair = data.frame(airquality)
####Top 10 rows and last 10 rows
head(airquality,20)
tail(airquality,10)
######Columns
airquality[,c(1,2)]#displays all rows and only 1st and 2nd column
airquality[2:80,c(2,6)]
df<-airquality[,-6]#store data in df excluding 6th column
#########################################Self#############################################################
colnames(airquality[1])#displays first colname
ncol(airquality)#returns the number of column
nrow(airquality)#returns the number of rows
names(airquality)[1]# func used to display the name of cols
names(airquality)[1] <- "Ozone_Zone"#Altering the col name
rownames(airquality)#not sure
dimnames(airquality)#displays rows and columns names
mean(airquality[,1],na.rm = T)
median(na.omit(airquality[,1]))#use na.rm or na.omit() to remove NA values
mode()# R doesnt have inbuit mode func so we use user func as below to calculate that
calcmode <- function(a) {  
        vector <- unique(a)  
        vector[which.max(tabulate(match(a, vector)))]  
}  
modeOf1stcol = calcmode(na.omit(airquality[,1]))# displays the mode
modeOf1stcol

########################End############################################
summary(airquality[,1])
airquality$Wind
summary(airquality$Wind)

###########Summary of the entire data#########

summary(airquality)

#####################Plot
plot(airquality$Wind)
plot(airquality$Temp,airquality$Wind,type="p")
plot(airquality)
# points and lines 
plot(airquality$Wind, type= "h") # p: points, l: lines,b: both, h:horizontal, o: points are highlied along with line
                                #s: solid brick lines
plot(airquality$Temp,airquality$Wind, xlab = 'Ozone Concentration', 
     ylab = 'No of Instances', main = 'Ozone levels in NY city',
     col = 'red', type = "p")
#------------------ Horizontal bar plot---------------#Only one axis is imp in bar plot
barplot(airquality$Ozone, main = 'Ozone Concenteration in air',
        ylab = 'ozone levels', col= 'blue',horiz = F,axes=F)
#------------------ Vertical bar plot---------------#
barplot(airquality$Wind, main = 'Wind in air',
        ylab = 'Wind levels', col= 'red',horiz = T,axes=T)
#Histogram
hist(airquality$Temp,breaks = "scott")# breaks should be "sturges", "fd", "freedman-diaconis", "scott"
hist(airquality$Temp, 
     main = 'Solar Radiation values in air',
     xlab = 'Solar rad.', col='red', plot = TRUE, xlim = c(20,100))

#Single box plot
boxplot(airquality$Ozone,main="Boxplot")
# Multiple box plots
boxplot(airquality[,1:4],main='Multiple')
#margin of the grid(mar(bottom,left,top,right))  
#no of rows and columns(mfrow()-to display the images in row means second image onwards it will be in row style
                #        ,mfcol()- to display the image in col means second image onwards image will be dispalyed in col

                #       mfrow/mfcol=c(no. of rows,no. of col)
#whether a border is to be included(bty) 
#and position of the 
#labels(las: 1 for horizontal, las: 0 for vertical)
#las : 0-always parallel to the axis [default] i.e values will be printed same as or parallel to y axis,
     #1-always horizontali.e vertical(values will be printed vertical to y axis),
     #2-always perpendicular to the axis,
     #3-always vertical.
#bty - box around the plot- bty is one of "o" (the default-box will be printed), "l", "7", "c", "u-half box printed", "n-no box prnted" or "]"
par(mfrow=c(3,3),mar=c(2,5,2,1),  las=1, bty="o")
plot(airquality$Ozone)
plot(airquality$Ozone, airquality$Wind)
plot(airquality$Ozone, type= "l")
plot(airquality$Ozone, type= "l")
plot(airquality$Ozone, type= "l")
barplot(airquality$Ozone, main = 'Ozone Concenteration in air',
        xlab = 'ozone levels', col='green',horiz = TRUE)
hist(airquality$Solar.R)
hist(airquality$Wind)
boxplot(airquality$Solar.R)
boxplot(airquality[,0:4], main='Multiple Box plots')
#Stabdard deviation
sd(airquality$Ozone,na.rm = T)
#variance
var(airquality$Ozone,na.rm = T)

#install e1071 pakage and load using library function to calculate skewness and kurtosis
#+value - positive kurtosis/skewness, -ve value negative kurtosis/skewness
#skewness 0-0.5/0--0.5--approx symmetric, 0.5-1/-0.5-1--moderate skewed, 1-more/-1 to more highly skewed
library(e1071)
skewness(airquality$Temp,na.rm = T)
#kurtosis 0-normal, less than 0 is -ve , grtear than 0 is +ve
kurtosis(airquality$Ozone,na.rm = T)
#Density plot
den <- density(airquality$Temp,na.rm=T)
plot(den,xlab = "Temp",col = "Red",frame = TRUE,main = "Density Plot")#not filled plot
polygon(den, col = "steelblue")#filled density-This need to be called after plot



##Home work
e_quakes<-datasets::quakes
head(e_quakes[,1:3],20)
tail(e_quakes[,c(2,5)],40)
ncol(e_quakes)#returns the number of column
summary(e_quakes$mag)
colnames(e_quakes)
mean(na.omit(e_quakes$long))
median(na.omit(e_quakes$long))
calcmode <- function(a) {  
        vector <- unique(a)  
        vector[which.max(tabulate(match(a, vector)))]  
}  
displaymode = calcmode(na.omit(e_quakes$mag))# displays the mode
a <- e_quakes[-3]
dimnames.data.frame(e_quakes)
plot(e_quakes$mag,e_quakes$depth,main="Earthquake Happening",col="Red",xlab = "magnitude"
                ,ylab = "Depth",type = 'p')
barplot(e_quakes$lat,horiz=T,xlab = "latitude")
boxplot(e_quakes$mag)
boxplot(e_quakes)
hist(e_quakes$depth)
library(e1071)
skewness(e_quakes$depth)
kurtosis(e_quakes$depth)
den1 <- density(e_quakes$depth)
plot(den1,frame=FALSE)

#########Assignment1##################
#Q7
`Q7`$Points
boxplot(`Q7`$Points,`Q7`$Score,`Q7`$Weigh)
library(e1071)
q7Den = density(`Q7`$Weigh,na.rm = T)
plot(q7Den, main = "Density Plot of Weigh", xlab = "Weigh")
polygon(q7Den,col = "steelblue")
skewness(`Q7`$Points)
kurtosis(`Q7`$Points)
#Q9_a
skewness(Q9_a$dist,na.rm = T)
kurtosis(Q9_a$dist,na.rm = T)
hist(Q9_a$speed)
boxplot(Q9_a$speed,Q9_a$dist)
#Q9_b
skewness(Q9_b$WT,na.rm = T)
kurtosis(Q9_b$WT,na.rm = T)
hist(Q9_b$WT)
boxplot(Q9_b$WT,Q9_b$SP)
#Q12
student <- c(34,36,36,38,38,39,39,40,40,41,41,41,41,42,42,45,49,56)
hist(student, xlab = "student marks")
skewness(student,na.rm = T)
kurtosis(student,na.rm = T)
