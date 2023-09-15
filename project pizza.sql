create database pizza_sales;
use pizza_sales;
select*from pizza_types;

create table orders (
order_id int primary key,
date text,
time text
);

select*from orders;

create table order_details(
order_details int primary key,
order_id int,
pizza_id text,
quantity int

);
select*from orders;
select*from order_details;
select*from pizza_types; 
select*from pizzas;

create view pizza_details as
select p.pizza_id,p.pizza_type_id,pt.name,pt.category,p.size,p.price,pt.ingredients
from pizzas p
join pizza_types pt
on pt.pizza_type_id=p.pizza_type_id; 

select*from pizza_details;

alter table orders
modify date DATE;

alter table orders
modify time TIME;
##-------------------total revenue--------------;

select round(sum(od.quantity*p.price),2) as total_revenue
from order_details od
join pizza_details p
on od.pizza_id=p.pizza_id;


##----------------------------total no of pizza sale----------------------;
select sum(od.quantity) as pizaa_sold
from order_details od;

##=====total oders============
select count(distinct(order_id)) as total_orders
from order_details;

##--------------------average order values----------
select round(sum(od.quantity*p.price)/count(distinct(order_id)),2) as avg_order_value
from  order_details od
join pizza_details p
on od.pizza_id=p.pizza_id;

##-----------average no 0f pizza per order-------;
select round(sum(od.quantity)/count(distinct(order_id)),2) as avg_no_pizza_value
from order_details od;

##--------------total revenue  and no of orders per category------------------;
select p.category,round(sum(od.quantity*p.price),2) as total_revenue, count(distinct(order_id)) as total_orders
from  order_details od
join pizza_details p
on od.pizza_id=p.pizza_id
group by p.category;

##-----------------------total revenue and number of order per size---------
select p.size,round(sum(od.quantity*p.price),2) as total_revenue, count(distinct(order_id)) as total_orders
from  order_details od
join pizza_details p
on od.pizza_id=p.pizza_id
group by p.size;

##-------------------hourly,daily and monthly in orders  and revenue of pizza
select case  
when hour(o.time) between 9 and 12 then "late morning"
 when hour(o.time) between 12 and 15 then "lunch"
when hour(o.time) between 15 and 18 then "mid afternoon"
when hour(o.time) between 18 and 21 then "Dinner"
when hour(o.time) between 21 and 23 then "late night"
else 'others'
end as meal_time,count(distinct(od.order_id)) as total_orders

from order_details od
join orders o
on o.order_id=od.order_id
group by meal_time
order by total_orders desc;

##_____________weekdays-------------------
select dayname(o.date) as day_name,count(distinct(od.order_id)) as total_orders
from order_details od
join orders o
on o.order_id=od.order_id
group by dayname(o.date)
order by total_orders desc;

#-------------------------- month wise--------------;
select monthname(o.date) as day_name,count(distinct(od.order_id)) as total_orders
from order_details od
join orders o
on o.order_id=od.order_id
group by monthname(o.date)
order by total_orders desc;

#-------------most orders pizza-----------;
select p.name,p.size, count(od.order_id) as count_pizzas
from order_details od
join pizza_details p
on od.pizza_id =p.pizza_id
group by p.name,p.size
order by count_pizzas desc;

##----------------------top 5 pizza revenue-------------
select p.name, sum(od.quantity*p.price) as top_pizzas
from order_details od
join pizza_details p
on od.pizza_id =p.pizza_id
group by p.name
order by top_pizzas desc
limit 5;

##---------------------top pizzas by sale-----------
select p.name, sum(od.quantity) as pizzas_sold
from order_details od
join pizza_details p
on od.pizza_id =p.pizza_id
group by p.name
order by pizzas_sold desc
limit 5;

###-----------pizza analysis-------
select name, price 
from pizza_details
order by price;

##------------------------top used ingredeints------------
select*from pizza_details

create temporary table number as
(
select 1 as n union all


)

