## Deliverable 1

# loading library
library(dplyr)

# Import and read
MPG <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MPG)

# linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MPG)

# statistical metrics using the summary()function
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MPG))

## Deliverable 2

# Import and read
Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
head(Coil)

# get the mean, median, variance, and standard deviation of the suspension coil's PSI column
total_summary <- Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column
lot_summary <- Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

## Deliverable 3

# PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(Coil$PSI,mu=1500)

# Determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
t.test(subset(Coil$PSI,Coil$Manufacturing_Lot == "Lot1"),mu=1500)
t.test(subset(Coil$PSI,Coil$Manufacturing_Lot == "Lot2"),mu=1500)
t.test(subset(Coil$PSI,Coil$Manufacturing_Lot == "Lot3"),mu=1500)
