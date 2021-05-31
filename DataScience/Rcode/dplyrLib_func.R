#dplyr is a powerful R-package to transform and summarize tabular data with rows and columns
#i.e data manipulation
library(dplyr)

## nycflights13 - it is a package of dataset which has list of all flights departed from newyork on 2013
library(nycflights13)#it includes airline,flight,planes,weather,airports-Click on nycflights13 package to get more info
dim(flights)
dim(planes)
dimnames(airlines)
flg = flights

## --------------Filter Func--filtering rows
months <- unique(flights$month)#O/P in variable format
day <- distinct(flights, flights$month)#O/P in dataframe format
day
filter(flights, month == 1, day == 1)#o/p is in tibble format which is nothing but the tabular format 2D with rows and columns
  #tibble displays datatype of the column along with column name where as dataframe does
cluster = filter(flights, month == 3, day == c(3,6,2,9,17,22,18,30))

## ----------Arrange func-- by default assending/reorder
arrange(flights, year, month, day)
head(arrange(cluster, year, month, desc(day)),100)
arrange(flights, desc(arr_delay))

## ----------------Select func for selecting the columns
# Select columns by name
select(flights, year, month, day)
# Select all columns between year and day (inclusive)
select(flights, year:day)
# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))


## Mutate-- Create new columns-----------------
mutate(flights,
  gain = arr_delay - dep_delay,
  speed = distance / air_time * 60
)

## -------------
mutate(flights,
  gain = arr_delay - dep_delay,
  gain_per_hour = gain / (air_time / 60)
)

## ---------------Sampling Data
sample_n(flights, 10)# n represents number 
sample_frac(flights, 0.01)#frac represents fraction i.e in this ex consider 10 % as sample data
sample_frac(flights, 0.00001)

## ---------------Group by func--Grouping of the similar data - split-apply-combine
destinations <- group_by(flights, dest)

##Summarise--summarising the value with the count---To get proper value use this after applying group_by func
summarise(destinations,
  planes = n_distinct(tailnum),#count the number of unique values
  flights = n()#returns the number of observations in a current group and it should be used in some fuction not openly used
)

## ------------------
daily <- group_by(flights, year, month, day)
(per_day   <- summarise(daily, flights = n()))
(per_month <- summarise(per_day, flights = sum(flights)))
(per_year  <- summarise(per_month, flights = sum(flights)))

## --------------
# `year` represents the integer 1
select(flights, year)
select(flights, 1)
select(flights, ends_with("time"))

## ----------------
filter(
  summarise(
    select(
      group_by(flights, year, month, day),
      arr_delay, dep_delay
    ),
    arr = mean(arr_delay, na.rm = TRUE),
    dep = mean(dep_delay, na.rm = TRUE)
  ),
  arr > 30 | dep > 30
)

###########Practice##########
titanicShip <- datasets::Titanic
titanicShip <- data.frame(titanicShip)
colnames(titanicShip)

(mutate(filter(
  summarise(
  select(group_by(titanicShip,Class,Sex),Freq),count = n(),
  Frequency = mean(Freq,na.rm= T)
  ), Frequency < 10),
  average = Frequency - 10
))

n_distinct(titanicShip$Freq)#gives the number of unique
unique(titanicShip$Freq)# gives the list of unique numbers
titanicShip <- titanicShip%>%rename(AgeCategory = Age)#%>%--Updating the value
rename(titanicShip,Age = AgeCategory)
