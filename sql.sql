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
SELECT dayname(date_add(now(), INTERVAL 10 MONTH))

select date_format(date_add(now(), INTERVAL 24 HOUR), '%M %d, %Y %h:%i.%s %p')

SELECT date_add(now(), INTERVAL -20 YEAR)

SELECT dayname(date_add(now(), INTERVAL -10 MONTH))

SELECT date_add(now(), INTERVAL -100 YEAR)

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES(22, now(), date_add(now(), INTERVAL 3 DAY), 100)

regex
Select lname from customer where binary lname REGEXP "^S.*";

Select lname from customer where binary lname REGEXP ".*on.*";
Select lname from customer where binary lname REGEXP ".*[on].*";
Select lname from customer where binary lname REGEXP "^[SJ]";

Select strcmp('foo', 'foo');
Select strcmp('foo', 'FOO');
Select strcmp('foo', binary 'FOO');
Select strcmp('foo', 'bar');
Select ceiling(2.4), floor(2.4),round(2.67)
Select description, MID(description,2,6), 
UPPER(description) 
FROM item where item_id = 6;

Select ASCII('A'),
Char(65,66,67),
Concat('hello',0x20,0x57, 'orld');

CREATE TABLE testcolcons (
Colnotnull INT NOT NULL,
Colprikey INT NOT NULL PRIMARY KEY,
Coldefault INT DEFAULT 42);

INSERT INTO testcolcons(colnotnull, colprikey,coldefault)
	values(1,1,1);
INSERT INTO testcolcons(colnotnull, colprikey,coldefault)
	values(2,2,NULL);
INSERT INTO testcolcons(colnotnull, colprikey,coldefault)
	values(NULL,3,NULL);
INSERT INTO testcolcons(colnotnull, colprikey,coldefault)
	values(3,2,NULL);
INSERT INTO testcolcons(colnotnull, colprikey,coldefault)
	values(3,3);
    INSERT INTO testcolcons(colnotnull, colprikey)
	values(3,3);
Select * from testcolcons;
UPDATE testcolcons SET colprikey = 2 where colnotnul=3;

Create table ttconst (
	mykey1 INT,
    mykey2 INT NOT NULL, 
    mystring varchar(15) NOT NULL, 
    CONSTRAINT cs1 UNIQUE(mykey1),
    CONSTRAINT cs2 PRIMARY KEY(mykey2,mystring));

Insert into ttconst values(1,2, 'Amy Jones');
Insert into ttconst values(1,2, 'Dave jones');
Insert into ttconst values(2,2, 'Dave jones');
Insert into ttconst values(3,2, 'Amy Jones');

CREATE TABLE c2 select fname,lname,zipcode FROM customer
	WHERE (town='bingham') OR (town = 'Nicetown');

ALTER TABLE c2 ADD COLUMN last_contact date AFTER zipcode;
ALTER TABLE c2 CHANGE COLUMN zipcode zipcode2 char(15);
DESCRIBE c2;
SELECT * FROM c2;
ALTER TABLE c2 CHANGE COLUMN fname fname char(32) NOT NULL ;
ALTER TABLE c2 ADD PRIMARY KEY(fname,lname);
ALTER TABLE c2 DROP PRIMARY KEY;

INSERT INTO c2(fname,lname,zipcode2) VALUES('ann', 'stones','4444');

CREATE TABLE orderinfo (
    orderinfo_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,customer_id INT NOT NULL, 
    date_placed date NOT NULL,
    date_shipped date,
    shipping numeric(7,2),
    status enum('processing', 'delivered', 'canceled') NOT NULL DEFAULT 'processing',
    INDEX(customer_id),
    CONSTRAINT fk_orderinfo_customer FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
); 

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping, status) VALUES(21, now(), now(), 100, 'processing')

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping, status) VALUES(1, now(), now(), 100, 'processing')

DELETE FROM orderinfo WHERE customer_id = 21;
DELETE FROM customer WHERE customer_id = 21; 

CREATE TABLE orderline( 
    orderinfo_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(orderinfo_id, item_id),
    INDEX(item_id),
    CONSTRAINT orderline_item_fk
    FOREIGN KEY (item_id)
    REFERENCES item(item_id),
    INDEX(orderinfo_id),
    CONSTRAINT orderline_orderinfo_fk
    FOREIGN KEY(orderinfo_id)
    REFERENCES orderinfo(orderinfo_id)
    );

INSERT INTO orderline(orderinfo_id, item_id, quantity)
VALUES(3,27,5),(3,28,5),(3,29,5)
INSERT INTO orderline(orderinfo_id, item_id, quantity)
VALUES(4,27,5)
INSERT INTO orderline(orderinfo_id, item_id, quantity)
VALUES(3,30,5)

User Administration
Create new users using CREATE USER statement
CREATE USER user IDENTIFIED BY password

CREATE USER 'dbadmin1'@'localhost' IDENTIFIED BY 'p@ssw0rd';

allow user to connect from any host you use the % wildcard, which means any host.
CREATE USER superadmin9000@'%'
IDENTIFIED BY 'p@ssw0rd';

MySQL Changing Password for Accounts
USE mysql;
 
ALTER USER dbadmin1@'localhost' IDENTIFIED BY 'p@ssw0rd1234';
ALTER USER root@localhost IDENTIFIED BY 'your password';
 ALTER USER itim130s@localhost IDENTIFIED BY 'p@ssw0rd';
FLUSH PRIVILEGES; 

FLUSH PRIVILEGES statement to reload privileges from the grant table in the mysql database.

MySQL GRANT Statement Syntax
GRANT privileges (column_list)
ON [object_type] privilege_level
TO account [IDENTIFIED BY 'password']
 
GRANT ALL ON db_1a.* TO 'dbadmin1'@'localhost';
GRANT ALL ON db_1a.* to 'itim130s'@'localhost';

GRANT ALL ON db_1a.* to itim130s1a@'%' IDENTIFIED BY 'password';

GRANT SELECT(fname,lname,phone)  ON db_1a.customer TO 'user500'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;


GRANT SELECT, UPDATE, DELETE  ON db_1a.item to 'user500'@'localhost' 
SHOW GRANTS FOR user4;

GRANT SELECT ON <database name>.<view name> TO <user>@<host> IDENTIFIED BY '<password>

GRANT EXECUTE ON <database name>.<procedure name> TO <user>@<host> IDENTIFIED BY '<password>'

SHOW GRANTS FOR 'root';
REVOKE DELETE ON db_1a.item from user500@localhost;
FLUSH PRIVILEGES;

mysql backup /restore using mysqldump
mysqldump -u [username] -p[password] [database_name,db2,db3...] > /path/to/[dump_file.sql]
mysql -u [uname] -p[pass] [db_to_restore] < [backupfile.sql]

mysqldump -uroot -p db_1a > d:/itim130-1a-2026/db_1a_20260507.sql

mysql -uroot -p db_1a < d:/itim130-1a-2026/db_1a_20260507.sql