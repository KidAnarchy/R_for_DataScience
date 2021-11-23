#-----------------------------------------------------
#              Dicision Tree
#-----------------------------------------------------
# จะประกอบด้วย
# 1. โหนดราก หรือ Root Node
# 2. โหนดต่างๆ Internal Node จะใช้กล่องสี่เหลี่ยมเป็นสัญลักษณ์แทน
# 3. โหนดใบหรือ Leaf Node หรือบางทีจะเรียกว่า Terminal node มักจะใช้วงรีเป็นสัญลักษณ์แทนโหนดใบ

# Use 3 Package
# 1. rpart: use for building DT
# 2. rpart.plot เอาไว้ใช้ plot กราฟของต้นไม้ตัดสินใจที่เราสร้างขึ้น
# 3. RColorBrewer เอาไว้ใช้ในการเปลี่ยนสีของกราฟ

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
# edible ก็คือกินได้ poisonous ก็คือเห็ดดอกนั้นมีพิษ

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