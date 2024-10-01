#load in the iris data set;
data("iris")

#view the data set;
print(iris)

#pull up the help file for the mean function;
?mean

#calculate the mean of Petal.Length and save as an object named "petal_length_mean";
petal_length_mean <- mean(iris$Petal.Length)

#view the mean; 
print(petal_length_mean)

#pull up the help file for the histogram function;
?hist

#plot the distribution of Petal.Length as a histogram;
hist(iris$Petal.Length, col = "pink", border = "white")

#bonus;
#load in ggplot2 library
library(ggplot2)

#define the data set we will be working with and call in the column we want to plot;
ggplot(data = iris, aes(x = Petal.Length)) +
  geom_histogram()

#summary statistics for sepal length;
summary(iris$Sepal.Length)

#summary statistics for sepal width;
summary(iris$Sepal.Width)

#summary statistics for petal length;
summary(iris$Petal.Length)

#summary statistics for petal width;
summary(iris$Petal.Width)

#summary statistics for species;
summary(iris$Species)
