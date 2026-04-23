# CTE functions
# min.max,sum,avg ----aggregate function 
# length, upper, lower, substring ----scaler function 

select sum(sales) from ele_store1;
select min(sales) from ele_store1;
select max(sales) from ele_store1;
select avg(sales) from ele_store1;

select Manufacturer, sum(sales) from ele_store1 group by Manufacturer ;

select * from ele_store1;
select Manufacturer, upper(Manufacturer) from ele_store1;
select Manufacturer, lower(Manufacturer) from ele_store1;
select Manufacturer, length(Manufacturer) from ele_store1;

# to extract the year from orderdate use scalar function
select orderdate, right(orderdate,4) year from ele_store1;
select orderdate, left(orderdate,2) date from ele_store1;
select orderdate, SUBSTR(orderdate, 4, 2)  date from ele_store1; 

# first transaction 
select min(orderdate) from ele_store1;
select max(orderdate) from ele_store1;
select * from ele_store1 where orderdate > '01-01-2018' and orderdate > '31-12-2018';
select * from ele_store1 where orderdate >= '01-01-2018' and orderdate >= '31-12-2018';
select * from ele_store1 where orderdate between  '01-01-2018' and  '31-12-2018';

select orderdate, right(orderdate,4) from ele_store1;
select * from ele_store1 where right(orderdate,4) = '2018';
select * from ele_store1 where year(orderdate) = '2018';

#date   YOY (year over year )
select orderdate,
	right(orderdate,4) , 
    year(orderdate),
    YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y')),
    month(STR_TO_DATE(orderdate, '%d-%m-%Y'))  
from ele_store1;

# -----------------Multiple subquery ,alais, brackets confussion-----------------
select yr,tot_sales,((tot_sales-previous_yearsales)/previous_yearsales)* 100  yoy
		from (
select yr, tot_sales , lag(tot_sales) over (order by yr) previous_yearsales
		from (
select YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y')) as yr ,
		sum(sales) as tot_sales
        from ele_store1 
        group by YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y')) ) x ) b;

# check inner query  then outer 

CREATE TABLE student_all_marks_table (
    s_name VARCHAR(50),
    s_subject VARCHAR(50),
    marks INT
);

INSERT INTO student_all_marks_table (s_name, s_subject, marks) VALUES
('Santhosh', 'Maths', 99),
('Santhosh', 'Science', 85),
('Santhosh', 'Computers', 94),
('Rahul', 'Maths', 98),
('Rahul', 'Science', 84),
('Rahul', 'Computers', 99),
('Sathish', 'Maths', 98),
('Sathish', 'Science', 98),
('Sathish', 'Computers', 98),
('Divi', 'Maths', 96),
('Divi', 'Science', 92),
('Divi', 'Computers', 91);



select * from student_all_marks_table;

select * from (
select  s_name , tot_marks , dense_rank()over(order by tot_marks desc) rnk from ( 
select s_name , sum(marks) tot_marks from student_all_marks_table group by s_name  ) x ) y 
where rnk = 2;


# CTE COMMON TABLE EXPRESSION

WITH CTE AS (select s_name , sum(marks) tot_marks from student_all_marks_table group by s_name ),
		CTE1 AS (select  s_name , tot_marks , dense_rank()over(order by tot_marks desc) rnk from CTE )
        SELECT * FROM CTE1 WHERE rnk = 2;

# YOY (Year over Year)

select yr,tot_sales,((tot_sales-previous_yearsales)/previous_yearsales)* 100  yoy
		from (
select yr, tot_sales , lag(tot_sales) over (order by yr) previous_yearsales
		from (
select YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y')) as yr ,
		sum(sales) as tot_sales
        from ele_store1 
        group by YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y')) ) x ) b;
        
        
 with cte as     (select YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y')) as yr ,sum(sales) as tot_sales from ele_store1  group by YEAR(STR_TO_DATE(orderdate, '%d-%m-%Y'))),
	  cte1 as (  select yr, tot_sales , lag(tot_sales) over (order by yr) previous_yearsales from cte)
	  select yr,tot_sales,((tot_sales-previous_yearsales)/previous_yearsales)* 100  yoy 	from cte1;
	

        