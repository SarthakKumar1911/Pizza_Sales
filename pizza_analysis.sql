Create schema pizza_sales;
use pizza_sales;

select * from sales
LIMIT 25000;

describe sales;

select MONTH(order_date) as month 
FROM sales;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select sum(total_price) as Sales
from sales;

select count(distinct order_id) as Total_Orders
from sales;


select monthname(order_date), count(distinct order_id) as orders 
from sales
group by monthname(order_date)
order by count(distinct order_id) desc;


select dayname(order_date), count(distinct order_id) as orders
from sales
group by dayname(order_date);


select pizza_category , count(distinct order_id) as orders
from sales
group by pizza_category;


select pizza_size, count(distinct order_id) as orders
from sales
group by pizza_size;


select pizza_category, concat(round(sum(total_price),2), "$") as revenue
from sales
group by pizza_category;

select pizza_category, count(distinct order_id)
from sales
where month(order_date) = 5
group by pizza_category
order by count(distinct order_id) desc;



select monthname(order_date), (select pizza_category
from sales
group by pizza_category
order by sum(total_price) desc
limit 1) as most_sold_category
from sales
group by monthname(order_date);


select monthname(order_date), (select pizza_category
from sales
group by pizza_category
order by count(distinct order_id) desc
limit 1) as most_sold_category
from sales
group by monthname(order_date);

select pizza_name, count(distinct order_id) as Pizzas_sold
from sales
group by pizza_name
order by count(distinct order_id) desc;





