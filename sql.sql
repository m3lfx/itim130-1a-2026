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