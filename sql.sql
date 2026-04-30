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

fetch all orders and their customers that live in bingham or nicetown.
SELECT o.orderinfo_id , c.customer_id, c.fname, c.lname, o.date_placed, o.shipping, c.town 
FROM customer c, orderinfo o
WHERE c.customer_id = o.customer_id
AND (c.town = 'bingham' OR c.town = 'nicetown')

SELECT o.orderinfo_id , c.customer_id, c.fname, c.lname, o.date_placed, o.shipping, c.town 
FROM customer c, orderinfo o
WHERE c.customer_id = o.customer_id
AND c.town IN ('bingham', 'nicetown')

fetch all 'customers' orders and their items;

SELECT c.customer_id, o.orderinfo_id, o.date_placed, i.item_id, i.description
FROM customer c, orderinfo o, orderline ol, item i
WHERE c.customer_id = o.customer_id
AND o.orderinfo_id = ol.orderinfo_id
AND i.item_id = ol.item_id

what items did ann stones bought
SELECT c.customer_id, c.fname, c.lname, o.orderinfo_id, o.date_placed, i.item_id, i.description
FROM customer c, orderinfo o, orderline ol, item i
WHERE c.customer_id = o.customer_id
AND o.orderinfo_id = ol.orderinfo_id
AND i.item_id = ol.item_id
AND c.lname = 'stones' 
AND c.fname = "ann"

list all products that were bought for the month of july

SELECT i.description, monthname(o.date_placed), ol.quantity
FROM  orderinfo o, orderline ol, item i
WHERE o.orderinfo_id = ol.orderinfo_id
AND i.item_id = ol.item_id
AND o.date_placed BETWEEN '2000-07-01' AND '2000-07-31'

fetch all customers that bought tissue paper 

SELECT concat(c.fname, " ", c.lname) as name, i.description, ol.quantity
FROM customer c, orderinfo o, orderline ol, item i
WHERE c.customer_id = o.customer_id
AND o.orderinfo_id = ol.orderinfo_id
AND i.item_id = ol.item_id
AND i.description = 'tissues'

fetch all items that were bought by customers from bingham and nicetown
SELECT o.orderinfo_id, concat(c.fname, " ", c.lname) as name, c.town, i.description, ol.quantity
FROM customer c, orderinfo o, orderline ol, item i
WHERE c.customer_id = o.customer_id
AND o.orderinfo_id = ol.orderinfo_id
AND i.item_id = ol.item_id
AND c.town IN ('bingham', 'nicetown')

inner join
fetch all customers that bought items that are price above 10 pesos
SELECT c.fname, c.lname, o.orderinfo_id, i.description, i.sell_price
FROM customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id
INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id
WHERE i.sell_price > 10
ORDER BY c.lname DESC

fetch all customers that bought tissue paper 

SELECT concat(c.fname, " ", c.lname) as name, i.description, ol.quantity
FROM customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id
INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id
WHERE i.description = 'tissues'

fetch all items that were bought by customers from bingham and nicetown

SELECT o.orderinfo_id, concat(c.fname, " ", c.lname) as name, c.town, i.description, ol.quantity
FROM customer c INNER JOIN orderinfo o USING (customer_id)
INNER JOIN orderline ol USING (orderinfo_id)
INNER JOIN item i USING (item_id)
WHERE c.town IN ('bingham', 'nicetown')

fetch customers that has an 's' on their last name, their  orders and their items

SELECT c.lname, o.orderinfo_id, o.date_placed, i.description, ol.quantity
FROM customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id
INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id
WHERE c.lname LIKE '%s%'

add new customers
INSERT INTO customer (customer_id, lname, fname, title, addressline, town, zipcode, phone) 
VALUES (16, 'dave', 'grohl', 'mr', 'tenement', 'taguig', 4108, '0989999')

INSERT INTO customer (lname, fname, title, addressline, town, zipcode, phone) 
VALUES ('mike', 'jones', 'mister', 'upper blc', 'taguig', 4108, '01828238')

INSERT INTO customer (fname, title, addressline, town, zipcode, phone) 
VALUES ('jones', 'mister', 'upper blc', 'taguig', 4108, '01828238')

INSERT INTO customer (lname, fname, title, addressline, town, zipcode, phone) 
VALUES ('hammet', 'kirk', 'mister', NULL, 'taguig', 4108, '01828238')

INSERT INTO customer (lname, fname, title, addressline, town, zipcode, phone) 
VALUES ('mustaine', 'dave', 'ms', 'brgy town center', 'alabang', 4108, '999999'), ('layne', 'staley', 'mr', 'new york', 'cubao', 1305, '777777')

ADD NEW ORDERS

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES(22, '2026-04-30', '2026-04-30', 100)

INSERT INTO orderline (orderinfo_id, item_id, quantity) VALUES(22, 10, 2),(22, 11, 5)

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES('tt', '2026-04-30', '2026-04-30', 100)

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES(22, 'fdsfdsfdsfds', '2026-04-30', 100)

12345.67

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES(22, 'fdsfdsfdsfds', '2026-04-30', 999999.99)

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES(22, 'fdsfdsfdsfds', '2026-04-30', -67.89)

INSERT INTO item (description, cost_price, sell_price) VALUES('shoes', 100, 150)

INSERT INTO stock(item_id, quantity) VALUES(12, 100)

INSERT INTO orderinfo(orderinfo_id,customer_id, date_placed, date_shipped, shipping) VALUES(12, 22, now(), now(), 19)

UPDATE item SET sell_price = 150 
WHERE item_id = 10

increase selling price of items 1 - 5 by 10 pesos
UPDATE item SET sell_price = sell_price + 10
WHERE item_id BETWEEN 1 AND 5

UPDATE item SET  sell_price = cost_price + 10 ,cost_price = cost_price + 5

DELETE FROM customer WHERE customer_id = 19
DELETE FROM item WHERE item_id = 12

TRUNCATE item

DELETE c, o FROM  customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id
WHERE c.customer_id = 22



LOAD DATA LOCAL INFILE 'd:/itim130-1a-2026/item.csv' INTO TABLE item FIELDS TERMINATED BY ',' (description, cost_price, sell_price);

LOAD DATA LOCAL INFILE 'd:/itim130-1a-2026/cust.txt' INTO TABLE customer FIELDS TERMINATED BY ',' (title,lname,fname,addressline,town,phone,zipcode);

mysqlimport  --local -p --user=root --fields-terminated-by=, --columns=title,lname,fname,addressline,town,phone,zipcode db_1a  d:/itim130-1a-2026/customer.txt 

dates
SELECT month('2025-06-01')
SELECT monthname('2025-06-01')

SELECT orderinfo_id, monthname(date_placed) 
FROM orderinfo
WHERE date_placed BETWEEN '2000-09-01' AND '2000-09-30' 

SELECT orderinfo_id, monthname(date_placed) 
FROM orderinfo
WHERE month(date_placed) = 9 

SELECT orderinfo_id, monthname(date_placed) 
FROM orderinfo
WHERE monthname(date_placed) = 'september'

SELECT orderinfo_id, weekday(date_placed)
FROM orderinfo;

SELECT date_format(now(), '%a %D of %M %Y')

SELECT orderinfo_id, date_format(date_shipped, '%M %d, %Y') AS 'shipping date'
FROM orderinfo;

SELECT date_add(now(), INTERVAL 10 year)
SELECT date_add(now(), INTERVAL 5 MONTH)
SELECT monthname(date_add(now(), INTERVAL 5 MONTH))

