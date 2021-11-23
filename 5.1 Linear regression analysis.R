#------------------------------------------------
#           Linear regression analysis
#------------------------------------------------
# วิธีการวิเคราะห์การถดถอยพหุคูณ
mtcars
str(mtcars)

library(caTools) # caTools library use for split data train and test data
set.seed(10)
split <- sample.split(mtcars$mpg, SplitRatio = 0.8)
split

trainData <- subset(mtcars, split == T)
testData <- subset(mtcars, split == F) # splitออกมาเป็น false เราจะให้ข้อมูลนั้นเป็น test set

# Model Building
model <- lm(mpg ~ disp+hp+wt, data = trainData) #lm = linear model
summary(model)

# ถ้าค่าp-valueนี้ มีค่าน้อยกว่า0.05เราจะทำการปฏิเสธสมมติฐานหลักหรือ หมายความว่าตัวแปรนั้นมีอิทธิพลต่อตัวแปรตาม
# เราจึงควรคงตัวแปรนั้นไว้ในตัวแบบพยากรณ์
# p-valueน้อยกว่าระดับนัยยะสําคัญ 0.05 ดังนั้นตัวแปรสองตัวนี้มีอิทธิพลต่อตัวแปรตาม

# R-squared นี้มีค่า0.8307 หมายความว่าตัวแบบนี้สามารถใช้ อธิบายการเปลี่ยนแปลงของตัวแปรYได้ 83.07%

# Model Building2(cut disp)
model2 <- lm(mpg ~ hp+wt, data = trainData) #lm = linear model
summary(model2)

# fitting model prediction
predict <- predict(model2, newdata = testData)
predict

# Compare Actual VS Predicted 
compare <- cbind(rownames(testData),testData$mpg, as.numeric(predict))
# คำสั่งcbindในการนำคอลัมน์ต่าง ๆ มารวมกันเพื่อให้เห็นภาพการเปรียบเทียบชัดเจน

colnames(compare) = c('car type','actual','predict')
compare

#----------------------------------------------------------------