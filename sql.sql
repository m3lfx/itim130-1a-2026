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
    REFERENCES item(item_id)
    ON DELETE CASCADE,
    INDEX(orderinfo_id),
    CONSTRAINT orderline_orderinfo_fk
    FOREIGN KEY(orderinfo_id)
    REFERENCES orderinfo(orderinfo_id)
    ON DELETE CASCADE
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

cascade delete

ALTER TABLE orderinfo DROP FOREIGN KEY fk_orderinfo_customer;
ALTER TABLE orderinfo
ADD CONSTRAINT fk_customer 
FOREIGN KEY (customer_id) 
REFERENCES customer(customer_id) 
ON DELETE CASCADE;

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES( 2, now(), now(), 19);
INSERT INTO orderline(orderinfo_id, item_id, quantity)
VALUES(8,1,9),(8,2,2),(8,3,7)

aggregate functions 

get the total number of customers
SELECT count(*) FROM customer;

count the number of customers living in bingham
 select count(*) as total, town from customer where town = 'bingham';

count the number of customer per town
SELECT count(town), town
FROM customer
GROUP BY town


get the total number of products sold
SELECT sum(quantity) from orderline;

get the total items bought by customers from bingham
INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES( 7, now(), now(), 19);
INSERT INTO orderline(orderinfo_id, item_id, quantity)
VALUES(9,1,9),(9,5,2),(9,4,7);

SELECT sum(ol.quantity) as `total items sold`, c.town 
FROM customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id 
WHERE c.town = 'bingham'

how many items were in order number 7
SELECT sum(quantity), orderinfo_id
FROM orderline
WHERE orderinfo_id = 7


get the total items for each order
SELECT sum(quantity), orderinfo_id
FROM orderline
GROUP BY orderinfo_id

fetch all items and their total quantity sold.
SELECT sum(ol.quantity), i.description 
FROM item i INNER JOIN orderline ol ON i.item_id = ol.item_id
WHERE i.description = 'katol'
GROUP BY i.description

TOP 5 popular products
SELECT sum(ol.quantity) as total, i.description 
FROM item i INNER JOIN orderline ol ON i.item_id = ol.item_id
GROUP BY i.description
ORDER BY total DESC
LIMIT 5

SELECT avg(quantity)
from orderline

SELECT max(sell_price)
from item

SELECT min(sell_price)
from item

get the total amount paid for order number 7
SELECT  sum(i.sell_price * ol.quantity) AS `total income`
FROM item i INNER JOIN orderline ol ON i.item_id = ol.item_id
WHERE ol.orderinfo_id = 7

get the income of the shop
SELECT  sum(i.sell_price * ol.quantity) AS `total income`
FROM item i INNER JOIN orderline ol ON i.item_id = ol.item_id

get the total for each order
SELECT  sum(i.sell_price * ol.quantity) AS `total income`, ol.orderinfo_id
FROM item i INNER JOIN orderline ol ON i.item_id = ol.item_id
GROUP BY ol.orderinfo_id

what is the income for the month of may
SELECT sum(i.sell_price * ol.quantity), monthname(o.date_placed) 
FROM orderinfo o INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id
WHERE monthname(o.date_placed) = 'may'

get the monthly income
SELECT sum(i.sell_price * ol.quantity), monthname(o.date_placed) 
FROM orderinfo o INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id
GROUP BY monthname(o.date_placed)

INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES( 3, '2026-06-05', '2026-06-05', 19);
INSERT INTO orderline(orderinfo_id, item_id, quantity)
VALUES(10,2,9),(10,3,2),(10,4,7);

how much did each town spent.
SELECT sum(i.sell_price * ol.quantity) as total, c.town
FROM customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id
INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id
GROUP BY c.town
ORDER BY total DESC


top 3 biggest spenders
SELECT sum(i.sell_price * ol.quantity) as total, c.customer_id, upper(concat(c.fname, " ", c.lname)) AS `full name`
FROM customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id
INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id

GROUP BY c.customer_id
ORDER BY total DESC
LIMIT 3

FETCH customers that spent 500 pesos and above.
SELECT sum(i.sell_price * ol.quantity) as total, c.customer_id, upper(concat(c.fname, " ", c.lname)) AS `full name`
FROM customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id
INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id
GROUP BY c.customer_id
HAVING total > 500
ORDER BY total DESC

how much did each product earned
SELECT sum(i.sell_price * ol.quantity) as `total for each product`, i.description 
FROM item i INNER JOIN orderline ol ON i.item_id = ol.item_id
GROUP BY i.description
ORDER BY `total for each product` DESC


top 3 earning products 
ELECT sum(i.sell_price * ol.quantity) as `total for each product`, i.description 
FROM item i INNER JOIN orderline ol ON i.item_id = ol.item_id
GROUP BY i.description
ORDER BY `total for each product` DESC
LIMIT 3



INSERT INTO orderinfo(customer_id, date_placed, date_shipped, shipping) VALUES( 1, '2026-06-05', '2026-06-05', 19);
INSERT INTO orderline(orderinfo_id, item_id, quantity)
VALUES(11,2,9),(11,3,2),(11,4,7);

LEFT JOIN 
fetch all customer(including customers with no orders) and their orders.
SELECT o.orderinfo_id, c.lname, c.fname, o.date_placed, ol.item_id, ol.quantity, i.description
FROM customer c LEFT JOIN orderinfo o ON c.customer_id = o.customer_id LEFT JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id LEFT JOIN item i ON i.item_id = ol.item_id
WHERE i.description IS  NULL



SELECT o.orderinfo_id, c.lname, c.fname, o.date_placed
FROM customer c LEFT JOIN orderinfo o ON c.customer_id = o.customer_id 


SELECT o.orderinfo_id, c.lname, c.fname, o.date_placed, ol.item_id, ol.quantity
FROM customer c LEFT JOIN orderinfo o ON c.customer_id = o.customer_id INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id

RIGHT JOIN
SELECT o.orderinfo_id, c.lname, c.fname, o.date_placed
FROM customer c RIGHT JOIN orderinfo o ON c.customer_id = o.customer_id

Imports MySql.Data.MySqlClient

Public Class Form1
    Dim conn As MySqlConnection = New MySqlConnection("Data Source=localhost;Database=itim130ns;User=root;Password=")
    'Public dbconn As New MySqlConnection
    Public sql As String
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader
    Public DataAdapter1 As MySqlDataAdapter
    Public ds As DataSet
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load, Button5.Click
        Try
            conn.Open()
            sql = "SELECT * FROM customers ORDER BY customer_id DESC"

            DataAdapter1 = New MySqlDataAdapter(sql, conn)
            ds = New DataSet()
            DataAdapter1.Fill(ds, "customers")
            DataGridView1.DataSource = ds
            DataGridView1.DataMember = "customers"


        Catch ex As Exception
            MsgBox("Error in collecting data from Database. Error is :" & ex.Message)

        End Try
        conn.Close()

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim customer_id As Integer

        Try
            conn.Open()
            customer_id = Val(TextBox1.Text)
            sql = "SELECT * FROM customers WHERE customer_id = " & customer_id
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader()
            dbread.Read()

            TextBox2.Text = dbread("first_name")
            TextBox3.Text = dbread("last_name")
            TextBox4.Text = dbread("address")
            TextBox5.Text = dbread("city")
            TextBox6.Text = dbread("phone")
            TextBox7.Text = dbread("zipcode2")

        Catch ex As MysqlException
            MsgBox(ex.Message)
        End Try
        conn.Close()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        Dim firstName = TextBox2.Text
        Dim lastName = TextBox3.Text
        Dim address = TextBox4.Text
        Dim city = TextBox5.Text
        Dim zip = TextBox6.Text
        Dim phone = TextBox7.Text
        Try
            conn.Open()
            sql = $"INSERT INTO customers (first_name, last_name, address, city, phone, zipcode2) VALUES('{firstName}', '{lastName}', '{address}', '{city}', '{phone}', '{zip}')"
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)
            Dim i As Integer = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("record saved")
            Else
                MsgBox("record not saved")

            End If

        Catch ex As MySqlException
            MsgBox(ex.Message)
        End Try
        conn.Close()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim customerId = Val(TextBox1.Text)
        Dim firstName = TextBox2.Text
        Dim lastName = TextBox3.Text
        Dim address = TextBox4.Text
        Dim city = TextBox5.Text
        Dim zip = TextBox6.Text
        Dim phone = TextBox7.Text
        Try
            conn.Open()
            sql = $"UPDATE customers SET first_name = '{firstName}', last_name = '{lastName}', address = '{address}', city = '{city}', phone = '{phone}', zipcode2 = '{zip}' WHERE customer_id = {customerId}"
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)
            Dim i As Integer = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("record saved")
            Else
                MsgBox("record not saved")

            End If

        Catch ex As MySqlException
            MsgBox(ex.Message)
        End Try
        conn.Close()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Try
            conn.Open()
            Dim id As Integer = InputBox("enter customer id to be deleted", "delete record")
            Dim ans = MessageBox.Show("do you want to delete this record?", "record deleted", MessageBoxButtons.YesNoCancel)
            If ans = DialogResult.Yes Then
                sql = $"DELETE FROM customers WHERE customer_id = {id}"
                dbcomm = New MySqlCommand(sql, conn)
                Dim i As Integer = dbcomm.ExecuteNonQuery

                If (i > 0) Then
                    MsgBox("record deleted")
                Else
                    MsgBox("record not deleted")

                End If
            End If
        Catch ex As MySqlException
            MsgBox(ex.Message)
        End Try
        conn.Close()
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Form2.Show()
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Form3.Show()

    End Sub

    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        Form5.Show()

    End Sub

    Private Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
        Form4.Show()

    End Sub
End Class

Imports MySql.Data.MySqlClient
Public Class Form2
    Dim conn As MySqlConnection = New MySqlConnection("Data Source=localhost;Database=itim130ns;User=root;Password=;")
    'Public dbconn As New MySqlConnection
    Public sql As String
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader
    Public DataAdapter1 As MySqlDataAdapter
    Public ds As DataSet
    Private Sub Form2_Load(sender As Object, e As EventArgs) Handles MyBase.Load, Button3.Click
        Try
            conn.Open()
            'sql = "SELECT * FROM items ORDER BY item_id DESC"
            sql = "SELECT i.item_id as 'item id', i.name AS 'product name', i.cost_price AS cost, i.sell_price AS 'selling price', s.quantity, i.supplier_name as supplier FROM items i INNER JOIN stocks s ON (i.item_id = s.item_id) 
ORDER BY i.item_id DESC"

            DataAdapter1 = New MySqlDataAdapter(sql, conn)
            ds = New DataSet()
            DataAdapter1.Fill(ds, "items")
            DataGridView1.DataSource = ds
            DataGridView1.DataMember = "items"

            dbcomm = New MySqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader()

            While dbread.Read()
                ComboBox1.Items.Add(dbread("item id"))

            End While


        Catch ex As Exception
            MsgBox("Error in collecting data from Database. Error is :" & ex.Message)

        End Try
        conn.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            conn.Open()
            TextBox1.Text.Trim()

            sql = $"INSERT INTO items (name, cost_price, sell_price, supplier_name) VALUES('{TextBox1.Text.Trim()}', {Convert.ToDecimal(TextBox2.Text)}, {Convert.ToDecimal(TextBox3.Text)}, '{TextBox4.Text}')"
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)
            Dim i As Integer = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("record saved")
            Else
                MsgBox("record not saved")

            End If

            sql = $"INSERT INTO stocks (item_id, quantity) VALUES(LAST_INSERT_ID(), {Val(NumericUpDown1.Value)} )"
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)
            i = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("record saved")
            Else
                MsgBox("record not saved")

            End If

        Catch ex As MySqlException
            MsgBox(ex.Message)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        conn.Close()

    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged
        Try
            conn.Open()
            sql = $"SELECT i.item_id as 'item id', i.name AS 'product name', i.cost_price AS cost, i.sell_price AS 'selling price', s.quantity, i.supplier_name FROM items i INNER JOIN stocks s ON (i.item_id = s.item_id) WHERE i.item_id = {Val(ComboBox1.Text)}"

            dbcomm = New MySqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader()
            dbread.Read()

            TextBox1.Text = dbread("product name")
            TextBox2.Text = dbread("cost")
            TextBox3.Text = dbread("selling price")
            TextBox4.Text = dbread("supplier_name")
            NumericUpDown1.Value = dbread("quantity")


        Catch ex As MySqlException
            MsgBox(ex.Message)
        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
        conn.Close()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Try
            conn.Open()
            sql = $"UPDATE items SET name = '{TextBox1.Text}', cost_price = {Convert.ToDecimal(TextBox2.Text)}, sell_price = {Convert.ToDecimal(TextBox3.Text) }, supplier_name = '{TextBox4.Text}' WHERE item_id = {Val(ComboBox1.SelectedItem)}"
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)
            Dim i As Integer = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("record saved")
            Else
                MsgBox("record not saved")

            End If

            sql = $"UPDATE stocks SET quantity = {Val(NumericUpDown1.Value)} WHERE item_id = {Val(ComboBox1.SelectedItem)}"
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)
            i = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("record saved")
            Else
                MsgBox("record not saved")

            End If

        Catch ex As MySqlException
            MsgBox(ex.Message)
        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
        conn.Close()

    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Try
            conn.Open()
            sql = $"DELETE FROM stocks WHERE item_id = {Val(ComboBox1.SelectedItem)}"
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)
            Dim i As Integer = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("stock deleted")
            Else
                MsgBox("stock not deleted")

            End If

            sql = $"DELETE FROM orderline WHERE item_id = {Val(ComboBox1.SelectedItem)}"
            dbcomm = New MySqlCommand(sql, conn)
            i = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("item orderline deleted")
            Else
                MsgBox("item orderline deleted")

            End If

            sql = $"DELETE FROM items WHERE item_id = {Val(ComboBox1.SelectedItem)}"
            dbcomm = New MySqlCommand(sql, conn)
            i = dbcomm.ExecuteNonQuery

            If (i > 0) Then
                MsgBox("item deleted")
            Else
                MsgBox("item not deleted")

            End If
            TextBox1.Clear()
            TextBox2.Clear()
            TextBox3.Clear()
            TextBox4.Clear()
            NumericUpDown1.Value = 0



        Catch ex As MySqlException
            MsgBox(ex.Message)
        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
        conn.Close()

    End Sub

    Private Sub TextBox5_TextChanged(sender As Object, e As EventArgs) Handles TextBox5.TextChanged
        Try
            conn.Open()
            'sql = "SELECT * FROM items ORDER BY item_id DESC"
            sql = $"SELECT i.item_id as 'item id', i.name AS 'product name', i.cost_price AS cost, i.sell_price AS 'selling price', s.quantity, i.supplier_name as supplier FROM items i INNER JOIN stocks s ON (i.item_id = s.item_id) WHERE i.name LIKE '%{TextBox5.Text}%' ORDER BY i.item_id DESC"

            DataAdapter1 = New MySqlDataAdapter(sql, conn)
            ds = New DataSet()
            DataAdapter1.Fill(ds, "items search")
            DataGridView1.DataSource = ds
            DataGridView1.DataMember = "items search"

        Catch ex As MySqlException
            MsgBox("Error in collecting data from Database. Error is :" & ex.Message)
        Catch ex As Exception
            MsgBox("Error in collecting data from Database. Error is :" & ex.Message)

        End Try
        conn.Close()
    End Sub
End Class

Imports MySql.Data.MySqlClient
Public Class Form3
    Dim conn As MySqlConnection = New MySqlConnection("Data Source=localhost;Database=db_sample1b;User=root;Password=")
    Public sql As String
    Public dbcomm As MySqlCommand
    Public dbread As MySqlDataReader
    Public DataAdapter1 As MySqlDataAdapter
    Public ds As DataSet
    Private Sub Form3_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim id As Integer = Val(Form1.TextBox1.Text)
        cbocid.SelectedText = id
        Try
            conn.Open()
            sql = "SELECT customer_id FROM customer"
            dbcomm = New MySqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader()


            While dbread.Read()
                cbocid.Items.Add(dbread("customer_id"))

            End While
        Catch ex As MySqlException
            MsgBox(ex.Message)
            conn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            conn.Close()
        End Try
        dbread.Close()

        Try
            sql = "SELECT * FROM item i INNER JOIN stock s ON i.item_id = s.item_id"
            'sql = "SELECT * FROM item"
            dbcomm = New MySqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader()
            While dbread.Read()
                cboitemid.Items.Add(dbread("item_id"))
            End While
        Catch ex As MySqlException
            MsgBox(ex.Message)
            conn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            conn.Close()

        End Try
        dbread.Close()
        conn.Close()
    End Sub

    Private Sub cboitemid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboitemid.SelectedIndexChanged
        txtDescription.Clear()
        txtSellPrice.Clear()
        txtQty.Clear()

        'Dim itemId As Integer = Val(cboitemid.SelectedItem)
        Try
            conn.Open()
            sql = $"SELECT i.description, i.sell_price, s.quantity FROM item i INNER JOIN stock s ON i.item_id = s.item_id WHERE i.item_id = {Val(cboitemid.SelectedItem)}"
            dbcomm = New MySqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader()
            dbread.Read()
            txtDescription.Text = dbread("description")
            txtSellPrice.Text = dbread("sell_price")
            txtQty.Text = Val(dbread("quantity"))
        Catch ex As MySqlException
            MsgBox(ex.Message)
            conn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            conn.Close()

        End Try
        dbread.Close()
        conn.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        DataGridView1.Rows.Add(Val(cboitemid.SelectedItem), txtDescription.Text, Convert.ToDecimal(txtSellPrice.Text), Val(txtQty.Text))
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        DataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect
        If DataGridView1.SelectedRows.Count > 0 Then
            'you may want to add a confirmation message, and if the user confirms delete
            DataGridView1.Rows.Remove(DataGridView1.SelectedRows(0))
        Else
            MessageBox.Show("Select 1 row before you hit Delete")
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim total As Decimal = 0.0

        For Each row As DataGridViewRow In DataGridView1.Rows
            total += (row.Cells("sell_price").Value * row.Cells("quantity").Value)

        Next
        Label1.Text = total
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim i As Integer = 0
        Dim customerId As Integer = Val(cbocid.Text)
        'Dim myTrans As MySqlTransaction


        Try
            conn.Open()
            'myTrans = conn.BeginTransaction()

            sql = $"INSERT INTO orderinfo (customer_id, date_placed, date_shipped, status) VALUES({customerId}, now(), '{Convert.ToDateTime(DateTimePicker1.Value).ToString("yyyy-MM-dd")}', {Val(txtShip.Text)} )"
            Label1.Text = sql
            dbcomm = New MySqlCommand(sql, conn)

            i = dbcomm.ExecuteNonQuery
            If (i > 0) Then
                MsgBox("record saved")
            Else
                MsgBox("record not saved")

            End If

            For Each row As DataGridViewRow In DataGridView1.Rows
                sql = $"INSERT INTO orderline (orderinfo_id, item_id, quantity) VALUES(last_insert_id(), {val(row.Cells("item_id").Value}), {val(row.Cells("quantity").Value)})"
                Label1.Text = sql
                dbcomm = New MySqlCommand(sql, conn)
                i = dbcomm.ExecuteNonQuery
                If (i > 0) Then
                    MsgBox("record saved")
                Else
                    MsgBox("record not saved")

                End If
                sql = $"UPDATE stock SET quantity = quantity - {Val(row.Cells("quantity").Value)} WHERE item_id = {Val(row.Cells("item_id").Value)}"
                dbcomm = New MySqlCommand(sql, conn)
                i = dbcomm.ExecuteNonQuery
                If (i > 0) Then
                    MsgBox("record saved")
                Else
                    MsgBox("record not saved")

                End If
            Next
            'myTrans.Commit()

        Catch ex As MySqlException
            MsgBox(ex.Message)
            'myTrans.Rollback()

            conn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
            'myTrans.Rollback()

            conn.Close()
        End Try
        conn.Close()
    End Sub
End Class

fetch all customers and orders and compute total

SELECT o.orderinfo_id, concat(c.fname, " ", c.lname) AS name, concat(c.addressline, " ", c.town, " ", c.zipcode) AS address, sum(i.sell_price * ol.quantity) as total, o.status
FROM customer c INNER JOIN orderinfo o ON c.customer_id = o.customer_id
INNER JOIN orderline ol ON o.orderinfo_id = ol.orderinfo_id
INNER JOIN item i ON i.item_id = ol.item_id
GROUP BY ol.orderinfo_id
WHERE o.status='processing'

Private Sub DataGridView1_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        cboStatus.SelectedText = ""
        DataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect
        If e.RowIndex >= 0 Then
            Dim selectedRow As DataGridViewRow = DataGridView1.Rows(e.RowIndex)

            ' Use column index or name to retrieve values
            txtOrderId.Text = selectedRow.Cells("orderinfo_id").Value.ToString()
            txtName.Text = selectedRow.Cells("name").Value.ToString() ' Using index
            Label1.Text = selectedRow.Cells("total").Value.ToString()



            cboStatus.SelectedText = selectedRow.Cells("status").Value.ToString()
        End If
    End Sub



