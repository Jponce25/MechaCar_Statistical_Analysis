# MechaCar_Statistical_Analysis

## Linear Regression to Predict MPG

<img src="https://github.com/Jponce25/MechaCar_Statistical_Analysis/blob/ce5f562e0c5a07738525265365ed72af68a1f93c/Images/1.png" width="550">

### •	Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
According to the results there are two variables that provide a non-random amount of variance (vehicle length and ground clearance), also the intercept has smaller a p-value in other words is statistically significant, it means that the intercept term explains a significant amount of variability in the dependent variable when all independent variables are equal to zero. That could mean that the significant features may need scaling or transforming to help improve the predictive power of the model. Alternatively, it may mean that there are other variables that can help explain the variability of our dependent variable that have not been included in our model.

### •	Is the slope of the linear model considered to be zero? Why or why not?
The p-value of our linear regression analysis is 5.35e-11, which is smaller than our assumed significance level of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero.

### •	Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
From our multiple linear regression model, the r-squared value is 0.7149, which means that 71% of the variability of our dependent variable (mpg) is explained using this linear model. The higher the coefficient of determination is, approximates more to real-world data. Although the multiple linear regression model is good to predicting our current dataset, the lack of significant variables is evidence of overfitting. Overfitting means that the performance of a model performs well with a current dataset but fails to generalize and predict future data correctly. 

## Summary Statistics on Suspension Coils

### •	The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

<img src="https://github.com/Jponce25/MechaCar_Statistical_Analysis/blob/ce5f562e0c5a07738525265365ed72af68a1f93c/Images/2.png" width="300">
 
The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per inch. The summary data from the total for all the lots, show us that the variance is 62.3 pounds per inch which is below the specified value. 

<img src="https://github.com/Jponce25/MechaCar_Statistical_Analysis/blob/ce5f562e0c5a07738525265365ed72af68a1f93c/Images/3.png" width="450">
 
The variance of Lot 1 and Lot 2 are within the expected design specifications of staying under 100 PSI, with variances of 0.98 and 7.47 respectively. However, the variance for Lot 3 is 170.3 which is above the design specifications and therefore do not meet the design specifications.

## T-Tests on Suspension Coils

<img src="https://github.com/Jponce25/MechaCar_Statistical_Analysis/blob/ce5f562e0c5a07738525265365ed72af68a1f93c/Images/4.png" width="450">
 
The Student's t-test is one of the most basic and popular statistical tests in the world. In statistics, we use a t-test to compare the mean of one dataset to another under a few assumptions.

Assuming our significance level was the common 0.05 percent, our p-value (0.06028) is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.

<img src="https://github.com/Jponce25/MechaCar_Statistical_Analysis/blob/ce5f562e0c5a07738525265365ed72af68a1f93c/Images/5.png" width="450">

In our first Lot, assuming the same level of significance (0.05 percent), our p-value (1) is clearly above our significance level. Meaning that we do not have sufficient evidence to reject the null hypothesis, and we would state that the Lot 1 mean and the population mean are statistically similar.

<img src="https://github.com/Jponce25/MechaCar_Statistical_Analysis/blob/ce5f562e0c5a07738525265365ed72af68a1f93c/Images/6.png" width="450">

The second suspension coils lot, assuming the same level of significance (0.05 percent), our p-value (0.6072) is above our significance level. Meaning that we accept the null hypothesis, in other words Lot 2 mean and the population mean are statistically similar.

<img src="https://github.com/Jponce25/MechaCar_Statistical_Analysis/blob/ce5f562e0c5a07738525265365ed72af68a1f93c/Images/7.png" width="450">
 
Finally, for Suspension Coils in Lot 3 assuming the significance level of 0.05 percent, the p-value (0.04168) is below our significance level. Meaning that we have to reject the null hypothesis and accept the alternative hypothesis, we would state that the two means are statistically different.

## Study Design: MechaCar vs Competition

### •	What metric or metrics are you going to test?

We want to determine the possible demand (quantity of sales) that a new car would have considering certain characteristics such as:

-	The cost

-	The color

-	Available equipment versions

-	The fuel efficiency

-	The maintenance prices

-	Technological innovations

-	Engine size

We need the data almost for two similar model from other manufacturers for the past 2 years.

### •	What is the null hypothesis or alternative hypothesis?

We need to determine which are the variables that have a greater incidence in the demand.

- Null Hypothesis (H0): The slope of the multiple linear model is zero, or m = 0.

- Alternative Hypothesis (Ha): The slope of the multiple linear model is not zero, or m ≠ 0.

### •	What statistical test would you use to test the hypothesis? And why?

Multiple linear regression builds a linear regression model with two or more independent variables. Which allows us to review each independent variable to determine if there is a significant relationship with the dependent variable.

### •	What data is needed to run the statistical test?

A random sample of n > 30 for MechaCar and their competitor, would need to be collected including the dependent variable and all the independent variable.
