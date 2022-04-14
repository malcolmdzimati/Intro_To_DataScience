#Practical 5

#Name and surname: 

#Student number: 


library(sqldf)
library(readr)
library(lubridate)
library(RH2)
library(stringr)
library(rJava)
library(RJDBC)

orion_employee_payroll <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_employee_payroll.csv")
orion_staff <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_staff.csv")
orion_employee_donations <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_employee_donations.csv")
orion_employee_addresses <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_employee_addresses2.csv")
orion_order_fact <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_order_fact.csv")
orion_customer <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_customer.csv")
orion_customer_type <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_customer_type.csv")
orion_sales <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_sales.csv")
orion_employee_organisation <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_5/orion_employee_organisation.csv")


# Question 1
q1a<-sqldf("SELECT Employee_ID
                  FROM orion_employee_payroll
                  WHERE MONTH(Employee_Hire_Date)='3'")

q1b<-sqldf("SELECT Employee_ID, FirstName, LastName
                  FROM orion_employee_addresses
                  WHERE Employee_ID= ANY(SELECT Employee_ID
                                            FROM orion_employee_payroll
                                            WHERE MONTH(Employee_Hire_Date)='3')
                  ORDER BY LastName")

# Question 2
q2<-sqldf("SELECT Employee_ID, Job_Title, Birth_Date, (2013-YEAR(Birth_Date)) AS Age
              FROM orion_staff
              WHERE (Job_Title='Purchasing Agent I' OR Job_Title='Purchasing Agent II')
              AND (2013-YEAR(Birth_Date)) >= ALL (SELECT (2013-YEAR(Birth_Date)) AS Age
              FROM orion_staff
              WHERE Job_Title='Purchasing Agent III')")

# Question 3


# Question 4
q4a<-sqldf("SELECT Department, SUM(Salary) AS Dept_Salary_Total
           FROM orion_employee_payroll NATURAL JOIN orion_employee_organisation
           GROUP BY Department")








