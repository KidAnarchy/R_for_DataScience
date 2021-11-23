#-----------------------------------------------
#       2.1 Data survey and data summary
#-----------------------------------------------
# plot( )
# boxplot( ) 
# hist( )
# stem( ) 
# pie( ) 
# matplot( )


#*********Plot()**************
x = 1:100
y = x^2

plot(x,y)

# 1.
plot(x,y,main = "y = x^2")  

# 2.
plot(x,y,main = "y = x^2", xlab = "Label of x", ylab = "Label of y")

# 3.
plot(x,y,main = "y = x^2", xlab = "Label of x", ylab = "Label of y", type = "l" )

# Put text
text(20, 1500, "y is x squared")

# Put text with expression
text(20,3000,expression(y==x^2))


#**************Boxplot()******************

k = c(2,1,4,3,1,2,5)

boxplot(k)

# Horizon style
boxplot(k, horizontal=TRUE)



#********Histogram()****************

hist(k)


#**************Stem()****************
x =sample(1:10,30,replace = TRUE)
x

stem(x)

#The decimal point is at the |
#1 | 0
#2 | 00
#3 | 0000
#4 | 000000
#5 | 00000
#6 | 00
#7 | 000
#8 | 000
#9 | 00
#10 | 00


#***************Pie()******************
z =sample(1:6,10,replace = TRUE)

pie(z)


#*************Matplot()****************
x = 1:12
y1 = x^2
y2 = x^3

matplot(x, cbind(y1,y2))

# line
matplot(x, cbind(y1,y2), type = "l")


#*************Par************************
par(mfrow = c(2,2))

plot(y1,y2)

matplot(x, cbind(y1,y2), type = "l")

hist(k)

boxplot(k)


#**************Table*********************
value = sample(1:10,10000,replace=TRUE)

table(value)


#value
#1    2    3    4    5    6      7    8    9    10 
#1017  979 1000 1024 1017 963   1028  974 1010  988

#-------------------------------------------------
