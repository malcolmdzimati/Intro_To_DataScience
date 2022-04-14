#Loading Required libraries:
library(sqldf)
library(RH2)
library(lubridate)

#Loading required databases
employees<- read.csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_2/employees.csv")
payroll<- read.csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_2/payroll.csv")
staff<- read.csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_2/staff.csv")

#Question 1
q1<-sqldf("SELECT Employee_ID, Employee_Gender, Marital_Status, Salary
           FROM payroll
           ORDER BY Salary DESC")
q1

#Question 2
q2<- sqldf("SELECT Employee_ID, Gender, Salary
            FROM employees
            WHERE City='Philadelphia'
            ORDER BY Salary DESC")
q2

#Question 3
q3<- sqldf("SELECT Employee_ID, Employee_Gender, Marital_Status, Salary, Salary/3 AS Tax
           FROM payroll
           ORDER BY Salary DESC")
q3

#Question 4
q4<- sqldf("SELECT Employee_ID, Salary,
            CASE
                WHEN Salary <52000 THEN 'Low'
                WHEN Salary BETWEEN 52000 AND 72000 THEN 'Medium'
                WHEN Salary >72000 THEN 'High'
            END AS Salay_Range
            FROM staff
            ORDER BY Salary DESC")

q4
  