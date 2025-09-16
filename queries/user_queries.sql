-- ==================================================
-- Query 1:Find Products by Name
-- ==================================================
select * from products as p
where p.name like "%laptop%";
-- ==================================================
-- Query 2:View Orders for a Specific Customer
-- ==================================================
select * from orders as o
join customers as c on c.id=o.customer_id
--change contition to filter by customer name or id
--if we want by id no need for join
where c.first_name="omar" or o.customer_id=3;
-- ==================================================
-- Query 3:Search Products by Category
-- ==================================================
select p.name , p.price
from Products p
join categories c ON p.category_id = c.id
WHERE c.name = 'Clothing';
-- ==================================================
-- Query 4:Customers Who Bought a Specific Product
-- ==================================================
select c.first_name , c.last_name from customers as c
join orders as o on o.customer_id=c.id
join order_items as oi on o.id=oi.order_id
join products as p on p.id=oi.product_id
where p.name="laptop";
-- ==================================================
-- Query 5:Products Ordered More Than 2 Units
-- ==================================================
select p.name , sum(quantity)
from products as p
join order_items as oi on oi.product_id=p.id
group by p.name
having sum(quantity)>2;

-- ==================================================
-- Query 5: Total Spent by Each Customer
-- ==================================================
select u.first_name,u.last_name , sum(quantity*unit_price)
from customers as u
join orders as o on u.id=o.customer_id
join order_items as oi on oi.order_id=o.id
group by u.first_name,u.last_name;