#------------------------------------------------
#           Linear regression analysis
#------------------------------------------------
# �Ըա�����������ö���¾�ؤٳ
mtcars
str(mtcars)

library(caTools) # caTools library use for split data train and test data
set.seed(10)
split <- sample.split(mtcars$mpg, SplitRatio = 0.8)
split

trainData <- subset(mtcars, split == T)
testData <- subset(mtcars, split == F) # split�͡���� false ��Ҩ��������Ź���� test set

# Model Building
model <- lm(mpg ~ disp+hp+wt, data = trainData) #lm = linear model
summary(model)

# ��Ҥ��p-value��� �դ�ҹ��¡���0.05��Ҩзӡ�û���ʸ����԰ҹ��ѡ���� ���¤�����ҵ���ù�����Է�Ծŵ�͵���õ��
# ��Ҩ֧��ä�����ù�����㹵��Ẻ��ҡó�
# p-value���¡����дѺ�������Ҥѭ 0.05 �ѧ��鹵�����ͧ��ǹ�����Է�Ծŵ�͵���õ��

# R-squared ����դ��0.8307 ���¤�����ҵ��Ẻ�������ö�� ͸Ժ�¡������¹�ŧ�ͧ�����Y�� 83.07%

# Model Building2(cut disp)
model2 <- lm(mpg ~ hp+wt, data = trainData) #lm = linear model
summary(model2)

# fitting model prediction
predict <- predict(model2, newdata = testData)
predict

# Compare Actual VS Predicted 
compare <- cbind(rownames(testData),testData$mpg, as.numeric(predict))
# �����cbind㹡�ùӤ�������ҧ � ������ѹ�����������Ҿ������º��º�Ѵਹ

colnames(compare) = c('car type','actual','predict')
compare

#----------------------------------------------------------------