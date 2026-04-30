SELECT *
FROM customer

SELECT fname, lname, addressline, phone
FROM customer

SELECT town, lname
FROM customer

SELECT description, sell_price
FROM item

FROM orderinfo
SELECT orderinfo_id, date_placed

SELECT  DISTINCT town, lname 
FROM customer

SELECT description, sell_price
FROM item
ORDER BY description

SELECT description, sell_price
FROM item
ORDER BY description DESC

SELECT description, sell_price
FROM item
ORDER BY sell_price DESC

SELECT orderinfo_id, date_placed
FROM orderinfo 
ORDER BY date_placed DESC

get the top 5 expensive items
SELECT description, sell_price 
FROM item
ORDER BY sell_price DESC
LIMIT 5

 select * from customer order by customer_id DESC limit 5;

 SELECT customer_id, lname
 FROM customer
 LIMIT 5,2

 fetch all customers from bingham
 SELECT fname, lname, town
 FROM customer
 WHERE town = 'bingham'

 fetch all items that are selling above 10 pesos
SELECT description, sell_price
FROM item
WHERE sell_price > 10
ORDER BY sell_price

fetch orders from july onwards
SELECT orderinfo_id, date_placed
FROM orderinfo
WHERE date_placed > '2000-07-01'

fetch all items that are priced between 10 and 20 pesos
SELECT description, sell_price
FROM item
WHERE sell_price >= 10 AND sell_price <= 20

fetch all orders for the month of september

SELECT orderinfo_id, date_placed AS 'date ordered'
FROM orderinfo
WHERE date_placed >= '2000-09-01' AND date_placed <= '2000-09-30' 

FETCH all customers from the towns nicetown, bingham and milltown

 SELECT fname, lname, town
 FROM customer
 WHERE town = 'bingham' OR town = 'nicetown' OR town = 'milltown'

SELECT fname, lname, town
 FROM customer
 WHERE town IN ('bingham','nicetown','milltown')

 fetch all customers that have mr on their title and living on bingham

 SELECT title, fname, lname, town
 FROM customer
 WHERE town = 'bingham' AND title = 'mr'

 fetch customer 1 to 5
 SELECT * 
 FROM customer
 WHERE customer_id BETWEEN 1 AND 5

 fetch all orders for the month of september

SELECT orderinfo_id, date_placed AS 'date ordered'
FROM orderinfo
WHERE date_placed BETWEEN '2000-09-30' AND '2000-09-01' 

SELECT * 
 FROM customer
 WHERE customer_id BETWEEN 5 AND 1

  SELECT title, fname, lname, town
 FROM customer
 WHERE BINARY town = 'bingham' 

 fetch all customers whose last name start with an 'h'
 SELECT lname, fname
 FROM customer
 WHERE lname LIKE 'h%'

 fetch all customers with exactly four characters on their first name

 SELECT lname, fname
 FROM customer
 WHERE fname LIKE '____'

 fetch all items with a 9 on their cost_price
 SELECT description, cost_price
 FROM item
 WHERE cost_price NOT LIKE '%9%'

  SELECT title, fname, lname, town
 FROM customer
 WHERE BINARY town != 'Bingham'

 SELECT fname, lname, town
 FROM customer
 WHERE town NOT IN ('bingham','nicetown','milltown')

FETCH all items that has a 's' on their description
 SELECT description, cost_price
 FROM item
 WHERE  description LIKE '%s%'

 fetch all orders by ann stones
 
SELECT o.orderinfo_id , c.customer_id, c.fname, c.lname, o.date_placed, o.shipping 
FROM customer c, orderinfo o
WHERE c.customer_id = o.customer_id
AND c.fname = 'ann' AND c.lname = "stones"
-- AND c.customer_id = 8;

fetch all customers that placed an order for the month of march.
 SELECT o.orderinfo_id , c.customer_id, c.fname, c.lname, o.date_placed, o.shipping 
FROM customer c, orderinfo o
WHERE c.customer_id = o.customer_id
AND o.date_placed BETWEEN '2000-03-01' AND '2000-03-31'
