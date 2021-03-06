#-----------------------------------------------------
#              Dicision Tree
#-----------------------------------------------------
# �л�Сͺ����
# 1. �˹��ҡ ���� Root Node
# 2. �˹���ҧ� Internal Node ������ͧ�������������ѭ�ѡɳ�᷹
# 3. �˹������ Leaf Node ���ͺҧ�ը����¡��� Terminal node �ѡ����ǧ�����ѭ�ѡɳ�᷹�˹��

# Use 3 Package
# 1. rpart: use for building DT
# 2. rpart.plot �������� plot ��ҿ�ͧ�����Ѵ�Թ㨷��������ҧ���
# 3. RColorBrewer ��������㹡������¹�բͧ��ҿ

# Load Library
library(dplyr)
library(caret)
library(e1071)
library(rpart)
library(rpart.plot)
library(RColorBrewer)

# data from kagger: mushroom
mushroom <- read.csv("mushrooms.csv")

mushroom %>%
  dim()   # Use for see dimension

table(mushroom$class)  # see classification on traget
# edible ���͡Թ�� poisonous ������紴͡����վ��

set.seed(123)
index <- sample(1:nrow(mushroom), 0.8*nrow(mushroom), replace = FALSE)
train_set <- mushroom[index, ]
test_set <- mushroom[-index, ]

set.seed(123)
tree_train <- rpart(class~., data=train_set, method = "class", control =rpart.control(minsplit = 1,minbucket = 1, cp = 0.05))
                                                                        
print(tree_train)
summary(tree_train)

rpart.plot(tree_train, box.palette = 'RdBu', shadow.col = 'gray', nn=TRUE)

# Model evaluate in Train
confusionMatrix(data = predict(tree_train, type = "class"), reference = train_set$class, positive = 'e')

# Predict
#tree_test <- predict(tree_train, newdata = test_set)

# Model evaluate in Test
confusionMatrix(data = predict(tree_train, newdata = test_set, type = 'class'), reference = test_set$class, positive = 'e')

#-----------------------------------------------------------