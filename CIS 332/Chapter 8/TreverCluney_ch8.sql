--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 8 Assignment
--======================================================

--Clean-up and Preperations--
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_8.sql";
spool output_file.txt REPLACE
spool output_file.txt APPEND
SET pagesize 50;

--Hands-On Assignment--
--1--
SELECT lastname, firstname, state
FROM CUSTOMERS
WHERE state = 'NJ';

--2--
SELECT order#, shipdate
FROM orders
WHERE shipdate > '01-apr-09';

--3--
SELECT title, category
FROM books
WHERE category != 'FITNESS';

--4--
SELECT customer#, lastname, state
FROM customers
WHERE state = 'GA'
OR state = 'NJ';

SELECT customer#, lastname, state
FROM customers
WHERE state IN ('GA','NJ');

--5--
SELECT order#, orderdate
FROM orders
WHERE orderdate <= '01-apr-09';

SELECT order#, orderdate
FROM orders
WHERE orderdate < '02-apr-09';

--6--
SELECT lname, fname
FROM author
WHERE lname LIKE '%IN%'
ORDER BY lname, fname;

--7--
SELECT lastname, firstname, referred
FROM customers
WHERE referred IS NOT NULL;

--8--
SELECT title, category
FROM books
WHERE category IN ('CHILDREN','COOKING');

SELECT title, category
FROM books
WHERE category = 'COOKING'
OR category = 'CHILDREN';

SELECT title, category
FROM books
WHERE category NOT IN ('FITNESS','FAMILY LIFE','COMPUTER','SELF HELP', 'BUSINESS','LITERATURE');

--9--
SELECT isbn, title
FROM books
WHERE title LIKE '_A_N%'
ORDER BY title DESC;

--10--
SELECT title, pubdate
FROM books
WHERE pubdate > '31-dec-04'
AND pubdate < '01-jan-06';

SELECT title, pubdate
FROM books
WHERE pubdate BETWEEN '31-dec-04' AND '01-jan-06';

SELECT title, pubdate
FROM books
WHERE pubdate LIKE '__-___-05';