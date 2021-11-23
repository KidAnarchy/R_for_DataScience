#************************************
#    2.2 Data Visualization
#************************************
# การมองภาพข้อมูล
# ซึ่งเป็นคำสั่งที่อยู่ใน แพ็คเกจ ggplot2

# aes(x,y,color,size,Alpha)

# aes หรือว่า Aesthetic
# color ก็จะหมายถึงการกำหนดสีของจุุด
# size ก็จะหมายถึงการกำหนดขนาดของจุดบนกราฟ
# Alpha ก็จะหมายถึงการกำหนดความเข้มสี ของจุดซึ่งมีค่าระหว่าง 0 ถึง 1โดยที่ถ้าค่า Alpha ยิ่งมีค่าตํ่าสีของจุดจะยิ่งจาง


# geom_function(x,y,......)

# ซึ่งจะเป็นฟังก์คั่นที่ใช้แสดงกราฟของข้อมูลได้แก่ กราฟแท่ง กราฟเส้นกราฟจุด และ อีกหลายกราฟ

# geom_point ใข้สำหรับสร้างแผนภาพกระจาย 
# scatter plot 
# geom_boxplotใช้สำหรับสร้างแผนภาพกล่อง
# geom_line ใช้สำหรับสร้างกราฟเส้นและเส้นแนวโน้มค่ะ

library(ggplot2)
View(iris)

#*********Bar Plot**************
bar <- ggplot(data=iris, aes(x=Species))
bar + geom_bar() +
  xlab("Species")+ylab("Count")+ggtitle("BarPlot of Specie")

# คำสั่ง ggplot มาบวกกับgeom ฟังก์ชั่น ซึ่งผลลัพธ์ที่ได้จาก ggplot ถูกเก็บไว้ใน object
# ชื่อว่า bar เรียบร้อยแล้วก็เราก็จะเอา bar ตัวนี้ค่ะ มาบวกกับ geom_bar เป็นการระบุว่าเราต้องการสร้างกราฟแท่ง

# xlabel ก็จะเป็นชื่อของแกน x เราจะให้เป็น Species
# ylabel ก็จะให้เป็นชื่อของแกน y ก็คือความถี่หรือว่าจำนวนนั้นเอง
# ส่วนชื่อของกราฟก็จะเป็น Bar Plot of Species 




#*********Pie Chart**************
#ในการสร้างกราฟวงกลมนี่มีความจำเป็นที่เราจะต้อง
#1.สร้างเวกเตอร์สำหรับจำนวนดอก iris ในแต่ละ Species ก่อน
#2.เราจำเป็นที่จัดต้องหาตัว position ที่เราต้องการจะระบุlabel ของจำนวนดอกลงไปในกราฟ
#3.สร้าง dataframeจำนวนหรือความถี่ โดยแยกตามSpecies 
#4.แผนภาพวงกลมโดยการใช้ฟังก์ชั่น ggplot กับgeom_bar ก่อนแล้วก็อันนี้จะเป็นต้องระบุ
# geom_text ซึ่งก็เป็น label ที่เราต้องการระบุไว้ตรงไหนเสร็จแล้ว ให้เราพิม pieเท่ากับ ggplot อันนี้คือชื่อชุดข้อมูล iris อันนี้ก็เป็น mapping นะคะ ว่าเราต้องการที่จะใช้
# ตัว species มาสร้างกราฟแล้วก็ใช้เป็นการสร้างกราฟแท่งนั่นเองนะคะ


quan <- as.vector(table(iris$Species))
pos <- cumsum(quan) - quan/2
quantity <- data.frame(Species=c("setosa","versicolor","virginica"), quantity=quan, position=pos)
pie <- ggplot(iris, aes(x=factor(1),fill=Species))+geom_bar(width = 1) +
  geom_text(data = quantity, aes(x=factor(1),y=position, label=quantity), size=5) +
  labs(x="", y="")
pie
#ผลลัพธ์ที่ได้มันจะเป็นเหมือนกับ กราฟกราฟแท่งซ้อนกันแบบนี้นะคะ ซึ่งตัวนี้ก็จะเป็น
#Species virginica ส่วนนี้ก็คือ Species versicolor และตัวนี้ก็เป็น Species setosa ซึ่ง

#เอา object ที่ได้จากฟังก์ชั่น ggplotบวกกับ geom_bar ตรงนี้นะคะแล้วก็มา บวกไปอีกทีนึงคะ ด้วยตัวcoord_polar
pie + coord_polar(theta="y")



#********Line Chart******************
View(airquality)
#กราฟเส้นจะเหมาะกับข้อมูลเชิงประมาณ
#กราฟเส้นโดยส่วนใหญ่แล้วจะใช้กับข้อมูลอนุกรมเวลาก็คือข้อมูลที่มีการเปลี่ยนแปลงไปตามเวลา

airquality <- subset(airquality, Month=5)
ggplot(airquality, aes(x=Day, y=Temp)) + geom_line(aes(colour='smooth'), show.legend = FALSE)+
  ggtitle("Daily Temperature")

#mapping ก็คือแกน x จะให้เป็นตัวแปร dayหรือว่าวันที่เท่าไหร่ส่วน y ก็จะให้เป็นอุณหภูมิ


#***********การสร้างกราฟ สำหรับ 2 ตัวแปร****************
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

# สามารถระบุความช่วงหรือว่าความกว้างของแต่ละเเท่งของ histogram ได้เค้าเราต้องการ
# ให้มันมีช่วงห่างเท่ากับเท่าไหร่ ในที่นี้เราจะระบุเป็น 0.2 แล้วก็
# สีนะคะ ระบุเป็นสีดำ
# และอันนี้คือการเติมสีในแต่ละแท่งเราจะแบ่งเป็นตาม Species แล้วก็
# จะระบุ xlabel แล้ว ylabel แลัวก็

#----------------------------------------------------------