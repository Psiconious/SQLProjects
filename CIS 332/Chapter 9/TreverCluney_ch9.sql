--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 9 Assignment
--======================================================

--Clean-up and Preperations--
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_8.sql";
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_9.sql";

--Hands-On Assignments--
--1--
SELECT b.title, p.contact, p.phone
FROM books b, publisher p
WHERE b.pubid = p.pubid;

SELECT b.title, p.contact, p.phone
FROM books b JOIN publisher p USING (pubid);

--2--
SELECT c.firstname, c.lastname, o.orderdate, o.shipdate
FROM customers c, orders o
WHERE c.customer# = o.customer#
AND o.shipdate IS NULL
ORDER BY o.orderdate;

SELECT c.firstname, c.lastname, o.orderdate, o.shipdate
FROM customers c JOIN orders o USING (customer#)
WHERE o.shipdate IS NULL
ORDER BY o.orderdate;

--4--
SELECT DISTINCT b.title
FROM orders o, orderitems oi, books b, customers c
WHERE c.customer# = o.customer#
AND o.order# = oi.order#
AND oi.isbn = b.isbn
AND c.firstname = 'JAKE'
AND c.lastname = 'LUCAS';

SELECT DISTINCT b.title
FROM customers c JOIN orders o USING (customer#)
JOIN orderitems oi USING (order#)
JOIN books b USING (isbn)
WHERE c.lastname = 'LUCAS'
AND c.firstname = 'JAKE';

--10--
SELECT e.fname || ' ' || e.lname AS "Employee Name", e.job "Job Title", m.fname || ' ' || m.lname AS "Manager Name"
FROM employees e, employees m
WHERE e.mgr = m.empno(+)
ORDER BY 3;

SELECT e.fname || ' ' || e.lname AS "Employee Name", e.job "Job Title", m.fname || ' ' || m.lname AS "Manager Name"
FROM employees e LEFT OUTER JOIN employees m ON e.mgr = m.empno
ORDER BY 3;
