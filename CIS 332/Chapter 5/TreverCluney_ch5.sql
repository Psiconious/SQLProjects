--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 5 Assignment
--======================================================

--Clean-up and Preperations--
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_5.sql";

--Hands-On Assignments--
--1--
INSERT INTO orders (order#, customer#, orderdate)
VALUES (1021,1009,'20-JUL-09');

--Verification--
SELECT order#,customer#,orderdate FROM orders
WHERE order# = 1021;

--2--
UPDATE orders
SET shipzip = 33222
WHERE order# = 1017;

--Verification--
SELECT shipzip
FROM orders
WHERE order# = 1017;

--3--
COMMIT WORK;

--6--
UPDATE books
SET cost = '&cost'
WHERE isbn = '&isbn';

--Verification--
SELECT cost
FROM books
WHERE isbn = '&isbn';

--9--
DELETE FROM orderitems 
WHERE order# = 1005;

DELETE FROM orders
WHERE order# = 1005;

--Verification--
SELECT order#
FROM orders
WHERE order# = 1005;

SELECT order#
FROM orderitems
WHERE order# = 1005;

--10--
ROLLBACK;

--Verification--
SELECT order#
FROM orders
WHERE order# = 1005;

SELECT order#
FROM orderitems
WHERE order# = 1005;
