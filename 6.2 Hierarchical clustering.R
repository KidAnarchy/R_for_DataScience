#---------------------------------------------------------
#               Hierarchical clustering
#---------------------------------------------------------
# การแบ่งกลุ่มแบบลำดับขั้นหรือว่า Hierarchical Clusteringจะเป็นการสร้างโครงสร้างจากข้อมูลเป็นลำดับขั้น ซึ่งมีลักษณะคล้ายแผนภาพต้นไม้
# โดยใช้เมตริกซ์ระยะทางขั้นตอนวิธีที่นิยมใช้ในการวิเคราห์แบ่งกลุ่มแบบลำดับขั้นก็คือ Agglomerative และ Divisive

# Linkage Method 
#  1. Single Linkageจะเป็นการรวมกลุ่มโดยดูจากค่าระยะทางที่ใกล้ที่สุดของวัตถุใน 2 cluster
#  2. complete linkage จะเป็นการพิจารณารวมกลุ่มโดยดูจาก ค่าระยะทางที่ไกลที่สุด ของวัตถุใน cluster
#  3. Average Linkage จะพิจารณารวมกลุ่มโดยดูจากค่าเฉลี่ยของระยะทางระหว่างแต่ละวัตถุใน 2 Cluster

# การแบ่งกลุ่มแบบลำดับขั้นจะมีอยู่ 2 แนาวทาง
#  1. Agglomerative หรือเรียกอีกอย่างว่า วิธีการจากล่างขึ้นบน คือ เริ่มจากให้ทุกวัตถุเป็น Cluster ที่มีวัตถุเดียวแยกกัน
#     หลักจากนั้นจะถูกรวมกันเป็น Cluster ที่ใหญ่ขึ้นเรื่อย ๆ จนกระทั่งทุกวัตถุถูกรวมเป็น Cluster เดียวในลำดับขั้นบนสุด
#  2. Divisive หรือเรียกอีกอย่างหนึ่งว่า วิธีการจากบนลงล่าง คือเริ่มทุกวัตถุรวมกันเป็น 1 Cluster จากนั้นจึงแยกกลุ่มไปเรื่อย ๆ
#     จนกว่าจะได้ Cluster ที่มีวัตถุเดียวแยกกัน

# ********Agglomerative ใน Program R จะมีอยู่ 2 คำสั่ง**********************
#  1. คำสั่ง hclustั
#  2. คำสั่ง agnes

# ----------hclust(d, method, members)--------------------------
# d หมายถึงเมทริกซ์ระยะทางซึ่งเราจำเป็นต้องสร้างเมทริกซ์ระยะทางก่อนโดยใช้ฟังก์ชั่น dist
# method เป็นวิธีการรวมกลุ่มแบบ Agglomerative Cluster ซึ่ง ต้องกำหนดวิธีการรวมกลุ่มโดยวิธี
#       single หรือ complete หรือ average หรือ mcquitty หรือ ward.d, ward.d2 centroid หรือว่า median
# member จะหมายถึงการกำหนด vector ของจำนวนสมาชิกในกลุ่ม หรืออาจจะกำหนดค่าเป็น NULL


# ----agnes(x, diss = inherits(x,"dist"),metric="euclidean",stand=FALSE,method="average")-----------
# x      หมายถึงเมทริกซ์ระยะทางหรือ data frame ของชุดข้อมูลดิบก็ได้
# diss   เป็นอาร์กิวเมนต์ที่มีค่าเป็น True หรือ False เป็นการตรวจสอบว่าค่า x ที่ส่งเข้ามา
#        เป็นเมทริกซ์ระยะทางหรือว่าเป็น data frame
# metric หมายถึงวิธีการคำนวนระยะทางซึ่งต้องกำหนดเป็น euclideanหรือ manhattan
#        หากค่า x ที่ส่งเข้ามาเป็นเมตริกซ์ระยะทางอยู่แล้วอาร์กิวเมินต์นี้ก็จะไม่มีประโยชน์ใด ๆ
# stand  เป็นการระบุทางเลือกว่าจะทำการstandardize หรือว่าแปลงข้อมูลดิบให้เป็นค่ามาตรฐานก่อนทำการวิเคราะห์หรือไม่
# method เป็นวิธีการรวมกลุ่มโดยกำหนดวิธีเป็น single, complete, average, weight ward หรือว่า gaverage


#**********Divisive Clustering in R**************
#
#-----diana(x, diss=inherits(x,"dist"),metric="euclidean",stand=FALSE)
# x      หมายถึงเมทริกซ์ระยะทาง หรือว่าอาจจะเป็น data frame ของชุดข้อมูล
# diss   เป็นอาร์กิวเมนต์ที่มีค่าเป็น True หรือ Fault เป็นการตรวจสอบว่าค่า x ที่ส่งเข้ามาเป็นเมตริกซ์ระยะทางหรือว่าเป็น data frame
# metric เป็นวิธีการคำนวณระยะทางซึ่งต้องกำหนดเป็น euclidean หรือ manhattanซึ่งหากค่า x ที่ส่งเข้ามา
#        เป็นเมตริกซ์ระยะทางอยู่แล้วค่าเมตริกซ์ก็จะไม่มีผลใด ๆ
# stand  ก็จะเป็นการระบุทางเลือกว่าจะทำการ standardizeของก็มูลก่อนทำการวิเคราะห์หรือไม่

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
