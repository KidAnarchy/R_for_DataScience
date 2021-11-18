
#      Building Vector
#*************************
weigth = c(67,71,58,78,63)
weigth


#     Build Data Frame
#**************************
weight = c(67,71,58,78,63)
height = c(170,168,166,173,167)
sex = c('Male','Male','Female','Male','Female')
data = data.frame(weight, height, sex)
data


#Memder of dataframe[i,j] i=Row  j=Column
data[3,1]

#want know all hieght
data[,2] 
#or
data$height

# Want to know data of 4th person
data[4,]

#�� �ҡ������������ͧ����纹��˹ѡ�ͧ����� 1, 3 ��� 5
#����㹵���ê��� w �����������������������ѧ
w = data[c(1,3,5),1]


#������§�ӴѺ��Ңͧ�ǡ���� ������������ sort( )
#��С�����§�ӴѺ�Ǣͧ data frame �����¤���� order( )

#�� �ҡ��ͧ������§������㹵���� w ����㹵����������� w_sort
w_sort = sort(w)

#㹡óշ���ͧ���������§�ҡ�ҡ仹��� ��������� sort ����͹���
#������˹���� decreasing=TRUE
w_sort = sort(w, decreasing=TRUE)


#�� �ҡ��ͧ������§�ӴѺ������㹵���� data ������˹ѡ�ҡ������ҡ
data[order(data$weight), ]


#���������ö���������Ũҡ�ǡ������ ���¤���� sample( )
h = data$height
sample(h,3)

#���ͧ�������Ẻ᷹����Ѻ�׹������������� 3 ���� �����͡�������餹�����ӡѹ
sample(h,3,replace = TRUE)



#�� ����͵�ͧ��ô֧�����Ź��˹ѡ ��ǹ�٧ ����Ȣͧ�� 60 ��
#������������ Excel ������ data ����ÿ� D
#������������� R


#���㹡óշ���ͧ������͡������ data frame ������ R
#���������������� ����ö������������ write.table

#     Export Data File
#********************************
#Excel file
write.table(data,'D:\\data.txt')

#CSV file
write.csv(data,"D:\\data.csv")
