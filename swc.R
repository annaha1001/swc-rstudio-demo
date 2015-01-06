# SWC Intermediate R exercies 

# using assignment operators

x<- 5
x
x<-5
x
x=8
x

#surveys = object, surveys.csv = datafram
surveys<-read.csv(file="surveys.csv")
?read.csv
help.search("kruskal")

# Inflammation Data Example
inflam2<-read.csv(file="inflammation-02.csv")
inflam2<-read.csv(file="inflammation-02.csv", header=FALSE)
head(inflam2)
class(inflam2)
dim(inflam2)
inflam2[30,2]
inflam2[21, 2]
inflam2[ , 2]

# Mean of inflam2 for each column (day)
# MARGIN = 2 takes average for each column
apply(inflam2, MARGIN=2, mean)

# Plotting averages by day
avg_day_inflam<-apply(inflam2, MARGIN=2, mean)
plot(avg_day_inflam)

# Plotting maximum by day
max_day_inflam<-apply(inflam2, MARGIN=2, max)
plot(max_day_inflam)

#PLotting minimum by day
min_day_inflam<-apply(inflam2, MARGIN=2, min)
plot(min_day_inflam)

#PLotting stdev by day
sd_day_inflam<-apply(inflam2, MARGIN=2, sd)
plot(sd_day_inflam)

### Defining a simple function

#Fahrenheit to Kelvin function
fahr_to_kelvin<-function(temp){
  kelvin<-((temp-32)*(5/9))+273.15
  return(kelvin)
}
fahr_to_kelvin(7)

#Kelvin to Celcius Function
kelvin_to_celcius<-function(temp){
  celcius<-temp-273.15
  return(celcius)
}
kelvin_to_celcius(300)

#Using functions, convert fahrenheit to celcius
fahr_to_celcius<-function(temp){
  temp_k<-fahr_to_kelvin(temp)
  result<-kelvin_to_celcius(temp_k)
    return(result)
}
fahr_to_celcius(7)
fahr_to_celcius(32)


#Assigning a Vector
vec<-c(1, 2, 3)

#Concatonated vector:
best_practice<-c("write", "programs", "for", "people", "not", "computers")
asterisk<-"***"
new<-c(best_practice, asterisk)

fence<-function(original, wrapper){
  result<-c(wrapper, original, wrapper)
  return(result)
}
fence(best_practice, asterisk)
star<-"*"
fence(best_practice, star)

#Creating analyze function to complete analysis of inflammation data
analyze<-function(filename){
  inflam2<-read.csv(file=filename, header=FALSE)
  avg_day_inflam<-apply(inflam2, MARGIN=2, mean)
  plot(avg_day_inflam)
  max_day_inflam<-apply(inflam2, MARGIN=2, max)
  plot(max_day_inflam)
  min_day_inflam<-apply(inflam2, MARGIN=2, min)
  plot(min_day_inflam)
}
analyze("inflammation-03.csv")
analyze("inflammation-04.csv")

#Determine number of items in "best_practice"
length(best_practice)
len<-0
# for(variable in collection){
#  Do things
#   }
for(v in best_practice){
  len<-len+1
}
len

# Summing values in a vector
values<-c(1,2,3)
mysum<-function(vec){
  total=0
  for(v in vec){
    total=total+v
  }
  return(total)
}
mysum(values)

#test summation with new vector
 vec2<-c(2,3,4)
mysum(vec2)

#Creating a loop to batch analyze inflam data

list.files(pattern="csv")
list.files(pattern="inflammation")
list.files(pattern="^inflammation.+\\.csv$")
list.files(pattern="inflammation")

#can use our list.files of inflammation files above as a vector
filenames<-list.files(pattern="inflammation")
for (f in filenames){
  print(f)
  analyze(f)
}

#Write a function called "analyze all" that takes file name "pattern"
analyze_all<-function(datapattern){
  filenames<-list.files(pattern=datapattern)
  for (f in filenames){
    print(f)
    analyze(f)
  }
}
analyze_all("inflam")

#Conditional Statements
#Not covered, but information in notes
