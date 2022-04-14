# ASSIGNMENT 0

# Name: Batsirai Malcolm Dzimati

# Student Number: 20456078

# Data and Packages:

Heights <- seq(150,210)

# Question 1:
Y <- 5


# Question 2:
a = 4
b = 3
c = -8
X <- ((-1*b)-sqrt(b*b-1*4*a*c))/(2*a)

# Question 3:
X_rounded <- round(X, 3)


# Question 4
total_Height <- 0
count <- 0

for(i in Heights){
  total_Height = total_Height + i
  count = count+1
}

Mean_Height = total_Height/count


# Question 5
Updated_Heights = append(Heights, Mean_Height)


# Question 6
Even_Heights = c()

for(i in Heights){
  if((i %% 2) == 0){
    Even_Heights = append(Even_Heights, i)
  }
}
