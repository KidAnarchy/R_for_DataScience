#-----------------------------------------------------
#              Naive Bayes
#-----------------------------------------------------
# Import Library
library(e1071)
library(caret)
library(corrplot)
library(dplyr)
###install.packages("e1071")

# Import Data
data1<-read.csv("weather_nom.csv",header=T,colClasses="factor")

# Separate data
index <- sample(1:nrow(data1), 0.7*nrow(data1), replace = FALSE)

train_set <- data1[index, ]
test_set <- data1[-index, ]

# --------Created Naive Bayes model--------
model <- naiveBayes(play~., data=train_set)
model

y <- predict(model, train_set, type = 'class')
y

# Accuracy
# library(caret)
confusionMatrix(y, reference = train_set$play, positive = 'yes')

# Test Set
test <- predict(model, newdata= test_set, type = 'class')
test

# Accuracy of Test set
confusionMatrix(test, reference = test_set$play, positive = 'yes')

# --------Predict new data-----------------
outlook <- c("sunny")
temperature <- c("mild")
humidity <- c("normal")
windy <- c("TRUE")


# --------Build DataFrame to new data------
x.data <- data.frame(outlook,temperature,humidity,windy)
x.data

#-------Prediction--------------------
predict(model, x.data, type='class')

predict(model, x.data, type = 'raw')

#--------------------------------------------------------------