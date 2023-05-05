-- Look for information of customer,catalog and delivery boy
select * from customer;
select * from catalog;
select * from deliver_boy;

-- Count for the number of catalog items 
select count(product_id) from catalog;
 
-- Look for the prenium customers
select customer_ID,first_name as "Prenium customer" from customer
where discount_percent != '0';

-- Order the customer by area_code
select * from customer
order by area_code,last_name,first_name;

-- Update discount_percent for prenium customer who have customer_ID = 1
update customer
set discount_percent = '10%'
where customer_ID = 1;

-- Delete onlineorder which have order_id = 1
delete from onlineorder where order_id = 1;

-- See the first 3 deliveryboy
select * from deliver_boy
limit 3;

-- Check the item in catalog which has lowest price
select min(price) as Smallestprice
from catalog;

-- Check the item in catalog which has lowest price
select max(price) as Biggestprice
from catalog;

-- Look for the customers whose name start which 'a'
select * from customer
where first_name like 'a%';


-- Look for the customers from area 'A01' and 'D01'
select * from customer
where area_code in ('A01','D01');

-- Check the delivery boys who are able to ship to the customer area 
select * from deliver_boy
where area_code in (select area_code from customer);

-- Look for customer whose id between 10 and 20
select * from customer
where customer_ID between 10 and 20;

-- Look for customer information who order online in
select onlineorder.order_id,customer.first_name,onlineorder.order_date
from onlineorder 
inner join customer on onlineorder.customer_id=customer.customer_id
where onlineorder.order_date = '2023-04-11';

-- Look for all of the customer_id of customers who live in area B01
select customer_id from customer
where area_code ='B01'
union 
select customer_id from onlineorder 
where area_code ='B01'
order by customer_id;

-- Count number of customers live in each area
select count(customer_id),area_code
from customer
group by area_code;

-- Count the number of orders delivered to each area that is greater than 3
select count(order_id),area_code
from onlineorder
group by area_code
having count(order_id)>3;

-- Look for customers who had a delivery boy named 'Bingchili' deliver the orders.
select * from customer
where exists
(select * from onlineorder
where (onlineorder.customer_id=customer.customer_id)
and (boy_name='Bingchili'));

-- Best seller
SELECT c.product_id, c.product_name, SUM(o.quantity)
FROM onlineorder o
JOIN catalog c ON o.product_id = c.product_id
GROUP BY c.product_id, c.product_name
ORDER BY SUM(o.quantity) DESC
limit 4;

-- Consumption Market
select address, count(area_code) from onlineorder group by address;

-- Loyalty Customer
SELECT c.customer_id, c.last_name, sum(o.quantity)
FROM onlineorder o
JOIN customer c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.last_name
ORDER BY SUM(o.quantity) DESC
limit 5;

-- Compare order online và premised
select sum(quantity), count(order_id) from onlineorder;
select sum(quantity), count(order_id) from ONPREMISESORDER;

-- Best delivery 
SELECT c.area_code, c.boy_name, count(o.area_code)
FROM onlineorder o
JOIN deliver_boy c ON o.area_code = c.area_code
GROUP BY c.area_code, c.boy_name
ORDER BY count(o.area_code) DESC
limit 5;


