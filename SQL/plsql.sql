SELECT * FROM ele_store1;

# top 5 countries having top orders 

select * from (
select *, dense_rank() over(order by tot_orders desc) rnk  from (
select country , count(orderid) tot_orders from ele_store1 group by country
) x ) x1 where rnk <= 5 ;

with cte as (select country , count(orderid) tot_orders from ele_store1 group by country),
	cte1 as (select *, dense_rank() over(order by tot_orders desc) rnk  from cte)
    select * from (cte1) where rnk <= 5 ;
    
    
    
# Give total 5 petrol care year by year


select * from car_data_Tb;

select * from (
select *, dense_rank() over ( order by Tot_cnt desc ) rnk  from (
select year , count(*) as Tot_cnt from car_data_Tb where fuel_type = 'petrol' group by year ) x ) y where rnk <= 5;

# stored Procedure
delimiter %%
create procedure get_top_10_petrol_cars ()
begin 
select * from (
select *, dense_rank() over ( order by Tot_cnt desc ) rnk  from (
select year , count(*) as Tot_cnt from car_data_Tb where fuel_type = 'petrol' group by year ) x ) y where rnk <= 10;
end 
%%

call get_top_5_petrol_cars();
call get_top_10_petrol_cars();
call get_top_n_petrol_cars(3);

delimiter %%
create procedure get_top_n_petrol_cars (
in num int )
begin 
select * from (
select *, dense_rank() over ( order by Tot_cnt desc ) rnk  from (
select year , count(*) as Tot_cnt from car_data_Tb where fuel_type = 'petrol' group by year ) x ) y where rnk <= num;
end 
%%

 call get_top_n_petrol_cars(13);   
 
 
 select fuel_type , count(*) tot_cars from car_data_Tb where year = 2016 group by fuel_type  order by tot_cars desc;

drop procedure get_cars_by_fuel_types();
delimiter &&
create procedure get_cars_by_fuel_types(in v_year int , in v_trans varchar(20))
begin 
 select fuel_type , count(*) tot_cars from car_data_Tb where year = v_year and transmission = v_trans group by fuel_type  order by tot_cars desc;
end
&&

call get_cars_by_fuel_types(2015,'manual');

# complex store procedure 

select * from ele_store1;

select channel , sum(sales) tot_sales from ele_store1 where YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y')) = '2018' group by channel ;

delimiter $$
create procedure channel_by_sales( in yr int
)
begin 
select channel , sum(sales) tot_sales from ele_store1 where YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y')) = yr group by channel ;
end
$$

call channel_by_sales(2018);

select  * from sales;

CREATE TABLE sales (
    user_id INT NOT NULL,
    sales INT NOT NULL,
    date DATE NOT NULL
);
INSERT INTO sales (user_id, sales, date) VALUES
(1, 2450, '2019-01-12'),
(2, 1800, '2019-02-03'),
(3, 3200, '2019-03-15'),
(4, 2750, '2019-04-20'),
(5, 1500, '2019-05-11'),
(1, 4100, '2019-06-01'),
(2, 900,  '2019-06-18'),
(3, 1200, '2019-07-09'),
(4, 2200, '2019-07-25'),
(5, 3050, '2019-08-14'),

(1, 1990, '2019-09-03'),
(2, 2875, '2019-09-21'),
(3, 3330, '2019-10-10'),
(4, 4100, '2019-10-30'),
(5, 1750, '2019-11-15'),
(1, 2800, '2019-12-01'),
(2, 1500, '2019-12-10'),
(3, 750,  '2019-12-22'),
(4, 5000, '2019-12-28'),
(5, 2100, '2020-01-05'),

(1, 3500, '2020-01-13'),
(2, 1750, '2020-02-02'),
(3, 980,  '2020-02-14'),
(4, 4500, '2020-02-28'),
(5, 2600, '2020-03-11'),
(1, 1200, '2020-03-20'),
(2, 800,  '2020-04-05'),
(3, 35,   '2020-04-05'),
(4, 2200, '2020-04-18'),
(5, 3900, '2020-05-02'),

(1, 4100, '2020-05-19'),
(2, 1353, '2020-05-25'),
(3, 2750, '2020-06-07'),
(4, 1250, '2020-06-07'),
(5, 3000, '2020-06-21'),
(1, 1800, '2020-07-04'),
(2, 2200, '2020-07-16'),
(3, 4100, '2020-07-29'),
(4, 900,  '2020-08-12'),
(5, 1500, '2020-08-26'),

(1, 2750, '2020-09-09'),
(2, 3100, '2020-09-22'),
(3, 2850, '2020-10-03'),
(4, 1999, '2020-10-17'),
(5, 4500, '2020-10-30'),
(1, 3500, '2020-11-12'),
(2, 750,  '2020-11-12'),
(3, 1200, '2020-11-25'),
(4, 5000, '2020-12-05'),
(5, 2700, '2020-12-18'),

(1, 3200, '2021-01-03'),
(2, 2100, '2021-01-15'),
(3, 1850, '2021-01-29'),
(4, 2600, '2021-02-10'),
(5, 3900, '2021-02-22'),
(1, 4100, '2021-03-05'),
(2, 1400, '2021-03-18'),
(3, 900,  '2021-03-29'),
(4, 3300, '2021-04-12'),
(5, 2800, '2021-04-25'),

(1, 1750, '2021-05-08'),
(2, 2600, '2021-05-19'),
(3, 3100, '2021-06-01'),
(4, 4200, '2021-06-14'),
(5, 1500, '2021-06-27'),
(1, 2200, '2021-07-09'),
(2, 3050, '2021-07-21'),
(3, 2750, '2021-08-03'),
(4, 1800, '2021-08-16'),
(5, 3600, '2021-08-29'),

(1, 4000, '2021-09-10'),
(2, 1950, '2021-09-23'),
(3, 2850, '2021-10-05'),
(4, 5000, '2021-10-18'),
(5, 1250, '2021-10-31'),
(1, 2600, '2021-11-13'),
(2, 1750, '2021-11-26'),
(3, 900,  '2021-12-08'),
(4, 3400, '2021-12-20'),
(5, 4100, '2021-12-31'),

(1, 1500, '2022-01-10'),
(2, 2750, '2022-01-22'),
(3, 3200, '2022-02-03'),
(4, 2100, '2022-02-15'),
(5, 1800, '2022-02-28'),
(1, 3900, '2022-03-10'),
(2, 4100, '2022-03-22'),
(3, 2600, '2022-04-04'),
(4, 1750, '2022-04-16'),
(5, 3000, '2022-04-29');

select * from sales ;
select sum(sales) from sales  where user_id = 1;
select sum(sales) from sales  where user_id = 3;
select sum(sales) from sales  where user_id = 4;

delimiter &&
create procedure cust_status(in v_id  int , out v_status varchar(20))
begin 
declare purchase int default 0;
 select sum(sales) from sales  where user_id = v_id;
 if purchase > 10000 then 
	set v_status = 'platinum';
ELSEIF purchase > 5000 then 
	set v_status = 'SILVER';
ELSE 
    set v_status = 'GOLD';
 END IF;   
end
&&

CALL cust_status(1,@V_STATUS);
CALL cust_status(2,@V_STATUS);

# FUNCTIONS 
DELIMITER $$
CREATE FUNCTION calprof
(CP FLOAT,
SP FLOAT 
)
RETURNS INT
DETERMINISTIC
BEGIN 
	DECLARE PROFIT INT;
    SET PROFIT = SP-CP;
    RETURN PROFIT;
 END 
$$

select  calprof(100,200);

DELIMITER $$

CREATE FUNCTION F_AGE_SEGMENT(
    AGE INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE CUST_AGE VARCHAR(20);

    IF AGE > 55 THEN
        SET CUST_AGE = 'SENIOR CITIZEN';
    ELSEIF (AGE <= 55 AND AGE >= 18) THEN
        SET CUST_AGE = 'ADULT';
    ELSEIF AGE < 18 THEN
        SET CUST_AGE = 'TEEN';
    END IF;

    RETURN CUST_AGE;  -- important -- return the age group
END
$$

SELECT F_AGE_SEGMENT(60);

DROP TABLE IF EXISTS EMPLOYEE;

CREATE TABLE EMPLOYEE (
    EMP_ID INT,
    EMP_FIRST_NAME VARCHAR(20),
    EMP_LAST_NAME VARCHAR(20),
    AGE INT,
    PHONE_NUMBER BIGINT,
    ADDRESS VARCHAR(100)
);
INSERT INTO EMPLOYEE VALUES (101, 'SANTHOSH', 'K', 28, 7892213354, 'BANGALORE');
INSERT INTO EMPLOYEE VALUES (102, 'DINESH', 'R', 30, 7418529630, 'CHENNAI');
INSERT INTO EMPLOYEE VALUES (103, 'DIVI', 'K', 29, 9638527410, 'BANGALORE');
INSERT INTO EMPLOYEE VALUES (104, 'SANDHIYA', 'P', 26, 9874512360, 'DELHI');
INSERT INTO EMPLOYEE VALUES (105, 'SANJAY', 'S', 20, 9512358744, 'PUNE');

DROP TABLE IF EXISTS EMPLOYEE_HISTORY;

CREATE TABLE EMPLOYEE_HISTORY (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    EMP_ID INT,
    ACTION VARCHAR(20),
    FIELD VARCHAR(20),
    OLD_VALUE VARCHAR(20),
    NEW_VALUE VARCHAR(20),
    UPDATEUSER VARCHAR(20),
    UPDATETIMESTAMP TIMESTAMP
);

select * from EMPLOYEE;
select * from EMPLOYEE_HISTORY;

set sql_safe_updates =  0;
UPDATE EMPLOYEE SET ADDRESS = 'MALDIVES' WHERE EMP_ID = 101;
UPDATE EMPLOYEE SET PHONE_NUMBER = 1010101010  WHERE EMP_ID = 103;




# Case statements 
select * from sales;

select user_id , tot_sales ,
		case when tot_sales > 0 and tot_sales< 5000 then 'BRONZE'
			when tot_sales > 5000 and tot_sales< 10000 then 'SILVER'
            when tot_sales > 10000 and tot_sales< 15000 then 'GOLD'
            ELSE 'PLATINUM' END AS SALES_GRP
        from (
select user_id , sum(sales) AS TOT_SALES from sales group by user_id ) x;

WITH CTE AS (select user_id , sum(sales) AS TOT_SALES from sales group by user_id)
select user_id , tot_sales ,
		case when tot_sales > 0 and tot_sales< 5000 then 'BRONZE'
			when tot_sales > 5000 and tot_sales< 10000 then 'SILVER'
            when tot_sales > 10000 and tot_sales< 15000 then 'GOLD'
            ELSE 'PLATINUM' END AS SALES_GRP
        from CTE;


 # INDEX
 
 SELECT COUNT(*) FROM ELE_STORE1;
 
 
 


