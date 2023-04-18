#--------- DQL : Data Query Language---------
# Select
# From
# Where
# Group by 
# Having
# Order by
# limit

use pga32; # using pga32 default datacase for all queries

## Reading all column and all records ( by default 1000 records are displayed )
select *
from loans;  

# Select only limited mentioned columns

select FICO_avg, Amount_Requested, Interest_Rate, Monthly_Income
from loans;

# Selected columns and 10 records

select FICO_avg, Amount_Requested, Interest_Rate, Monthly_Income
from loans limit 10;    

from loans limit 10;
# limit 10 - 10 records from starting
# limit 10, 5 --> 5 records from 10th records

select *
from loans limit 10, 5;

#----------------Where command--------------

select *
from loans
where Amount_Requested <2000;

#- <less than
#- <= less than equal to
#- > greater than
#- >= greater than equal to
#- = Equal to
#- != not equal to
#- between
# wild card (like)

select *
from loans
where Interest_Rate <=10;


select *
from loans
where Interest_Rate =10;

# and - both condition satisfied - then you will get results
# or - if one or all conditions are satisfied, then you will get results

select *
from loans
where Loan_purpose ="car" and Home_Ownership="Rent";

select *
from loans
where Loan_purpose ="car" or Home_Ownership="Rent";

select Amount_Requested, Interest_Rata, Debt_To_Income_Ratio
from loans
where Amount_Requested between 1000 and 1500;


select Amount_Requested, Interest_Rata, Debt_To_Income_Ratio
from loans
where Amount_Requested between 1000 and 1500;

# - give me the results which are starting with "C"
select *
from loans
where Loan_Purpose like "c%";
#- give me the results which are ending with "D"
select *
from loans
where Loan_Purpose like "c%";

#- give me the results which are have ar" in the text
select *
from loans
where Loan_Purpose like "%ar%"

#- give me the results which starting with "c" butg have next two character
select  *
from loans
where Loan_Purpose like 


#- give me the results which starting with "c" and ends with "d"
select *
from loans
where Loan_Purpose like 

#- give me the results which starting with "c" butg have next two character
select 
from loans
where Loan_Purpose like

#----------------order by -----------------------
select Inquiries_in_the_Last_6_Months, Employment_Length, FICO_avg
from loans
order by



select *
from loans
order by fico_avg desc 
limit 10;




select *
from loans
order by Interest_Rate desc limit 5;

# In Loan purpose car, what is maximum amount requested.

select *
from loans
where loan_purpose ="car"
order by Amount_requested desc limit 1;

# Q. find the person who is living on rent and has the highest montly income

select *
from loans
where Home_ownership ="rent"
order by monthly_income desc limit 1;

#------ Group by and statistical functions ----------------
# Q. How many distinct/unique loan purpose are there in loan date.

select distinct (loan_purpose)
from loans;

select distinct (Interest_Rate)
from loans;

select distinct (Monthly_Income)
from loans;

#Q.- Total amount requested for each loan purpose
select loan_purpose , sum(Amount_requested) as total_amount
from loans
group by loan_purpose;

# Q.- Find the total application for each loan purpose

select loan_purpose , count(*) as application_count
from loans
group by loan_Purpose
order by application_count;


#Q1. Find the count application of Home ownership.
select  , count(*) as Home_ownership
from loans
group by count_application
order by Home_Ownership;

#Q1- find the unique loan length and also total amount requested for each loan length
#=--- Method first----self--
select loan_length , count(*) as total_amount
from loans
group by loan_length
order by total_amount;

#-------Method second----sir---
select loan_length , count(*) as total_amount,sum(Amount_requested) as total_amount
from loans
group by loan_length


# Q which person has highest FICO_avg
select *
from loans
order by FICO_avg desc limit 1;

#Q.3- which state has lowest total amount Requested
select state , sum(Amount_Requested) as total_amount
from loans
group by state
order by total_amount limit 1;

# Q All ISO Standard aggregated function
select * from loans;

select state, count(*) as unique_appl, min(Interest_Rate) as min_IR,
 max(interest_rate) as max_IR,
sum(Amount_Requested) as total_amount, avg(interest_rate) as avg_IR
from loans
group by state;


select loan_purpose, count(*) as unique_appl, min(Interest_Rate) as min_IR,
 max(interest_rate) as max_IR,
sum(Amount_Requested) as total_amount, avg(interest_rate) as avg_IR
from loans
group by loan_purpose;


select loan_purpose, count(*) as unique_appl, sum(Amount_Requested) as total_Amount
from loans
group by loan_purpose
having unique_appl <20;

#---------------------------- columns with special character--------------------

select * from orderdata;

select `order ID` , `Customer Name`
from orderdata;
 

select *
from loans
where amount_requested
order by amount_requested desc limit 1;

# Q1-- Find the segment which pruduce highest profit

select segment,avg(profit) as avg_profit,
avg(sales) as avg_sales, count(`product name`) as total_produce
from orderdata
group by segment;

select segment, sum(profit) as total_profit
from orderdata
group by
order by total_profit desc limit 1;



#Q2- How many Unique Customer are there ?
select count(distinct `Customer Name`) as cnt_names
from orderdata;

#Q3- Which customer is ordering the most
select `Customer name`, count(distinct `order id`) as order_cnt
from orderdata
group by `customer name`
order by order_cnt limit 2;

# Q4- Which product we should remove from our product base
select `product name` , avg(profit) as avg_profit,  avg(sales) as avg_sale 
from pga32.orderdata
group by `product name`
order by avg_sale;

# Q5- Name the subcategory from Home Office where the avg discount is highest
select `Sub-Category` , avg(discount) as avg_discount
from pga32.orderdata
where Segment= "Home Office"
group by `Sub-Category`
order by avg_discount desc limit 1;

# Q6- Find the second city where the avg sale is highest
select city , avg(sales) as average_sales
from pga32.orderdata
group by city
order by average_sales desc limit 1,1;

select city , avg(sales) as average_sales
from pga32.orderdata
group by city
order by average_sales desc limit 0,1;

# Q7- Find name of cities where avg profit is less than 0
select city , avg(sales) as average_profit
from pga32.orderdata
where segment = "city"
group by city
order by average_product desc limit <=0;


# Q8- Create a new variable named total_sale by multiplying Quantity and Sales
drop table if exists pga32.My_new_orderdata;

create table pga32.my_new_orderdata as
select *, Quantity*Sales as total_sale, Quantity*2 as new_col
from pga32.orderdata;

select * from pga32.orderdata;
# Q 9- Find the Segment and Region where the avg profit is max but the avg sale is low
select segment, Region, avg(profit) as avg_profit, avg(sales) as avg_sale
group by segment, Region
order by avg_profit desc, avg_sale limit 1;


# Q 10- How many sub category is each products and which Product has the Highest Category 
select `product name` , count(distinct `sub-category`) as cnt_sub
from pga32.orderdata
group by `product name`
order by cnt_sub desc ;












