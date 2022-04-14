# PRACTICAL 1

# Name: Batsirai Malcolm Dzimati

# Student Number: u20456078

# Data and Packages:

col1 <- c(7,1,7,4,9)
col2 <-c(7,3,7,5,2)
col3 <-c(7,7,7,7,7)


# Question 1:
cmatrix = matrix(data=1:12, nrow=4, ncol=3, byrow=FALSE)
rmatrix = matrix(data=1:12, nrow=4, ncol=3, byrow=TRUE)
m = cmatrix[2, 3]


# Question 2:
df1 = data.frame(col1, col2, col3)
df2 = df1[-c(1, 3), -c(3)]
df3 = apply(X=df2, MARGIN=2, FUN=sum)


# Question 3:
cal <- function(a, b, c){
  return(a^(b^c))
}
cc = cal(4, 3, 2)


# Question 4
valid <- function(a, b, c){
  if(c != 0){
    print(cal(a, b, c))
  }else{
    return("Invalid inputs")
  }
}
d = valid(3, 10, 0)


# Question 5
results = c()
for(i in 1:5){
  results[i]=cal(i, 2, 3)
}


# Question 6

