SELECT 1 AS NO;

create schema test;

create database amazon;

use amazon;

select database();

show tables;

create table customer_tb(
cust_id int
,cust_name char(20)
,custphno int
,custage int
,custloc char(15)
);

create table product
(
prod_name char(20),
prod_id int);

create table transactions (
cust_id int,
product_name char(20),
order_date date);


select * from customer;
select * from customer_tb;

insert into customer_tb values (1, "MS", 707, 27, "CHN" );

CREATE TABLE CUSTOMER_INFO(
ID INT,
FIRST_NAME VARCHAR(28),
LAST_NAME VARCHAR(20),
AGE INT,
ADDRESS VARCHAR(100),
LOCATION VARCHAR(10),
PH_NO BIGINT
);

INSERT INTO CUSTOMER_INFO VALUES ( 1, "MADHU", "KANAKAM", 27, "RAILPET GUNTUR", "INDIA" ,7075757415); # NO ERRORS
INSERT INTO CUSTOMER_INFO VALUES ( 1, "VIJAY", "KANAKAM", -27, "RAILPET GUNTUR", "INDIA" ,707576); # 4 ERRORS
INSERT INTO CUSTOMER_INFO VALUES ( 1, "", "3", 29, "#BANGALORE", "INDIA" ,707575); # 4 ERRORS

SELECT * FROM CUSTOMER_INFO;

DROP TABLE CUSTOMER_INFO;

CREATE TABLE PHONE_NUMBERS (
NAME CHAR(30),
PHONE_NO BIGINT
);

INSERT INTO PHONE_NUMBERS VALUES ("MADHU", 9581242878);
INSERT INTO PHONE_NUMBERS VALUES ("SUDHAN", 7075757415);
INSERT INTO PHONE_NUMBERS VALUES ("VIJAY", 9160484545);

SELECT * FROM PHONE_NUMBERS;

-- #INTEGER---
CREATE TABLE CUSTOMER_IFO(
ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(28) NOT NULL,
LAST_NAME VARCHAR(20) NOT NULL,
AGE tinyint CHECK (AGE >=18),
ADDRESS VARCHAR(100) UNIQUE,
LOCATION VARCHAR(10) DEFAULT 'INDIA',
PH_NO BIGINT CHECK(length(PH_NO)=10)
);


INSERT INTO CUSTOMER_IFO VALUES ( 1, "MADHU", "KANAKAM", 27, "CHENNAI", "INDIA" ,7075757415); # NO ERRORS
INSERT INTO CUSTOMER_IFO VALUES ( 1.5, "", "KANAKAM", 27, "HYDERABAD", "INDIA" ,707576); # 2 ERRORS
INSERT INTO CUSTOMER_IFO VALUES ( 2, "K", "", 29, "#BANGALORE", "INDIA" ,707575); # 4 ERRORS
INSERT INTO CUSTOMER_IFO VALUES ( 3, "M", "3", 29, "#BANGALORE", "INDIA" ,707575); # 4 ERRORS
INSERT INTO CUSTOMER_IFO VALUES ( 4, "S", "3", 29, "#BANGALORE", "INDIA" ,707575); # 4 ERRORS

SELECT * FROM CUSTOMER_IFO;
DROP TABLE CUSTOMER_IFO;



# 09/03/2026 -----
select * from car_data_Tb; #ALL THE COLUMNS
select * from car_data_Tb where year = '2014';
select * from car_data_Tb where year = '2015';
SELECT CAR_NAME, SELLING_PRICE, KMS_DRIVEN, FUEL_TYPE, TRANSMISSION FROM car_data_Tb;  #SELECTED COLUMNS

SELECT CAR_NAME, SELLING_PRICE, KMS_DRIVEN, FUEL_TYPE FROM car_data_Tb where year = '2014';  #SELECTED COLUMNS IN YEAR 2014

select * from car_data_Tb where year = '2014' AND 
FUEL_TYPE = "PETROL" AND 
TRANSMISSION = 'Automatic' AND
KMS_DRIVEN < 20000 ; # ONLY THE PETROL CARS AND AUTOMATIC AND KMS < 20000

select * from car_data_Tb where year = '2015' AND 
FUEL_TYPE = "PETROL" AND 
TRANSMISSION = 'Automatic' AND
KMS_DRIVEN < 20000 ;


select * from car_data_Tb where year = 2014 OR year = 2015 ;
select * from car_data_Tb where year in (2014 , 2015 , 2016); # TO SELECT 3 YEARS DATA 

#2014 ,2017 petrol cars 
select * from car_data_Tb where year in (2014 , 2015 ) and  FUEL_TYPE = "PETROL" ;

select * from car_data_Tb order by selling_price asc;
select * from car_data_Tb order by selling_price desc;

# Always start with basic query
	
# all the cars from 2010 - 2018
select * from car_data_Tb where year in (2010,2011,2012,2013,2014,2015,2016,2017,2018 ); # lot of hard coding
select * from car_data_Tb where year  > 2009 and year < 2019;  # increase and decrease the number in where clause
select * from car_data_Tb where year  >= 2010 and year <= 2018; # good way
select * from car_data_Tb where year between 2010 and 2018; #simplier and easier
select * from car_data_Tb where fuel_type > petrol; # not allowed only allowed for numeric
# applicable only for numbers 

# Distinct 
select distinct fuel_type from car_data_Tb; # to get the values of all unique 
select * from car_data_Tb where fuel_type in ('diesel','cng');

# Aggregate functions

select * from car_data_Tb;

# What cars are available in 2014 
# How many cars are there in 2014
#
select * from car_data_Tb where year = '2014';
select count(*) from car_data_Tb where year = '2014';
select count(*) from car_data_Tb where year = '2015';

show tables;
show schemas;


select count(*) from car_data_Tb where year = 2014;

select count(*) from car_data_Tb where year = 2015;

select count(*) from car_data_Tb;

select count(*) from car_data_Tb where kms_driven < 10000;

select distinct year from car_data_Tb order by year;

select min(year) from car_data_Tb ;
select max(year) from car_data_Tb ;

select kms_driven from car_data_Tb  order by kms_driven;

# to find min and max 
select min(kms_driven) from car_data_Tb ;
select max(kms_driven) from car_data_Tb ;

select count(distinct fuel_type) from car_data_Tb;  # 3 records
select count( fuel_type) from car_data_Tb;          # ---301 count

# group by -----Very Important 

select count(*) from car_data_Tb where year = 2014;  #38
select count(*) from car_data_Tb where year = 2015;  #61
select count(*) from car_data_Tb where year = 2016;  #50
select count(*) from car_data_Tb where year = 2017;  #35
select count(*) from car_data_Tb where year = 2018;  #01

select year,count(*)  from car_data_Tb group by year ; # to get groups of the cars in year 

select count(*) from car_data_Tb where fuel_type = 'CNG'; #2
select count(*) from car_data_Tb where fuel_type = 'petrol'; #239
select count(*) from car_data_Tb where fuel_type = 'diesel'; #60

select count(*) from car_data_Tb where fuel_type = 'petrol' and transmission = 'automatic' ; 	#28
select count(*) from car_data_Tb where fuel_type = 'petrol' and transmission = 'Manual' ; 		#211
select count(*) from car_data_Tb where fuel_type = 'diesel' and transmission = 'manual' ; 		#48
select count(*) from car_data_Tb where fuel_type = 'diesel' and transmission = 'automatic' ; 	#12
select count(*) from car_data_Tb where fuel_type = 'cng' and transmission = 'manual' ; 			#2

# what ever columns are there in before count then they need to be add in group by 
select fuel_type,transmission,count(*) from car_data_Tb group by fuel_type ,transmission;

select fuel_type,transmission,count(*) from car_data_Tb group by fuel_type,transmission order by fuel_type,transmission;

select * from car_data_Tb ;

# Total cars by every year
select year,count(*) from car_data_Tb  group by year;

# Total petrol cars by every year
select 
	year,
	count(*) 
from car_data_Tb
where fuel_type = 'petrol'  
group by year 
 order by year;


# give only which year have more than 30 cars 
select year,count(*) from car_data_Tb
where count(*) > 30     #this wont work becoz where clause works only on existing column
group by year;

select year,count(*) from car_data_Tb
group by year
having count(*) > 30;

# i want only petrol cars for the years provided we have more than 25 also sort it from highest to lowest
select * from car_data_Tb;

select year,count(*) from car_data_Tb 
where fuel_type = 'petrol' 
group by year 
having count(*) > 25
order by count(*); 

select year as Model_year
,count(*) as Total_cars
from car_data_Tb
group by year
having count(*) > 30;

