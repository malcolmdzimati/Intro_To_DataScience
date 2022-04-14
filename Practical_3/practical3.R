#importing required database
library(sqldf)
library(RH2)
library(lubridate)

#loading data from cvs
music_customer=read.csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_3/music_customer.csv")
orion_customer=read.csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_3/orion_customer.csv")
orion_employee_addresses=read.csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_3/orion_employee_addresses.csv")
orion_employee_payroll=read.csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_3/orion_employee_payroll.csv")

head(music_customer)

#question 1
q1<-sqldf("SELECT City, COUNT(*)
              FROM orion_employee_addresses
              GROUP BY City;")
head(q2)

#question 2
#orion_employee_payroll$Birth_Date <-as.Date(orion_employee_payroll$Birth_Date, format = "%Y/%m/%d")
#orion_employee_payroll$Employee_Hire_Date <-as.Date(orion_employee_payroll$Employee_Hire_Date, format = "%Y/%m/%d")
q2<-sqldf("SELECT Employee_ID, Birth_Date, Employee_Hire_Date, DATEDIFF(year, Birth_Date, Employee_Hire_Date) AS Age
              FROM orion_employee_payroll")
head(q2)

#question 3
q3<-sqldf("SELECT Customer_Country, COUNT(*) AS Total_Customers, 
            COUNT(
                CASE Customer_Gender WHEN 'M' 
                then 1 else null end) as MaleCount,
            COUNT(
                CASE Customer_Gender WHEN 'F' 
                then 1 else null end) as FemaleCount
            FROM orion_customer
            GROUP BY Customer_Country
            ORDER BY Total_Customers DESC")
head(q3)

#question 4
q4<-sqldf("SELECT Customer_Country, 
            COUNT(
                CASE Customer_Gender WHEN 'M' 
                then 1 else null end) as MaleCount,
            COUNT(
                CASE Customer_Gender WHEN 'F' 
                then 1 else null end) as FemaleCount
            FROM orion_customer
            GROUP BY Customer_Country
            HAVING FemaleCount > MaleCount
            ORDER BY FemaleCount DESC")
head(q4)

#question 5
q5<-sqldf("SELECT *
            FROM music_customer
            WHERE (Customer_City= 'Johannesburg' OR Customer_City= 'Pretoria') AND Customer_Email LIKE '%@yahoo.com'
            ORDER BY Customer_Name")
head(q5)




