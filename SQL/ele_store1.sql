SELECT * FROM ele_store1;

select count(*) from ele_store1;

select sum(sales) from ele_store1;
select sum(profit) from ele_store1;
select sum(sales),sum(profit) from ele_store1; # both agg in same query
select min(sales) from ele_store1;
select max(sales) from ele_store1;

select sum(sales) from ele_store1 where country = 'russia';
select sum(sales) from ele_store1 where country = 'germany';
select sum(sales) from ele_store1 where country = 'india';
select sum(sales) from ele_store1 where country = 'united states';
select sum(sales) from ele_store1 where country = 'china';

select distinct country from ele_store1;  # to avoid duplicates 

select country , sum(sales) from  ele_store1 group by country;

select channel , sum(sales),sum(profit)  from  ele_store1 group by channel;  # to find total of each channels

select country, sum(sales) from ele_store1
group by country order by sum(sales) desc; # order by comes at last of the query

#total sales and total profit for all cities in india country

SELECT * FROM ele_store1;

select sum(sales),sum(profit),city,country from ele_store1 where country = 'india' group by city ;
select sum(sales),sum(profit),city 
from amazon.ele_store1
where country = 'india'
group by city;


#I want total sales of china cities purchase through online sales sort it highest to lowest sales 

select sum(sales),city  from amazon.ele_store1 where channel = 'online' and country = 'china' group by city order by sum(sales) DESC;


#i want only the country and total sales ,provided total sales should be provided more than 5 Lakhs

select country,sum(sales)
from ele_store1
group by country
having sum(sales) > 500000;

# i want to see all country store sales provided store sales should be more than 1L

select country,sum(sales) from ele_store1
where channel = 'store' 
group by country 
having sum(sales) > 100000;

select sum(sales),city 
from amazon.ele_store1
where country = 'china' and channel = 'store'
group by city;

Select * from ele_store1;
#country | total_sales made | total profits  | Avg_sales | Avgprofit | Total orders

select 	country , 
		sum(sales) as total_sales , 
        sum(profit) as total_profits , 
        avg(sales) as AVG_sales,
        avg(profit) as AVG_profit
from ele_store1
group by country;

select * from ele_store1;
desc ele_store1;

select sum(sales) from ele_store1;
select min(sales) from ele_store1;
select max(sales) from ele_store1;
select avg(sales) from ele_store1;

select sum(sales) from ele_store1;

#scalar function

select Manufacturer, upper(Manufacturer) from ele_store1;
select Manufacturer, lower(Manufacturer) from ele_store1;
select Manufacturer, length(Manufacturer) from ele_store1;

select Manufacturer, sum(sales) from ele_store1 group by Manufacturer ;



select orderdate, sum(sales) from ele_store1 group by orderdate order by orderdate ;

# to extract the year from orderdate use scalar function
select orderdate, right(orderdate,4) year from ele_store1;
select orderdate, left(orderdate,2) date from ele_store1;
select orderdate, SUBSTR(orderdate, 4, 2)  date from ele_store1; 


# min.max,sum,avg ----aggregate function 
# length, upper, lower, substring ----scaler function 




