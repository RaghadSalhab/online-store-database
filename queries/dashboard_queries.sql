-- ==================================================
-- Query 1: Top 5 Best-Selling Products
-- ==================================================
select p.name , sum(oi.quantity) from products as p
join order_items as oi on oi.product_id=p.id
group by p.id
order by sum(oi.quantity) desc
limit 5;
-- ==================================================
-- Query 2: Total Sales per Category
-- ==================================================
select c.name , sum(oi.quantity*oi.unit_price) as total_sales from categories as c
join products as p on p.category_id=c.id
join order_items as oi on oi.product_id=p.id
group by c.name
order by total_sales desc;

-- ==================================================
-- Query 3: Customer with Highest Number of Orders
-- ==================================================
select c.first_name , c.last_name , count(o.id) as number_of_orders from customers as c
join orders as o on o.customer_id=c.id
group by c.id
order by number_of_orders desc
limit 1;
-- ==================================================
-- Query 4: Total Revenue
-- ==================================================
select sum(oi.unit_price*oi.quantity) 
from order_items as oi;

-- ==================================================
-- Query 5: Top Customer by Revenue
-- ==================================================
select c.first_name, c.last_name, sum(oi.unit_price*oi.quantity) total_Revenue_by_user
from order_items as oi
join orders as o on o.id=oi.order_id
join customers as c on c.id=o.customer_id
group by o.customer_id 
order by total_Revenue_by_user desc
limit 1;
-- ==================================================
-- Query 6: Top 2 Categories per Customer
-- ==================================================
select ranked.first_name ,ranked.last_name , ranked.name , ranked.total
from 
(
select u.first_name , u.last_name , c.name , sum(oi.unit_price*oi.quantity) as total,
row_number() over
(
partition by u.id
order by sum(oi.unit_price*oi.quantity) desc
) as rn
from customers as u
join orders as o on u.id=o.customer_id
join order_items as oi on o.id=oi.order_id
join products as p on p.id=oi.product_id
join categories as c on c.id=p.category_id
group by u.id, c.id, u.first_name, u.last_name
)AS ranked
WHERE rn <= 2
ORDER BY  ranked.first_name ,ranked.last_name , ranked.name , ranked.total DESC;
;
-- ==================================================
-- Query 7:Monthly Revenue Trend per Category
-- ==================================================
select DATE_FORMAT(o.order_date, '%Y-%m') AS month, c.name , sum(oi.unit_price*oi.quantity) as total
from orders as o
join order_items as oi on o.id=oi.order_id
join products as p on p.id=oi.product_id
join categories as c on c.id=p.category_id
GROUP BY month, c.name
ORDER BY month, total DESC
--limit 1 is we want best category per month
;