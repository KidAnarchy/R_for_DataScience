#--------------------------------------------------
#            Artificial Neural Network
#--------------------------------------------------
# โครงข่ายประสาทเทียมจะมีส่วนประกอบอยู่ 3 ส่วนใหญ่ ๆ ด้วยกัน
# 1. Input Layer หรือข้อมูลนำเข้า ซึ่งก็คือตัวแปรอิสระนั่นเองในทาง Machine Learning จะเรียกว่า Feature 
# 2. Hidden Layer ชั้นซ่อน เป็นชั้นที่อยู่ระหว่างกลางค่ะ
# 3. Output Layer หรือข้อมูลส่งออกหรือ Output

# จำนวน Node ใน Input Layer นี้ก็จะมีจำนวนเท่ากับจำนวนปัจจัยหรือตัวแปรอิสระที่เรามีอยู่

#install.packages("neuralnet")
data('mtcars')
str(mtcars)

my_data <- mtcars[,-c(8,9)]
str(my_data)


# Scale normalization data
maxs <- apply(my_data[,], 2, max)
mins <- apply(my_data[,], 2, min)
scaled <- as.data.frame(scale(my_data[,], center = mins, scale = maxs - mins))


# Split data into Training and testing set
set.seed(1234)
index <- sample(1:nrow(my_data), 0.7*nrow(my_data), replace = FALSE)

train_set <- scaled[index,]
test_set <- scaled[-index,]


# fit model neural network
library(neuralnet)
set.seed(1234)
NN = neuralnet(mpg~., data = train_set, hidden = 1, act.fct = 'logistic')
# argument hidden ตัวนี้ระบุเป็นเท่ากับ 1หมายความว่าเราจะใช้ hidden layer แค่ 1 layer
# และจะใช้จำนวน Node ใน hidden layer นี้แค่ 1 Node เท่านั้น
# logistic =  Sigmoid function 
plot(NN)

# Prediction
predicted <- compute(NN, train_set[,2:9])

# Return normalization to original value
predict_train <- predicted$net.result*(max(my_data$mpg)-min(my_data$mpg))+min(my_data$mpg)

# Function for RMSE calculation
rmse <- function(predicted,actual){
  mse <- sum((predicted - actual)^2)/length(actual)
  return(sqrt(mse))
}

cat("Train RMSE:", rmse(predict_train, train_set$mpg))


# Prediction in testing set
predicted2 <- compute(NN, test_set[,2:9])
predict_test <- predicted2$net.result*(test_set$mpg)*(max(my_data$mpg)-min(my_data$mpg))+min(my_data$mpg)

cat("Test RMSE:", rmse(predict_test, test_set$mpg))

#-------------------------------------------------