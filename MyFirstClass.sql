# Rules 
# mySQL is case insensitive Language 
# Name in mysql should contain only english letters, numbers and underscore(_)
# Name in mysql can not have any special characters ( space,%, ^, . , $, #, @ etc)
# Names should not start with number or underscore(_)
# Each query should be ended by semi colon (;)

# Create database 
create database pga32;

# create table 

create table pga32.employee (
Emp_Id int not null ,
F_name varchar(20),
Lname varchar(20),
Age  int,
Gender varchar(7)
);

select * from pga32.employee;

# Entering the records 

insert  into pga32.employee (emp_id, f_name,lname, age, gender ) 
values 
(101, "Harry", "Potter", 24, "Male"),
(102, "Dawn","Cassada", 35, "Female")
;


insert  into pga32.employee (emp_id, f_name,lname, age, gender ) 
values 
( , "John", "Abrahm", 34, "Male")
;

select * from pga32.employee; 

# Data Type in My SQL :--
# Number  -  Bit (n) [1, 64][1] , boolean , TinyInt(n) [-128, 127],smallint(n) [ -32768, 32767]
#             mediumint(n) [-8388608, 8388607], int(n) [-2147483648, 2147483647],
# bigint(n) [-9223372036854775808, 9223372036854775807] 
# float(p), double , decimal 

# string - char(n) [ 0, 255] (numbers, letters, special characters),
# varchar(n) [0,65535] (numbers, letters, special characters),
  
# Date  - Date YYYY-MM-DD ( 9999-12-31) , Datetime YYYY-MM-DD hh:mm:ss , Year 

# Constraints or Rules 
# 1. Not null :- It enusres that column does not have NULL values 
# 2. unique :- It ensures that column does not have any duplicated records 
# 3. Primary key - [ unique and not null] - 
# 4. Foreign key :- Prevents actions that would destroy the link between tables
#5. Deafult :- Sets a default value for a column if no value is specified 

create table pga32.abc3 (
Cust_Id int primary key,
Fname varchar(15), 
Lname varchar(15),
age int
);

insert into pga32.abc3 (Cust_id, Fname, Lname, age)
values
(101, "Harry", "Potter", 23),
(102, "John", "painter", 34 ),
(103, "Merry", "Stacy", 34);


insert into pga32.abc3 (Cust_id, fname, Lname, age)
values
(104, 45, "Potter", 23),
(105, "Gwen", "painter", 34),
(107, "Merry", "Stacy", 34);

insert into pga32.abc3 (Cust_id, fname, Lname, age)
values
(108, 45, "Potter", 34.67),
(109, "Thanos", "Titan", 34),
(110, "Spider", "Man", 34);

use pga32;
select * from pga32.abc3;
show tables pga32;

select * from pga32.loans;

select * from loans limit 10,150;

# It will make pga32 default database - after this no need to write database name
use pga32;

select * from pga32.loans;

# shows the names of the tables
show tables ; 

describe abc3;

#----------- Altering the table-----------------
# Adding new columns
# Deleting of columns
# Data Type change or length change of columns
# Delete records 
# etc......

#-- Alter table abc3
# --add column_name data type constraints First|after Old_column; 

alter table abc3
add Gender varchar(7) not null;
select * from abc3;

alter table abc3
add Location varchar(20) after lname;
select * from abc3;

alter table abc3
add Place varchar(20) after lname;
select * from abc3;

alter table abc3
modify Place varchar(9);
select * from abc3;

describe abc3;


alter table abc3
rename column Place to State;
select * from abc3;

describe abc3;

alter table abc3
Drop column Gender ;
select * from abc3;
describe abc3;

delete from pga32.abc3
where age <=23;
set sql_safe_updates=0;


delete from pga32.abc1
where lname ="Stacy";

update pga32.abc3
set State="Bihar"
where lname="Titan";

update pga32.abc3
set State="Haryana"
where lname="Man";

select * from abc3;
describe abc3;


update pga32.abc1
set State="Delhi"
where lname+"painter";

update pga32.abc1
set State="UP"
where lname+"potter";

update pga32.abc1
set State="Haryana"
where lname+"Man";

select * from pga32.employee;
describe abc1;

truncate pga32.employee;
drop table pga32.employee;
truncate pga32.abs99;
drop table pga32.abs99;

select * from pga32.employee
















###---------------------------- Joins-------

create to 
# Full join--
# step 1 - create left join table
# step 2 - create right join table
# step 3 - Union the tables which generated from step1 and step2








 

