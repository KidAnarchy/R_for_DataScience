#--------------------------------------------------
#            Artificial Neural Network
#--------------------------------------------------
# �ç���»���ҷ����������ǹ��Сͺ���� 3 ��ǹ�˭� � ���¡ѹ
# 1. Input Layer ���͢����Ź���� ��觡��͵��������й���ͧ㹷ҧ Machine Learning �����¡��� Feature 
# 2. Hidden Layer ��鹫�͹ �繪�鹷�����������ҧ��ҧ���
# 3. Output Layer ���͢��������͡���� Output

# �ӹǹ Node � Input Layer ������ըӹǹ��ҡѺ�ӹǹ�Ѩ������͵��������з�����������

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
# argument hidden ��ǹ���к�����ҡѺ 1���¤��������Ҩ��� hidden layer �� 1 layer
# ��Ш���ӹǹ Node � hidden layer ����� 1 Node ��ҹ��
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