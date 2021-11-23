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
#���Ѿ��������§�ͧ���ҧ�֧��ͧ��˹��ç����� binomial
summary(model1)

#�о���ҷ������ student ��е���� balance ����ռŢͧ��÷��ͺ���ص԰ҹ��龺��Ҥ���������Է����ö�����Ũ�ʵԡ���
#�դ��ᵡ��ҧ�ҡ 0 ���ҧ�չ�����Ӥѭ������¤�����ҵ���÷���ͧ��Ǵѧ����ǹ�����Է�Ծ�㹡��
#���Է�Ծŵ�͡�÷ӹ�µ���õ�����͡�èѴ���������õ��
#��Ҩ֧��ùӵ���÷���ͧ��ǹ�����㹵��Ẻ

#������ income ����ѹ�դ���ᵡ��ҧ�ҡ 0 ���ҧ����չ�����Ӥѭ�ʴ���ҵ���ù����������Է�Ծ�
#��������ǹ����㹡�÷ӹ�µ���õ�� ��Ҩ֧��ùӵ��Ẻ����͡�ҡ

#�ա��ǹ˹�觷���þԨ�óҤ�ͤ�� AIC ��� AIC ������㹡���Ѵ�س�Ҿ�ͧ���Ẻ���������յ��Ẻ�ͧ��������ҵ�ͧ������º��º�ѹ��ҵ��Ẻ�˹
#�ջ���Է���Ҿ�ա��ҡѹ ���ͤ�è����͡���Ẻ��� AIC �����

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