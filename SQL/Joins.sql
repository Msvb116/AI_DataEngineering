SELECT * FROM amazon.ele_store1;

#country | total_sales made | total profits  | Avg_sales | Avgprofit | Total orders

use amazon;
select 
		country,
		sum(sales) as total_sales,
		sum(profit) as total_profits,
		AVG(sales) as Avg_sales,
		AVG(profit) as Avg_profit,
		count(orderid) as Total_orders
from ele_store1
group by country;

# i want channel by  total_sales ,total_profit for china and united kingdom country 
#order it highest to lowest profit

select channel,	
		sum(sales) as Total_sales,
        sum(profit) as Total_profit
from ele_store1 
where country in ('china' , 'united kingdom') 
group by channel 
order by Total_profit desc;

select * from customer_TB1;

create table customer_TB1 (
id int,
name varchar(20),
age tinyint,
address varchar(50),
wallet_bal float
);
INSERT INTO customer_TB1 VALUES ( 1, "MADHU",  27, "CHENNAI", 200); 
INSERT INTO customer_TB1 VALUES ( 2, "ram", 29, "HYDERABAD",7500); 
INSERT INTO customer_TB1 VALUES ( 3, "chakri",  29, "#BANGALORE", 285); 
INSERT INTO customer_TB1 VALUES ( 4, "sudhan", 29, "#BANGALORE", 958); 
INSERT INTO customer_TB1 VALUES ( 5, "bhaskar",  29, "#BANGALORE", 358); 
INSERT INTO customer_TB1 VALUES ( 6, "vijay",  29, "#BANGALORE", 958); 
INSERT INTO customer_TB1 VALUES ( 7, "Santosh",  29, "#BANGALORE", 3478); 

DROP TABLE order_tb;
create table order_tb
(
oid int,
date date,
c_id varchar(3),
amount float );

insert into order_tb values ( 102,"2003-05-25",'3',3000);
insert into order_tb values ( 100,"2003-07-05",'3',6000);
insert into order_tb values ( 103,"2003-06-15",'2',70000);
insert into order_tb values ( 106,"2006-05-25",'4',2580);
insert into order_tb values ( 199,"2004-05-25",'',9000);

select * from customer_TB1;
select * from order_tb;

select name from customer_TB1 where id in (2,3,4);

select name from customer_TB1 where id NOT in (2,3,4);

# Sub query --query inside a query
select distinct c_id from order_tb;
select name from customer_TB1 where id in (select distinct c_id from order_tb);
select name from customer_TB1 where id not in (select distinct c_id from order_tb);

select name from customer_TB1 where id  in (select old, c_id from order_tb);

# Joins concept on 16 March

use amazon;

SELECT DATABASE();

SELECT * FROM car_data_Tb;  						#WORKING
SELECT * FROM AMAZON.car_data_Tb;   				# WORKING
SELECT CAR_NAME,KMS_DRIVEN,FUEL_TYPE FROM car_data_Tb; 									   #WORKING -- selected  columns
SELECT car_data_Tb.CAR_NAME,car_data_Tb.KMS_DRIVEN,car_data_Tb.FUEL_TYPE FROM car_data_Tb; #WORKING --table_name.column name
SELECT car_data_Tb.CAR_NAME,car_data_Tb.KMS_DRIVEN,car_data_Tb.FUEL_TYPE FROM AMAZON.car_data_Tb; #WORKING --table_name.column name dbname.tablename
SELECT A.CAR_NAME,A.KMS_DRIVEN,A.FUEL_TYPE FROM car_data_Tb A; 							   #WORKING   ######### PREFER ONLY THIS ###########

#TO WRITE JOIN
select * from customer_TB1;
select * from order_tb;

# Inner Join
SELECT a.name ,a.address,b.oid,b.date 
from customer_TB1 a
inner join order_tb b
on a.id = b.c_id;

SELECT customer_TB1.name ,customer_TB1.address,order_tb.oid,order_tb.date 
from customer_TB1 
inner join order_tb 
on customer_TB1.id = order_tb.c_id;

#With out alias names 
SELECT name ,address,oid,date 
from customer_TB1 
inner join order_tb 
on id = c_id;

# if the two tables had same column names then it wont work and throws error as ambigious

# Left Join 
select a.name ,a.address,b.oid,b.date 
from customer_TB1 a
left join order_tb b
on a.id = b.c_id;

select count(distinct a.id) as Total_Cust_Count
from customer_TB1 a
left join order_tb b
on a.id = b.c_id;

#customers who didnt buy 
select a.name ,a.address,b.oid,b.date 
from customer_TB1 a
left join order_tb b
on a.id = b.c_id
where oid is null;

#customers who didnt buy 
select count(a.name) 
from customer_TB1 a
left join order_tb b
on a.id = b.c_id
where oid is null;


#customers who  buy 
select count(distinct a.name) 
from customer_TB1 a
left join order_tb b
on a.id = b.c_id
where oid is not null;

# left anti join 
select a.name ,a.address,b.oid,b.date 
from customer_TB1 a
left join order_tb b
on a.id = b.c_id;
#where a.id is not null;

# Right Join 
select a.name ,a.address,b.oid,b.date 
from customer_TB1 a
Right join order_tb b
on a.id = b.c_id;

select a.name ,a.address,b.oid,b.date 
from customer_TB1 a
Right join order_tb b
on a.id = b.c_id
where a.name is null;

# Full Join 
select a.name ,a.address,b.oid,b.date 
from customer_TB1 a
join order_tb b
on a.id = b.c_id;

use amazon;

select * from training_tb;
select * from emp1_tb;

select * from emp1_tb;

select count(*) from emp1_tb; #50
select count(*) from emp1_tb where gender = 'M'; # 37
select count(*) from emp1_tb where gender = 'F'; # 13
select count(*),gender from emp1_tb group by gender;

select count(*),gender,maritalstatus from emp1_tb group by gender,maritalstatus;

# want to see dept wise male employees
select dept,count(*) from emp1_tb where gender = 'M' group by dept;

#  want emp count by jobgrade ,dont give me all give only if jobgrade of emp count is > 10
select jobgrade , count(*) from emp1_tb  group by jobgrade having count(*) > 10;

# which emp had spent max on training?
select * from training_tb;
select * from emp1_tb;

select employee_id , sum(cost) from training_tb group by employee_id
order by sum(cost) desc;

# joins use case
select a.title , b.cost
from emp1_tb a  inner join training_tb b 
on a.employeeid = b.employee_id;

select a.title , sum(b.cost)
from emp1_tb a  inner join training_tb b 
on a.employeeid = b.employee_id
group by a.title;

#While writing table use limit by 
select * from ele_store1 limit 5;

# top 5 male emp who spent more (provided they have spent more than 20 k)
select * from emp1_tb;
select a.title  emp_name ,sum(b.cost) tot_spent from  emp1_tb a inner join training_tb b 
on a.employeeid = b.employee_id 
where a.gender = 'M' 
group by a.title
order by sum(b.cost) DESC
limit 5;

select a.title  emp_name ,sum(b.cost) tot_spent from  emp1_tb a inner join training_tb b 
on a.employeeid = b.employee_id 
where a.gender = 'M' 
group by a.title
having sum(b.cost) > 20000
order by sum(b.cost) DESC;

select * from training_tb;
select * from emp1_tb;

insert into training_tb values ('18-03-2026', 1, 'communication Workshop', null , 9500 , 'KSR Data Vision');
insert into training_tb values ('19-03-2026', 1, 'DE Workshop', null , 8500 , 'KSR Data Vision');

select count( distinct employeeid) from emp1_tb;
select count(*) from training_tb; # 419
select count(distinct employee_id) from training_tb; # 47

# subquery
select title from emp1_tb where employeeid in (select distinct employee_id from training_tb);
select title from emp1_tb where employeeid not in (select distinct employee_id from training_tb);

select * from emp1_tb;
select a.employeeid , a.title , b.coursecode , b.cost
from emp1_tb a inner join training_tb b 
on a.employeeid = b.employee_id ;

select count(distinct a.employeeid)
from emp1_tb a inner join training_tb b 
on a.employeeid = b.employee_id ;

# which table had all details take as left table 
select * from emp1_tb;
select a.employeeid , a.title , b.coursecode , b.cost
from emp1_tb a left join training_tb b 
on a.employeeid = b.employee_id 
where b.coursecode is null;

select a.employeeid , a.title , b.coursecode , b.cost
from emp1_tb a right join training_tb b 
on a.employeeid = b.employee_id 
where a.employeeid is null;

# joins 
select a.name ,a.address,b.oid,b.date  from customer_TB1 a inner join order_tb b
on a.id = b.c_id;

select a.name ,a.address,b.oid,b.date  from customer_TB1 a left join order_tb b 
on a.id = b.c_id;

select a.name ,a.address,b.oid,b.date  from customer_TB1 a right join order_tb b 
on a.id = b.c_id;

#select a.name ,a.address,b.oid,b.date  from customer_TB1 a full join order_tb b  on a.id = b.c_id;

# union and union all topic 
create table quater1_tb (
month varchar(15),
sales int
);
drop table quater2_tb;
create table quater2_tb (
sales int,
month varchar(15)
);

insert into quater1_tb values( 'Jan' , 100);
insert into quater1_tb values( 'Feb' , 200);
insert into quater1_tb values( 'Mar' , 360);

insert into quater2_tb values(  600,'Apr');
insert into quater2_tb values(  800,'May' );
insert into quater2_tb values(  460, 'JUn' );
insert into quater2_tb values(  460, 'Mar' );

select month,sales from quater1_tb
union 									# excluding duplicates 
select month,sales from quater2_tb;

select month,sales from quater1_tb
union all                            # including duplicates 
select month,sales from quater2_tb;

select * from quater1_tb
union 									# It will be messed up take care of columns  
select * from quater2_tb;

# inner join we can achive like this 
select a.name ,a.address,b.oid,b.date  from customer_TB1 a left join order_tb b 
on a.id = b.c_id
union
select a.name ,a.address,b.oid,b.date  from customer_TB1 a right join order_tb b 
on a.id = b.c_id;

select a.name ,a.address,b.oid,b.date  from customer_TB1 a inner join order_tb b
on a.id = b.c_id;

# Join without on condition is called as cross Join 
select a.name ,a.address,b.oid,b.date  from customer_TB1 a inner join order_tb b;

use amazon;

create table emp_mgr
(
empid int,
empname varchar(20),
mgr_id int
 );

insert into emp_mgr values ( 1,"sunil",5);
insert into emp_mgr values ( 2,"Steeve",5);
insert into emp_mgr values ( 3,"Satish",5);
insert into emp_mgr values ( 4,"Rajesh",5);
insert into emp_mgr values ( 5,"Santosh",6);
insert into emp_mgr values ( 6,"Mahesh",7);
insert into emp_mgr values ( 7,"Koti",Null);

select * from emp_mgr;
select a.empname as Employeename , b.empname as Manager_name 
from emp_mgr a left join emp_mgr b 
on a.mgr_id = b.empid ;
select a.empname as Employeename , b.empname as Manager_name 		# Inner Join / self Join 
from emp_mgr a inner join emp_mgr b 
on a.mgr_id = b.empid ;		

# self join is joining table with the same table 							


# Inner Join --> Default
# Left ---> LEFT OUTER JOIN 
# Right ---> RIGHT OUTER JOIN
# CROSS
# SELF JOIN ( TABLE WITH SAME TABLE)
# FULL JOIN  ---> FULL OUTER JOIN


USE JOINS_DB;

create table CUSTOMER_TB(
CUST_ID INT,
CUST_NAME  VARCHAR(20)
);

create table PRODUCT_TB(
PRODUCT_ID INT,
PRODUCT_NAME VARCHAR(30)
);

create table SALES_TB(
CUST_ID INT,
PRODUCT_ID INT,
ORDER_DATE DATE,
SALES_AMOUNT INT
);

-- Insert into CUSTOMER_TB
INSERT INTO CUSTOMER_TB (CUST_ID, CUST_NAME) VALUES (1, 'Arun');
INSERT INTO CUSTOMER_TB (CUST_ID, CUST_NAME) VALUES (2, 'Priya');
INSERT INTO CUSTOMER_TB (CUST_ID, CUST_NAME) VALUES (3, 'Karthik');
INSERT INTO CUSTOMER_TB (CUST_ID, CUST_NAME) VALUES (4, 'Sneha');

-- Insert into PRODUCT_TB
INSERT INTO PRODUCT_TB (PRODUCT_ID, PRODUCT_NAME) VALUES (101, 'Laptop');
INSERT INTO PRODUCT_TB (PRODUCT_ID, PRODUCT_NAME) VALUES (102, 'Mobile');
INSERT INTO PRODUCT_TB (PRODUCT_ID, PRODUCT_NAME) VALUES (103, 'Tablet');
INSERT INTO PRODUCT_TB (PRODUCT_ID, PRODUCT_NAME) VALUES (104, 'Headphones');

-- Insert into SALES_TB
INSERT INTO SALES_TB (CUST_ID, PRODUCT_ID, ORDER_DATE, SALES_AMOUNT) 
VALUES (1, 101, '2025-01-10', 60000);

INSERT INTO SALES_TB (CUST_ID, PRODUCT_ID, ORDER_DATE, SALES_AMOUNT) 
VALUES (2, 102, '2025-01-12', 25000);

INSERT INTO SALES_TB (CUST_ID, PRODUCT_ID, ORDER_DATE, SALES_AMOUNT) 
VALUES (3, 103, '2025-01-15', 30000);

INSERT INTO SALES_TB (CUST_ID, PRODUCT_ID, ORDER_DATE, SALES_AMOUNT) 
VALUES (1, 104, '2025-01-18', 5000);

INSERT INTO SALES_TB (CUST_ID, PRODUCT_ID, ORDER_DATE, SALES_AMOUNT) 
VALUES (4, 101, '2025-01-20', 65000);

INSERT INTO SALES_TB (CUST_ID, PRODUCT_ID, ORDER_DATE, SALES_AMOUNT) 
VALUES (2, 103, '2025-01-22', 28000);

SELECT * FROM SALES_TB;
SELECT * FROM PRODUCT_TB;
SELECT * FROM CUSTOMER_TB;

SELECT A.CUST_NAME, C.PRODUCT_NAME ,B.ORDER_DATE , B.SALES_AMOUNT   FROM CUSTOMER_TB A LEFT JOIN SALES_TB B 
ON A.CUST_ID = B.CUST_ID LEFT JOIN PRODUCT_TB C ON B.PRODUCT_ID= C. PRODUCT_ID



