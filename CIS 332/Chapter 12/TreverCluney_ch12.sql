--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 12 Assignment
--======================================================

START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_8.sql";
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_12.sql";

--1--
SELECT title, retail
FROM books
WHERE retail < (SELECT AVG(retail)
                FROM books);

--2--
SELECT title, retail
FROM books b, (SELECT category, AVG(retail)AS AVGretail
                FROM books
                GROUP BY category) cb
WHERE b.retail < cb.avgretail
AND b.category = cb.category;

--3--
SELECT * 
FROM orders
WHERE shipstate = (SELECT shipstate
                FROM orders
                WHERE order# = 1014);

--4--
SELECT order#, (quantity*paideach)"Amount Paid"
FROM orderitems
WHERE (quantity*paideach) > (SELECT quantity*paideach
                                FROM orderitems JOIN orders USING (order#)
                                WHERE customer# = 1008);

--5--
SELECT lname, fname, title, nm.amount "Times ordered"
FROM author JOIN bookauthor USING (authorid)
JOIN books USING (isbn)
JOIN (SELECT isbn, COUNT(isbn) AS amount
FROM orderitems
GROUP BY isbn) nm USING (isbn)
WHERE isbn in(SELECT isbn
FROM books b JOIN (SELECT isbn, COUNT(isbn) AS amount
FROM orderitems
GROUP BY isbn) nm USING (isbn)
)
ORDER BY nm.amount DESC;

--6--
SELECT title
FROM BOOKS
WHERE category IN (SELECT DISTINCT category
                  FROM books b JOIN orderitems oi USING (isbn)
                  JOIN orders o USING (order#)
                  WHERE customer# = 1007)
AND title NOT IN (SELECT DISTINCT title
                  FROM books b JOIN orderitems oi USING (isbn)
                  JOIN orders o USING (order#)
                  WHERE customer# = 1007);

--7--
SELECT *
FROM orders
WHERE (shipdate-orderdate) = (SELECT MAX(shipdate-orderdate)
                              FROM orders);

--8--
SELECT firstname, lastname, isbn, title, order#, retail
FROM customers c JOIN orders o USING(customer#)
JOIN orderitems oi USING (order#)
JOIN books b USING (isbn)
WHERE b.retail =(SELECT MIN(retail)
                 FROM books);

--9--
SELECT DISTINCT firstname|| ' '|| lastname "customer"
FROM customers JOIN orders USING (customer#)
JOIN orderitems USING (order#)
JOIN books USING (isbn)
WHERE title IN (SELECT title
                FROM author JOIN bookauthor USING (authorid)
                JOIN books USING (isbn)
                WHERE fname = 'JAMES'
                AND lname = 'AUSTIN');

--10--
SELECT *
FROM publisher
WHERE pubid = (SELECT pubid
                FROM books
                where title = 'THE WOK WAY TO COOK');