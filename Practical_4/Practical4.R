# PRACTICAL 4

# Name: Malcolm Dzimati

# Student Number: u20456078

library(sqldf)
library(stringr)
library(readr)
library(RH2)
library(lubridate)
library(rJava)
library(RJDBC)

orion_customer <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/orion_customer.csv") 
orion_product_dim <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/orion_product_dim.csv") 
orion_order_fact <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/orion_order_fact.csv") 
orion_sales <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/orion_sales.csv") 
orion_employee_addresses <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/orion_employee_addresses.csv") 


ultimate_employee <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/ultimate_employee.csv")
ultimate_flat_unit <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/ultimate_flat_unit.csv")
ultimate_building <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/ultimate_building.csv")
ultimate_suburb <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/ultimate_suburb.csv")
ultimate_city <- read_csv("/home/momo/GoogleDrive/2021/Semester 1/WST212/Practicals/Practical_4/ultimate_city.csv")


#Question 1
q1<-sqldf("SELECT PD.Product_ID, PD.Product_Name, SUM(OF.Quantity_Ordered) AS Total_Quantity_Ordered
                  FROM orion_product_dim AS PD INNER JOIN orion_order_fact AS OF
                  ON PD.Product_ID=OF.Product_ID
                  GROUP BY PD.Product_ID
                  HAVING (YEAR(OF.Order_Placed) = '2011' OR YEAR(OF.Order_Placed) = '2012') AND PD.Product_Name='A-team Smoothsport Bra'
                  ORDER BY Total_Quantity_Ordered , PD.Product_Name")
head(q1)

#Question 2 
q2<-sqldf("SELECT EA.Employee_Name, EA.City,
                  CASE WHEN OS.Job_Title LIKE '%Sales%' THEN OS.Job_Title END AS Job_Title
                  FROM orion_employee_addresses AS EA INNER JOIN orion_sales AS OS
                  ON EA.Employee_ID=OS.Employee_ID
                  WHERE OS.Gender='F' AND City='Miami-Dade'
                  ORDER BY EA.City, OS.Job_Title, EA.Employee_Name")

#Question 3
q3<-sqldf("SELECT * 
                  FROM orion_product_dim AS PD INNER JOIN orion_order_fact AS OF
                  ON PD.Product_ID=OF.Product_ID
                  WHERE OF.Order_Placed IS NULL")

#Question 4
q4<-sqldf("SELECT OC.Customer_Name, SUM(OF.Quantity_Ordered) AS Foreign_Purchases
                  FROM (orion_product_dim AS PD INNER JOIN orion_order_fact AS OF
                       ON PD.Product_ID=OF.Product_ID) INNER JOIN orion_customer AS OC
                       ON OF.Customer_ID=OC.Customer_ID
                  WHERE ((OC.Customer_Country='US' AND PD.Supplier_Country <> 'US') OR 
                        (OC.Customer_Country='AU' AND PD.Supplier_Country <> 'AU')) AND
                        (OF.Employee_ID=99999999)
                  GROUP BY OC.Customer_Name
                  ORDER BY Foreign_Purchases")

#Question 5
q5 <- sqldf("SELECT Emp_Name, Emp_Email, US.Sub_Name, UC.City_Name
            (FROM ultimate_employee AS UE
            LEFT JOIN ultimate_suburb AS US
            ON a.Sub_ID = b.Sub_ID)
            LEFT JOIN ultimate_city AS UC
            ON UE.City_ID = UC.City_ID
            WHERE Emp_Email like '%ymail%' OR Emp_Email like '%shaimail%'")

#Question 6
q6 <- sqldf("SELECT UF.Flat_Unit_Number, US.Sub_Name, UB.Bld_Name, UC.City_Name
                    FROM ultimate_building AS UB INNER JOIN ultimate_city AS UC
                    ON UB.City_ID = UC.City_ID INNER JOIN ultimate_flat_unit AS UF
                    ON UF.Bld_Id=UB.Bld_ID INNER JOIN ultimate_suburb AS US
                    ON US.Sub_ID=UB.Sub_ID")

