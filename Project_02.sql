select * from Superstore_orders;
select top 5 * from Superstore_orders;
alter table  Superstore_orders alter column order_date datetime;
update Superstore_orders
set Profit = Round((profit),2)
update Superstore_orders
set Discount = round((Discount),2)
update Superstore_orders
set Sales = round((Sales),2)

select * from Superstore_orders
where Product_Name is NULL

select Distinct(Order_Id) from Superstore_orders; 
select * from Superstore_orders
order by Order_Date,Row_ID
 
select Distinct(Ship_Mode), order_date from Superstore_orders

select * from Superstore_orders
where Ship_Mode = 'First Class'

select order_date,quantity --4
from Superstore_orders  --1
where Quantity >= 5   --2
order by Quantity  --3

select * from Superstore_orders
where ship_mode in ('First Class','Second Class')

select * from Superstore_orders
where Ship_Mode = 'First Class' and Segment = 'Consumer';

select *,Round((profit/sales),2) as ratio,getDate() as present_date
from Superstore_orders;

--pattern matching like operator
select order_id,order_date,customer_name
from Superstore_orders
where Customer_Name like 'C%'

select order_id,order_date,customer_name,upper(customer_name) as name_upper
from Superstore_orders
where upper(customer_name) like 'A%A';

select Customer_name from Superstore_orders
where Customer_name LIKE '_a_d%';
select Order_id,Order_Date from Superstore_orders
where Order_Date between '2020-12-01' and '2020-12-31'
order by Order_date;
select Order_id,Customer_name from Superstore_orders
where Customer_Name not LIKE 'A%n'
select * from Superstore_orders where profit<0;
select Order_ID from Superstore_orders
where quantity < 3 OR profit = 0;
select order_id from Superstore_orders
where region='South'and discount >0
select Top 5 * from Superstore_orders
where Category='Furniture'
order by sales DESC
--aggregation 
select count(*) as count,
sum(sales) as total,
Max(sales) as mazx,
min(sales) as minx,
avg(profit) as avg_pprofit
from Superstore_orders
select top 1 * from Superstore_orders
order by sales ASC;

--group by 
select region,Category from Superstore_orders
group by region,Category

select sub_category,sum(sales)as total_sales
from Superstore_orders
group by Sub_Category
having sum(Sales)>100000
order by total_sales desc

update Superstore_orders
set city = null
where order_id in ('CA-2020-161389','US-2021-156909')

select * from Superstore_orders where city is  null;
select Category,sum(profit) as total_profit,min(order_date),max(order_date)
from Superstore_orders
group by Category;

select sub_category
from Superstore_orders
group by Sub_Category
having avg(profit)>max(profit)/2;

-- JOINS 
select * from Superstore_orders


select * from employee
select * from dept

select D.dep_name,avg(E.salary) as avg_salary
from employee E
inner join dept D on E.dept_id=D.dept_id
group by D.dep_name
order by avg_salary asc

select D.dep_name from employee E
inner Join dept D on D.dept_id=E.dept_id
group by D.dep_name
having count(distinct salary) = count(1)

select D.dep_name from employee E
inner join dept D on E.dept_id=D.dept_id
group by D.dep_name
having count(E.emp_id)=0

select E.emp_name from employee E
left join dept D on E.dept_id = D.dept_id
where D.dept_id is null

select dept_id,string_agg(emp_name,',') within group (order by emp_name) as list_od_employees
from employee
group by dept_id


-- DATE Functions 

select order_id,order_date,DATEPART(year,order_date) as Y_of_col,
DATENAME(month,order_date),
DAteName(weekday,order_date),
datename(year,order_date)
from Superstore_Orders

select order_id,order_date,
dateadd(day,5,order_date)as order_date_5
from Superstore_orders


--DAY 6 asssessment

select E1.emp_name,E2.emp_name as manager_name,DateDiff(day,e1.dob,e2.dob) as diff_age
from employee E1
inner join employee E2 on E1.manager_id = E2.emp_id
where DatePart(year,E1.dob)<DAtepart(year,E2.dob)


select order_id
from orders
group by order_id
having count(1)=1

--*imp*
select * from orders
select order_id,order_date,ship_date,datediff(day,order_date,ship_date)-2*datediff(week,order_date,ship_date)as no_of_bussiness_days
from orders

select Category,sum( case when datepart(year,order_date)=2019 THEN sales end) as total_sales_2019,
sum( case when datepart(year,order_date)=2020 THEN sales end) as total_sales_2020
from orders
group by Category

select TOP 5 City,AVG(datediff(day,order_date,ship_date))as avg_days
from orders
where region='west'
group by city
order by avg_days asc

--string functions 
select order_id,customer_name,
Replace(order_id,'CA','PB') as replace_ca
,Trim('         raj')
,Replace(order_id,'A','B') as replace_ab
,Translate(customer_name,'AGC','TPO') as translat_AG
,len(customer_name) as leng
,left(customer_name,4) as name_4
,right(customer_name,3) as name_3
,left(customer_name,CharIndex('',customer_name)) as first_name
,CHARINDEX('',customer_name) as space_position
,CHARINDEX('c',customer_name) as first_position
,concat(order_id,' ',customer_name)
from orders;

--NULL handling 
select order_id,City,isnull(city,'unknow') as new_city,
state,coalesce(city,state,region,'unknown')as new_city
from orders
order by city

select * from Superstore_Orders


create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');


select * from icc_world_cup

select * from Superstore_orders
--SubQuery--
--find avg order value
select avg(order_sales)from
(select order_id,sum(sales) as order_sales
from Superstore_orders
group by order_id) as orders_aggregated
--find orders with sales more than avg order value 
select order_id
from superstore_orders
group by order_id
having sum(sales)>(select avg(order_sales)from
(select order_id,sum(sales) as order_sales
from Superstore_orders
group by order_id) as orders_aggregated)

select * from employee
select * from dept

select team_name,count(*) as matches_played,sum(win_flag) as matchs_won,count(1)-sum(win_flag) as lost_matchs_won
from
(select team_1 as team_name,case when team_1=winner then 1 else 0 end as win_flag
from icc_world_cup
union all 
select team_2 as team_name,case when Team_2=winner then 1 else 0 end as win_flag
from icc_world_cup) A
group by team_name

---CTE -> COMMON TABLE EXPRESSIION
with T as 
(select team_1 as team_name,case when team_1=winner then 1 else 0 end as win_flag
from icc_world_cup
union all 
select team_2 as team_name,case when Team_2=winner then 1 else 0 end as win_flag
from icc_world_cup)
select team_name,count(*) as matches_played,sum(win_flag) as matchs_won,count(1)-sum(win_flag) as lost_matchs_won
from T
group by team_name



create Database customer_db

create Database ecommerce_db

