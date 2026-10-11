create database churncus;
create table churncus.customerss(
customer_name varchar(50),
age int,
customer_satisfaction int,
customer_segment varchar(50));

drop database churncus;

alter table churncus.customerss add column country varchar(50);
alter table churncus.customerss change age city varchar(50);
alter table churncus.customerss change city age int;

insert into churncus.customerss
(customer_name,age,customer_satisfaction,customer_segment) value
("senthil",20,"3.46","basic"),
("barath",22,"4.26","premium");


select * from churncus.customerss;

truncate table churncus.customerss;
set sql_safe_updatas=0;

update churncus.customerss
set customer_name = "deinsh"
where age = 23;

select * from churncus.customerss;

-- link*-pattern matching filter
-- in - muptiple value filter
-- between - range filter 
-- is null - missing value filter


use churncus;

create database customer;
use customer;

select * from customer.customer
where Customer_Segment like 'Basic';

select * from customer.customer
where customer_segment like 'basic' and subscription_plan like 'plus';

select * from customer.customer
where customer_segment in ('Basic','permium');

select * from customer.customer
where tenure_months in (6,5,28,22);

select * from customer.customer
where tenure_months in (6,22) and customer_segment in ('basic','permium');

select * from customer.customer
where tenure_months between 22 and 28;

select * from customer.customer
where tenure_months is null;

select * from customer.customer
where tenure_months > 22;

create database dummy;
use dummy;

CREATE DATABASE customer_db;
USE customer_db;

CREATE TABLE customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,Age INT,Gender VARCHAR(20),Region VARCHAR(30),City_Tier VARCHAR(20),Customer_Segment VARCHAR(30),
    Tenure_Months INT,Contract_Type VARCHAR(30),Subscription_Plan VARCHAR(30),Monthly_Charges DECIMAL(10,2),Total_Charges DECIMAL(10,2),
    Payment_Method VARCHAR(30),Auto_Payment VARCHAR(10),Paperless_Billing VARCHAR(10),Internet_Service VARCHAR(30),Phone_Service VARCHAR(10),
    Streaming_Service VARCHAR(10),Online_Security VARCHAR(10),Tech_Support VARCHAR(10),Device_Protection VARCHAR(10),Avg_Monthly_Usage_GB DECIMAL(10,2),
    Num_Logins_Last_Month INT,Support_Tickets_Last_6_Months INT,Late_Payments_Last_Year INT,Customer_Satisfaction DECIMAL(5,2),NPS_Score INT,
    Discount_Received VARCHAR(10),Discount_Percent INT,Complaints_Last_Year INT,Last_Interaction_Days INT,Marketing_Emails_Opened INT,
    Cross_Sell_Products INT,Customer_Lifetime_Value DECIMAL(12,2),Churn_Risk_Score DECIMAL(10,2),Churn_Reason VARCHAR(50),Churn VARCHAR(10)
);

INSERT INTO customers (
    Customer_ID, Age, Gender, Region, City_Tier,Customer_Segment, Tenure_Months, Contract_Type,Subscription_Plan,
    Monthly_Charges, Total_Charges,Payment_Method, Auto_Payment, Paperless_Billing,Internet_Service, Phone_Service, Streaming_Service,
    Online_Security, Tech_Support, Device_Protection,Avg_Monthly_Usage_GB, Num_Logins_Last_Month,
    Support_Tickets_Last_6_Months, Late_Payments_Last_Year,Customer_Satisfaction, NPS_Score, Discount_Received,
    Discount_Percent, Complaints_Last_Year,Last_Interaction_Days, Marketing_Emails_Opened,Cross_Sell_Products, Customer_Lifetime_Value,
    Churn_Risk_Score, Churn_Reason, Churn
)
VALUES
(
    'CUST000001', 59, 'Male', 'West', 'Tier 2',
    'Basic', 6, 'Month-to-Month', 'Plus',
    51.98, 308.57, 'Bank Transfer', 'Yes', 'No',
    'DSL', 'Yes', 'Yes', 'No', 'No', 'Yes',
    61.48, 18, 2, 0, 4.00, 36, 'No',
    0, 0, 28, 4, 0, 600.42, 56.04,
    'Not Churned', 'No'
),
(
    'CUST000002', 26, 'Male', 'South', 'Tier 1',
    'Basic', 28, 'Month-to-Month', 'Plus',
    46.27, 1230.96, 'Credit Card', 'Yes', 'Yes',
    'Fiber', 'Yes', 'Yes', 'Yes', 'No', 'Yes',
    3.63, 22, 1, 0, 3.46, 39, 'Yes',
    30, 1, 34, 5, 0, 1380.32, 35.00,
    'Not Churned', 'No'
),
(
    'CUST000003', 43, 'Female', 'Central', 'Tier 2',
    'Premium', 22, 'One Year', 'Starter',
    58.44, 1331.25, 'Bank Transfer', 'Yes', 'Yes',
    'Fiber', 'Yes', 'No', 'Yes', 'Yes', 'Yes',
    153.38, 19, 1, 2, 4.28, 32, 'Yes',
    30, 0, 11, 6, 1, 1658.17, 0.00,
    'Not Churned', 'No'
),
(
    'CUST000004', 46, 'Female', 'West', 'Tier 1',
    'Premium', 8, 'Month-to-Month', 'Plus',
    80.00, 618.93, 'Debit Card', 'No', 'Yes',
    'Fiber', 'Yes', 'No', 'Yes', 'No', 'No',
    169.90, 18, 4, 2, 2.39, 20, 'No',
    0, 3, 20, 3, 2, 817.77, 98.16,
    'Price', 'Yes'
),
(
    'CUST000005', 45, 'Other', 'North', 'Tier 2',
    'Basic', 22, 'Month-to-Month', 'Starter',
    20.51, 435.21, 'Bank Transfer', 'No', 'Yes',
    NULL, 'Yes', 'No', 'Yes', 'Yes', 'No',
    0.00, 15, 0, 1, 4.50, 33, 'No',
    0, 1, 5, 3, 0, 375.55, 35.15,
    'Not Churned', 'No'
);

SELECT COUNT(*) AS Total_Customers
FROM customers;

SELECT SUM(Monthly_Charges) AS Total_Monthly_Charges
FROM customers;

SELECT AVG(Monthly_Charges) AS Average_Monthly_Charges
FROM customers;

SELECT MIN(Monthly_Charges) AS Minimum_Monthly_Charge
FROM customers;

SELECT MAX(Monthly_Charges) AS Maximum_Monthly_Charge
FROM customers;

SELECT Region,COUNT(*) AS Customer_Count
FROM customers GROUP BY Region;

SELECT Region,SUM(Total_Charges) AS Total_Revenue
FROM customers GROUP BY Region;

SELECT Subscription_Plan,
AVG(Monthly_Charges) AS Average_Charges
FROM customers GROUP BY Subscription_Plan;

SELECT Churn,COUNT(*) AS Customer_Count,
AVG(Monthly_Charges) AS Average_Monthly_Charges,
SUM(Total_Charges) AS Total_Charges
FROM customers GROUP BY Churn;

SELECT Region,COUNT(*) AS Customer_Count
FROM customers GROUP BY Region HAVING COUNT(*) > 4;
 
create database customer_churn_db;
USE customer_churn_db;
create table customer_churn (
customer_id VARCHAR(20),age INT,gender VARCHAR(20),region VARCHAR(50),
city_tier VARCHAR(20),customer_segment VARCHAR(50),tenure_months INT,
contract_type VARCHAR(50),subscription_plan VARCHAR(50),monthly_charges DECIMAL(10,2),
total_charges DECIMAL(10,2),payment_method VARCHAR(50),auto_payment VARCHAR(10),
customer_satisfaction INT,nps_score INT,customer_lifetime_value DECIMAL(12,2),
churn_risk_score DECIMAL(10,2),churn VARCHAR(10)
);
INSERT INTO customer_churn (
    customer_id, age, gender, region, city_tier,
    customer_segment, tenure_months, contract_type,
    subscription_plan, monthly_charges, total_charges,
    payment_method, auto_payment, customer_satisfaction,
    nps_score, customer_lifetime_value, churn_risk_score, churn
)
VALUES
('CUST000001', 59, 'Male', 'South', 'Tier 2',
 'Regular', 24, 'Month-to-Month', 'Basic',
 55.50, 1332.00, 'Credit Card', 'Yes', 4,
 45, 1800.00, 56.04, 'No'),

('CUST000002', 26, 'Male', 'North', 'Tier 1',
 'Premium', 36, 'One Year', 'Premium',
 75.00, 2700.00, 'Bank Transfer', 'Yes', 5,
 70, 3200.00, 35.00, 'No'),

('CUST000003', 43, 'Female', 'West', 'Tier 2',
 'Regular', 18, 'Month-to-Month', 'Standard',
 60.00, 1080.00, 'UPI', 'No', 3,
 20, 1500.00, 0.00, 'No'),

('CUST000004', 46, 'Female', 'South', 'Tier 1',
 'Premium', 12, 'Month-to-Month', 'Premium',
 90.00, 1080.00, 'Credit Card', 'No', 2,
 -30, 1250.00, 98.16, 'Yes'),

('CUST000005', 45, 'Other', 'East', 'Tier 3',
 'Regular', 30, 'Two Year', 'Standard',
 65.00, 1950.00, 'UPI', 'Yes', 4,
 50, 2500.00, 35.15, 'No');

SELECT customer_id,churn_risk_score,
ROW_NUMBER() OVER (ORDER BY churn_risk_score DESC) AS risk_rank
FROM customer_churn;
 
 SELECT customer_id,churn_risk_score,
RANK() OVER (ORDER BY churn_risk_score DESC) AS risk_rank
FROM customer_churn;

SELECT customer_id,churn_risk_score,DENSE_RANK() OVER (
ORDER BY churn_risk_score DESC) AS dense_risk_rank
FROM customer_churn;

SELECT customer_id,region,churn_risk_score,
RANK() OVER (PARTITION BY region ORDER BY churn_risk_score DESC) AS region_rank
FROM customer_churn;

SELECT customer_id,customer_lifetime_value,
SUM(customer_lifetime_value) OVER (ORDER BY customer_id) AS running_total_clv
FROM customer_churn;

SELECT customer_id,region,customer_lifetime_value,
AVG(customer_lifetime_value) OVER (PARTITION BY region) AS region_avg_clv
FROM customer_churn;

SELECT customer_id,churn_risk_score,
LAG(churn_risk_score) OVER (ORDER BY customer_id) AS previous_risk_score
FROM customer_churn;

SELECT customer_id,churn_risk_score,
LEAD(churn_risk_score) OVER (ORDER BY customer_id) AS next_risk_score
FROM customer_churn;

CREATE DATABASE customer_db;

USE customer_db;
CREATE TABLE customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,Age INT,Gender VARCHAR(20),Region VARCHAR(50),City_Tier VARCHAR(20),
    Customer_Segment VARCHAR(50),Tenure_Months INT,Contract_Type VARCHAR(50),Subscription_Plan VARCHAR(50),Monthly_Charges DECIMAL(10,2),
    Total_Charges DECIMAL(10,2),Payment_Method VARCHAR(50),Auto_Payment VARCHAR(10),Paperless_Billing VARCHAR(10),
    Internet_Service VARCHAR(50),Phone_Service VARCHAR(10),Streaming_Service VARCHAR(10),Online_Security VARCHAR(10),
    Tech_Support VARCHAR(10),Device_Protection VARCHAR(10),Avg_Monthly_Usage_GB DECIMAL(10,2),Num_Logins_Last_Month INT,    
    Support_Tickets_Last_6_Months INT,Late_Payments_Last_Year INT,Customer_Satisfaction INT,NPS_Score INT,
    Discount_Received VARCHAR(10),Discount_Percent DECIMAL(5,2),Complaints_Last_Year INT,Last_Interaction_Days INT,
    Marketing_Emails_Opened INT,Cross_Sell_Products INT,Customer_Lifetime_Value DECIMAL(12,2),Churn_Risk_Score DECIMAL(10,2),
    Churn_Reason VARCHAR(100),Churn VARCHAR(10)
);

CREATE TABLE customers_services (
    Service_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID VARCHAR(20),
    Internet_Service VARCHAR(50),
    Phone_Service VARCHAR(10),
    Streaming_Service VARCHAR(10),
    Online_Security VARCHAR(10),
    Tech_Support VARCHAR(10),
    Device_Protection VARCHAR(10),

    FOREIGN KEY (Customer_ID)
    REFERENCES customers(Customer_ID)
);

SELECT c.Customer_ID,c.Age,c.Gender,
c.Region,s.Internet_Service,s.Phone_Service,s.Streaming_Service
FROM customers c INNER JOIN customers_services s
ON c.Customer_ID = s.Customer_ID;

SELECT c.Customer_ID,c.Age,c.Region,s.Internet_Service,s.Streaming_Service
FROM customers c LEFT JOIN customers_services s
ON c.Customer_ID = s.Customer_ID;

SELECT c.Customer_ID,c.Age,c.Region,s.Internet_Service,s.Tech_Support
FROM customers c RIGHT JOIN customers_services s
ON c.Customer_ID = s.Customer_ID;

SELECT c.Customer_ID,c.Age,c.Region,s.Internet_Service
FROM customers c
LEFT JOIN customers_services s
ON c.Customer_ID = s.Customer_ID

UNION

SELECT c.Customer_ID,c.Age,c.Region,s.Internet_Service
FROM customers c RIGHT JOIN customers_services s
ON c.Customer_ID = s.Customer_ID;

SELECT c.Customer_ID,c.Age,c.Region,c.Subscription_Plan,
c.Monthly_Charges,c.Churn,c.Churn_Reason,s.Internet_Service,s.Tech_Support
FROM customers c INNER JOIN customers_services s
ON c.Customer_ID = s.Customer_ID WHERE c.Churn = 'Yes';

SELECT c.Region,COUNT(c.Customer_ID) AS Churned_Customers
FROM customers c
INNER JOIN customers_services s
ON c.Customer_ID = s.Customer_ID
WHERE c.Churn = 'Yes'
GROUP BY c.Region
ORDER BY Churned_Customers DESC;