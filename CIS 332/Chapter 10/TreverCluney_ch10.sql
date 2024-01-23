--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 10 Assignment
--======================================================

--Clean-up and Preperations--
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_8.sql";
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_10.sql";

--1--
SELECT INITCAP(firstname) || ' ' || INITCAP(lastname) "Customer Name"
FROM customers;

--2--
SELECT firstname || ' ' || lastname "Customer", NVL2(referred,'Referred','Not Referred') "Referred"
FROM customers;

--3--
SELECT b.title, TO_CHAR(NVL2(NULLIF(oi.paideach,b.retail),(oi.quantity*(oi.paideach-b.cost)),(oi.quantity*(b.retail-b.cost))), '$999.99') "Profit"
FROM orders o JOIN orderitems oi USING (order#)
JOIN books b USING (isbn)
WHERE order# = 1002;

--4--
SELECT b.title,CONCAT(TRUNC((b.cost/b.retail)*100,0),'%') "Markup"
FROM books b;

--5--
SELECT TO_CHAR(SYSDATE,'DAY, HH, MI, SS') "SYSTEM DATE/TIME"
FROM DUAL;

--6--
SELECT title, LPAD(cost,12,'*')"Price"
FROM books;

--7--
SELECT DISTINCT LENGTH(isbn)"ISBN Length"
FROM books;

--8--
SELECT title, pubdate "Publish Date", SYSDATE "Today's Date", TRUNC(MONTHS_BETWEEN(SYSDATE,pubdate),0)"MONTHS Since Publish"
FROM books;

--9--
SELECT NEXT_DAY(SYSDATE, 'WEDNESDAY')"Next Wednesday"
FROM DUAL;

--10--
SELECT firstname, lastname, SUBSTR(zip,-3,2) "Last 2 of Zip", INSTR(customer#,'3')"3 in Cust#"
FROM customers;