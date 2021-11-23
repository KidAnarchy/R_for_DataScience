#-----------------------------------------------------------------------
#                         Logistic Regression
#-----------------------------------------------------------------------
#install.packages("ISLR")
#install.packages("broom")
#install.packages("caret")
library(ISLR)
library(broom)
library(caret)

# Load Data
data <- ISLR::Default
str(data)

#install.packages('caTools')
library(caTools)
set.seed(1234)
split <- sample.split(data$default, SplitRatio = 0.8)
traindata <- subset(data, split == T)
testdata <- subset(data, split == F)

# Model Building
model1 <- glm(formula = default~., family='binomial', data = traindata)
#ผลลัพธ์มีได้เพียงสองอย่างจึงต้องกำหนดตรงนี้เป็น binomial
summary(model1)

#จะพบว่าที่ตัวแปร student และตัวแปร balance นี้มีผลของการทดสอบสมมุติฐานนี้พบว่าค่าสัมประสิทธิ์การถดถอยโลจิสติกนี้
#มีค่าแตกต่างจาก 0 อย่างมีนัยยะสำคัญนั่นหมายความว่าตัวแปรทั้งสองตัวดังกล่าวนี้มีอิทธิพลในการ
#มีอิทธิพลต่อการทำนายตัวแปรตามหรือการจัดกลุ่มตัวแปรตาม
#เราจึงควรนำตัวแปรทั้งสองตัวนี้ไว้ในตัวแบบ

#แต่ตัวแปร income นี้มันมีความแตกต่างจาก 0 อย่างไม่มีนัยยะสำคัญแสดงว่าตัวแปรนี้ไม่ได้มีอิทธิพล
#หรือมีส่วนช่วยในการทำนายตัวแปรตาม เราจึงควรนำตัวแบบนี้ออกจาก

#อีกส่วนหนึ่งที่ควรพิจารณาคือค่า AIC ค่า AIC นี้จะใช้ในการวัดคุณภาพของตัวแบบเมื่อเรามีตัวแบบสองตัวและเราต้องการเปรียบเทียบกันว่าตัวแบบไหน
#มีประสิทธิภาพดีกว่ากัน ก็คือควรจะเลือกตัวแบบค่า AIC น้อยๆ

# fitting model
model2 <- glm(formula = default ~ student+balance, family='binomial', data = traindata)
summary(model2)

# Classification
predict <- predict(model2, newdata = testdata, type = 'response')

# Confusion Matrix
table(testdata$default, predict > 0.5)

#     FALSE TRUE
#No   1926    7
#Yes    40   27
accuracy <- (1926+27)/2000
accuracy

#--------------------------------------------------------------------------