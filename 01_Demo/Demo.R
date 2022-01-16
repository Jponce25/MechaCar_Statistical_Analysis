
x <- 3
x <- 5
numlist <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)

library(jsonlite)
demo_table2 <- fromJSON(txt='demo.json')

x <- c(3, 3, 2, 2, 5, 5, 8, 8, 9)
x[3]


# If we want to select the third row of the Year column using bracket notation, our statement would appear as follows:
demo_table[3,"Year"]
# we can also select the same data using just number indices:
demo_table[3,3]
# There is a third way to select data from an R data frame that behaves very similarly to Pandas. By using the $ operator, we can select columns from any two-dimensional R data structure as a single vector, similar to selecting a series from a Pandas DataFrame. For example, if we want to select the vector of vehicle classes from demo_table, we would use the following statement:
demo_table$"Vehicle_Class"
# Once we have selected the single vector, we can use bracket notation to select a single value.
demo_table$"Vehicle_Class"[2]


# For example, if we want to filter our used car data demo_table2 so that we only have rows where the vehicle price is greater than $10,000, we would use the following statement:
filter_table <- demo_table2[demo_table2$price > 10000,]


# For example, if we want to create a more elaborate filtered dataset from our used car data demo_table2 where price > 10000, drive == 4wd, and "clean" %in% title_status, we would use the following statement:
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status) #filter by price and drivetrain
filter_table3 <- demo_table2[("clean" %in% demo_table2$title_status) & (demo_table2$price > 10000) & (demo_table2$drive == "4wd"),]


# If we want to sample a large vector and create a smaller vector, we can set the vector to "x":
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

# capture the number of rows in demo_table in a variable. The nrow() function counts the number of rows in a dataframe.
num_rows <- 1:nrow(demo_table)
# Next, sample 3 of those rows, as shown in this code:
sample_rows <- sample(num_rows, 3)
# Finally, retrieve the requested data within the demo_table:
demo_table[sample_rows,]

#If we want to combine all three steps in a single R statement, our code would be as follows:
demo_table[sample(1:nrow(demo_table), 3),]

# Transform
library(tidyverse)

# we want to use our coworker vehicle data from the demo_table and add a column for the mileage per year, as well as label all vehicles as active, we would use the following statement:
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) #add columns to original data frame

# Group Data
# we want to group our used car data by the condition of the vehicle and determine the average mileage per condition, we would use the following dplyr statement:
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') #create summary table

# Reshape Data
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)
# gather()
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)
# spread()
wide_table <- long_table %>% spread(key="Metric",value="Score")

# compare two data frames that you expect to be equal
table <- demo_table3[,(colnames(wide_table))]
all.equal(table,wide_table)

## Plots

head(mpg)
# visualize univariate (single variable) data
plt <- ggplot(mpg,aes(x=class)) #import dataset into ggplot2
plt + geom_bar() #plot a bar plot

# compare and contrast categorical results
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count)) #import dataset into ggplot2
plt + geom_col() #plot a bar plot

plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") #plot bar plot with labels

#rotate the x-axis labels 45 degrees so they no longer overlap.
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + #plot a boxplot with labels
  theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees  

## Line plots are used to visualize the relationship between a categorical variable and a continuous numerical variable.
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) #import dataset into ggplot2
plt + geom_line()

# adjust the x-axis and y-axis tick values
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) #add line plot with labels

# scatter plots in ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty)) #import dataset into ggplot2
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)") #add scatter plot with labels

# add color
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class") #add scatter plot with labels

# color and shape
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive") #add scatter plot with multiple aesthetics

# boxplot in ggplot2
plt <- ggplot(mpg,aes(y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() #add boxplot

# set of boxplots that compares highway fuel efficiency for each car manufacturer
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy,colour=manufacturer)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot and rotate x-axis labels 45 degrees

# Heatmaps display numerical values as colors on a two-dimensional grid so that value clusters and trends are readily identifiable.
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)") #create heatmap with labels

mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + #add heatmap with labels 
  theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) #rotate x-axis labels 90 degrees

# Add Layers to Plots
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + #add boxplot
theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
geom_point() #overlay scatter plot on top


mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
 plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
 geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars

# Faceting
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees

# facet_wrap() 
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
  theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels

# Qualitative Test for Normality
ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

# Quantitative Test for Normality
shapiro.test(mtcars$wt)

# Sample
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# sample_n()function
sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# t.test()function 
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means

# produce our two sample
sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points

# t.test two samples
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

# generate our two data samples
mpg_data <- read.csv('mpg_modified.csv') #import dataset
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008

# paired datasets
t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples

# clean our data before we begin
mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor

# aov()function
aov(hp ~ cyl,data=mtcars_filt) #compare means across multiple levels

# get p-value
summary(aov(hp ~ cyl,data=mtcars_filt))

# Pearson correlation coefficient
head(mtcars)

# let's plot our two variables using the geom_point() function
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() #create scatter plot

# cor() function to quantify the strength of the correlation
cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient

# correlation example 2
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)

# plot our two variables using the geom_point() function
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price)) #import dataset into ggplot2
plt + geom_point() #create a scatter plot

# if we calculate the Pearson correlation coefficient using the cor() function
cor(used_cars$Miles_Driven,used_cars$Selling_Price) #calculate correlation coefficient

# correlation matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #convert data frame into numeric matrix
cor(used_matrix)

# linear regression model
lm(qsec ~ hp,mtcars) #create linear model

# determine our p-value and our r-squared value 
summary(lm(qsec~hp,mtcars)) #summarize linear model

# calculate the data points to use for our line plot 
model <- lm(qsec ~ hp,mtcars) #create linear model
yvals <- model$coefficients['hp']*mtcars$hp +
  model$coefficients['(Intercept)'] #determine y-axis values from linear model

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

# multiple linear regression,
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model

# statistical metrics using the summary()function
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics

# contingency table 
table(mpg$class,mpg$year) #generate contingency table

# chisq.test()function:
tbl <- table(mpg$class,mpg$year) #generate contingency table
chisq.test(tbl) #compare categorical distributions
