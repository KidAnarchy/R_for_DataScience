#--------------------------------------------
#       Function in R 
#--------------------------------------------

#********if()**********
x = 3

if(x > 0){
  print('Positive')
}

# and

if(x > 0){
  print('Non-Negative')
} else  {
  print('Negative')
}


#*******for()**********

for(i in 1:5){
  cat("i =",i,"\n")
}


#*******while()**********

i = 0
while (i < 5) {
  i = i + 1
  cat("i =",i,"\n")
}

#-----------------------------------------
#      Funtion Building
#-----------------------------------------
Cal.Data=function(X)
{
  xbar = mean(x)
  xsum = sum(x)
  xsd = sd(x)
  xvar = var(x)
  
  cat("Mean =",xbar,"\n")
  cat("Sum =",xsum,"\n")
  cat("SD =",xsd,"\n")
  cat("Varience =",xvar,"\n")
}

x = sample(1:30,20,replace=TRUE)
x

Cal.Data(x)

#--------------------------------------
#                Count
#--------------------------------------
count10 = function(x){
  n = length(x)
  count = 0
  for(i in 1:n){
    if(x[i]>10){
      count = count+1
    }
  }
  return(count)
}

x = sample(1:30,20,replace = TRUE)
x

count10(x)

#*********************************************