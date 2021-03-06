#---------------------------------------------------------
#               Hierarchical clustering
#---------------------------------------------------------
# ����觡����Ẻ�ӴѺ���������� Hierarchical Clustering���繡�����ҧ�ç���ҧ�ҡ���������ӴѺ��� ������ѡɳФ����Ἱ�Ҿ�����
# ��������ԡ�����зҧ��鹵͹�Ըշ�������㹡����������觡����Ẻ�ӴѺ��鹡��� Agglomerative ��� Divisive

# Linkage Method 
#  1. Single Linkage���繡�����������´٨ҡ������зҧ���������ش�ͧ�ѵ��� 2 cluster
#  2. complete linkage ���繡�þԨ�ó����������´٨ҡ ������зҧ����ŷ���ش �ͧ�ѵ��� cluster
#  3. Average Linkage �оԨ�ó����������´٨ҡ�������¢ͧ���зҧ�����ҧ�����ѵ��� 2 Cluster

# ����觡����Ẻ�ӴѺ��鹨������� 2 ��Ƿҧ
#  1. Agglomerative �������¡�ա���ҧ��� �Ըա�èҡ��ҧ��鹺� ��� ������ҡ���ء�ѵ���� Cluster ������ѵ�������¡�ѹ
#     ��ѡ�ҡ��鹨ж١����ѹ�� Cluster ����˭��������� � ����з�觷ء�ѵ�ض١����� Cluster ������ӴѺ��鹺��ش
#  2. Divisive �������¡�ա���ҧ˹����� �Ըա�èҡ��ŧ��ҧ ���������ء�ѵ������ѹ�� 1 Cluster �ҡ��鹨֧�¡������������ �
#     �����Ҩ��� Cluster ������ѵ�������¡�ѹ

# ********Agglomerative � Program R �������� 2 �����**********************
#  1. ����� hclust�
#  2. ����� agnes

# ----------hclust(d, method, members)--------------------------
# d ���¶֧����ԡ�����зҧ�����Ҩ��繵�ͧ���ҧ����ԡ�����зҧ��͹����ѧ���� dist
# method ���Ըա����������Ẻ Agglomerative Cluster ��� ��ͧ��˹��Ըա�������������Ը�
#       single ���� complete ���� average ���� mcquitty ���� ward.d, ward.d2 centroid ������� median
# member �����¶֧��á�˹� vector �ͧ�ӹǹ��Ҫԡ㹡���� �����Ҩ�С�˹������ NULL


# ----agnes(x, diss = inherits(x,"dist"),metric="euclidean",stand=FALSE,method="average")-----------
# x      ���¶֧����ԡ�����зҧ���� data frame �ͧ�ش�����ŴԺ����
# diss   ����������������դ���� True ���� False �繡�õ�Ǩ�ͺ��Ҥ�� x ����������
#        ������ԡ�����зҧ��������� data frame
# metric ���¶֧�Ըա�äӹǹ���зҧ��觵�ͧ��˹��� euclidean���� manhattan
#        �ҡ��� x ����������������ԡ�����зҧ����������������Թ����������ջ���ª��� �
# stand  �繡���кطҧ���͡��Ҩзӡ��standardize ��������ŧ�����ŴԺ����繤���ҵðҹ��͹�ӡ�����������������
# method ���Ըա�����������¡�˹��Ը��� single, complete, average, weight ward ������� gaverage


#**********Divisive Clustering in R**************
#
#-----diana(x, diss=inherits(x,"dist"),metric="euclidean",stand=FALSE)
# x      ���¶֧����ԡ�����зҧ ��������Ҩ���� data frame �ͧ�ش������
# diss   ����������������դ���� True ���� Fault �繡�õ�Ǩ�ͺ��Ҥ�� x ����������������ԡ�����зҧ��������� data frame
# metric ���Ըա�äӹǳ���зҧ��觵�ͧ��˹��� euclidean ���� manhattan����ҡ��� x ����������
#        ������ԡ�����зҧ�������Ǥ������ԡ��������ռ�� �
# stand  ����繡���кطҧ���͡��Ҩзӡ�� standardize�ͧ����š�͹�ӡ�����������������

#install.packages("cluster")
library(cluster)

# Online Shopping
data <- data.frame(
  age = c(22,22,23,24,48,27,28,32,34,35,38,40,55,60,50,53,40),
  online_shopping = c(15,20,30,18,25,25,30,50,65,55,68,50,20,15,35,32,40)
)

# ------Hierachical clustering using agnes()------------------
d <- dist(as.matrix(data), method="euclidean")

hc_agnes <- agnes(data, diss = inherits(data,"dist"), metric = "euclidean",
                  stand = FALSE, method = "average")  # x is data frame

hc_agnes <- agnes(d, diss = inherits(d, "dist"), metric = "euclidean",
                  stand = FALSE, method = "average") # x is matrix

hc_agnes
hc_agnes$ac

# Dedrogram Visualization
pltree(hc_agnes, cex = 0.6, hang = -1, main = "Dendrogram of agnes")

# cut tree into 3 group
sub_grp <- cutree(hc_agnes, k=3)
sub_grp

# plot graph
plot(data, col = sub_grp)

#-----------------------------------------------------

#------Divisive Clustering---------------
dv <- diana(data, stand = FALSE) #default: Euclidean

#plot(as.hclust(dv),cex=0.6, hang=-1)
pltree(dv, cex = 0.6, hang = -1, main = "Dendrogram of Diana")

#cut tree into 3 group
dc <- cutree(as.hclust(dv), k=3)
dc

#plot
plot(data, col=dc)

#-----------------------------------------------------
