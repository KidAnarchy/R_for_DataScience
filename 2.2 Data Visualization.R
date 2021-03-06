#************************************
#    2.2 Data Visualization
#************************************
# ����ͧ�Ҿ������
# ����繤���觷������� ��ࡨ ggplot2

# aes(x,y,color,size,Alpha)

# aes ������� Aesthetic
# color ������¶֧��á�˹��բͧ��ش
# size ������¶֧��á�˹���Ҵ�ͧ�ش����ҿ
# Alpha ������¶֧��á�˹���������� �ͧ�ش����դ�������ҧ 0 �֧ 1�·���Ҥ�� Alpha ����դ�ҵ����բͧ�ش����觨ҧ


# geom_function(x,y,......)

# ��觨��繿ѧ���蹷�����ʴ���ҿ�ͧ���������� ��ҿ�� ��ҿ��鹡�ҿ�ش ��� �ա���¡�ҿ

# geom_point ������Ѻ���ҧἹ�Ҿ��Ш�� 
# scatter plot 
# geom_boxplot������Ѻ���ҧἹ�Ҿ���ͧ
# geom_line ������Ѻ���ҧ��ҿ�����������������

library(ggplot2)
View(iris)

#*********Bar Plot**************
bar <- ggplot(data=iris, aes(x=Species))
bar + geom_bar() +
  xlab("Species")+ylab("Count")+ggtitle("BarPlot of Specie")

# ����� ggplot �Һǡ�Ѻgeom �ѧ���� ��觼��Ѿ������ҡ ggplot �١������ object
# ������� bar ���º�������ǡ���ҡ����� bar ��ǹ���� �Һǡ�Ѻ geom_bar �繡���к������ҵ�ͧ������ҧ��ҿ��

# xlabel ����繪��ͧ͢᡹ x ��Ҩ������ Species
# ylabel �������繪��ͧ͢᡹ y ���ͤ������������Ҩӹǹ����ͧ
# ��ǹ���ͧ͢��ҿ����� Bar Plot of Species 




#*********Pie Chart**************
#㹡�����ҧ��ҿǧ�������դ������繷����Ҩе�ͧ
#1.���ҧ�ǡ��������Ѻ�ӹǹ�͡ iris ����� Species ��͹
#2.��Ҩ��繷��Ѵ��ͧ�ҵ�� position �����ҵ�ͧ��è��к�label �ͧ�ӹǹ�͡ŧ�㹡�ҿ
#3.���ҧ dataframe�ӹǹ���ͤ������ ���¡���Species 
#4.Ἱ�Ҿǧ����¡����ѧ���� ggplot �Ѻgeom_bar ��͹���ǡ��ѹ�����繵�ͧ�к�
# geom_text ��觡��� label �����ҵ�ͧ����к����ç�˹�������� �����Ҿ�� pie��ҡѺ ggplot �ѹ����ͪ��ͪش������ iris �ѹ������ mapping �Ф� �����ҵ�ͧ��÷�����
# ��� species �����ҧ��ҿ���ǡ����繡�����ҧ��ҿ�觹���ͧ�Ф�


quan <- as.vector(table(iris$Species))
pos <- cumsum(quan) - quan/2
quantity <- data.frame(Species=c("setosa","versicolor","virginica"), quantity=quan, position=pos)
pie <- ggplot(iris, aes(x=factor(1),fill=Species))+geom_bar(width = 1) +
  geom_text(data = quantity, aes(x=factor(1),y=position, label=quantity), size=5) +
  labs(x="", y="")
pie
#���Ѿ�������ѹ��������͹�Ѻ ��ҿ��ҿ�觫�͹�ѹẺ���Ф� ��觵�ǹ������
#Species virginica ��ǹ������ Species versicolor ��е�ǹ����� Species setosa ���

#��� object �����ҡ�ѧ���� ggplot�ǡ�Ѻ geom_bar �ç���Ф����ǡ��� �ǡ��ա�չ֧�� ���µ��coord_polar
pie + coord_polar(theta="y")



#********Line Chart******************
View(airquality)
#��ҿ��鹨�����СѺ�������ԧ����ҳ
#��ҿ�������ǹ�˭����Ǩ���Ѻ������͹ء�����ҡ��͢����ŷ���ա������¹�ŧ仵������

airquality <- subset(airquality, Month=5)
ggplot(airquality, aes(x=Day, y=Temp)) + geom_line(aes(colour='smooth'), show.legend = FALSE)+
  ggtitle("Daily Temperature")

#mapping ����᡹ x ������繵���� day��������ѹ������������ǹ y ���������س�����


#***********������ҧ��ҿ ����Ѻ 2 �����****************
# Scatter
scatter <- ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))
scatter + geom_point(aes(color=Species, shape=Species))+
  xlab("Sepal Length")+ylab("Sepal Width")+
  ggtitle("Sepal Length-Width")


#*************Box Plot*********************

box <- ggplot(data=iris, aes(x=Species, y=Sepal.Length))
box + geom_boxplot(aes(fill=Species))+
  ylab("Sepal Length")+ggtitle("Iris Boxplot")


# Violin Plot
box <- ggplot(data=iris, aes(x=Species, y=Sepal.Length))
box + geom_violin(aes(fill=Species))+
  ylab("Sepal Length")+ggtitle("Iris Boxplot")



#************Histogram***********************
histogram <- ggplot(data=iris, aes(x=Sepal.Width))
histogram + geom_histogram(binwidth = 0.2, color="black", aes(fill=Species))+
  xlab("Sepal Width")+ylab("Frequency")+
  ggtitle("Histogram of Sepal Length")

# ����ö�кؤ�����ǧ������Ҥ������ҧ�ͧ������觢ͧ histogram �������ҵ�ͧ���
# ����ѹ�ժ�ǧ��ҧ��ҡѺ������� 㹷������Ҩ��к��� 0.2 ���ǡ�
# �չФ� �к����մ�
# ����ѹ����͡����������������Ҩ����繵�� Species ���ǡ�
# ���к� xlabel ���� ylabel ���ǡ�

#----------------------------------------------------------