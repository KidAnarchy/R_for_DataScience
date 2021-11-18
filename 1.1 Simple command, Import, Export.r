
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

#เช่น หากผู้วิเคราะห์ต้องการเก็บน้ำหนักของคนที่ 1, 3 และ 5
#ไปไว้ในตัวแปรชื่อ w เพื่อเอามาวิเคราะห์ในภายหลัง
w = data[c(1,3,5),1]


#การเรียงลำดับค่าของเวกเตอร์ ทำได้โดยใช้คำสั่ง sort( )
#และการเรียงลำดับแถวของ data frame ทำได้โดยคำสั่ง order( )

#เช่น หากต้องการเรียงข้อมูลในตัวแปร w ไปไว้ในตัวแปรใหม่ชื่อ w_sort
w_sort = sort(w)

#ในกรณีที่ต้องการให้เรียงจากมากไปน้อย ให้ใช้คำสั่ง sort เหมือนเดิม
#แต่ให้กำหนดค่า decreasing=TRUE
w_sort = sort(w, decreasing=TRUE)


#เช่น หากต้องการเรียงลำดับข้อมูลในตัวแปร data ตามน้ำหนักจากน้อยไปมาก
data[order(data$weight), ]


#โดยเราสามารถสุ่มข้อมูลจากเวกเตอร์ได้ ด้วยคำสั่ง sample( )
h = data$height
sample(h,3)

#แต่ต้องการสุ่มแบบแทนที่กลับคืนที่่การสุ่มทั้ง 3 ครั้ง มีโดยโอกาสสุ่มได้คนเดิมซ้ำกัน
sample(h,3,replace = TRUE)



#เช่น เมื่อต้องการดึงข้อมูลน้ำหนัก ส่วนสูง และเพศของคน 60 คน
#ที่เก็บไว้ในไฟล์ Excel ที่ชื่อ data ที่ไดรฟ์ D
#มาเก็บไว้ในโปรแกรม R


#และในกรณีที่ต้องการส่งออกข้อมูล data frame ในโปรแกรม R
#เพื่อไปใช้ในโปรแกรมอื่น สามารถทำได้โดยใช้คำสั่ง write.table

#     Export Data File
#********************************
#Excel file
write.table(data,'D:\\data.txt')

#CSV file
write.csv(data,"D:\\data.csv")
