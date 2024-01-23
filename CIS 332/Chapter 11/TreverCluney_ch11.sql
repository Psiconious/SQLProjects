--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 11 Assignment
--======================================================

START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_8.sql";
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_11.sql";

--1--
SELECT COUNT(category)"# of cookbooks"
FROM BOOKS
WHERE category = 'COOKING';

--2--
SELECT COUNT(retail) "# of books > 30$"
FROM BOOKS
WHERE retail > 30;

--3--
SELECT MAX(pubdate)"Recent Release"
FROM books;

--5--
SELECT MIN(retail) "Cheapest Computer Book"
FROM books
WHERE category = 'COMPUTER';

--6--
SELECT TO_CHAR(AVG(SUM(oi.quantity * (oi.paideach-b.cost))), '$999.99')"Average order profit"
FROM orderitems oi JOIN books b USING (isbn)
GROUP BY order#;

--7--
SELECT customer#,COUNT(order#)"Orders placed"
FROM orders
GROUP BY customer#;

--8--
SELECT p.name, DECODE(GROUPING(b.category),1,'Pub AVG', b.category) category, TO_CHAR(AVG(b.retail),'$999.99') "AVG Retail" 
FROM books b JOIN publisher p USING(pubid)
WHERE b.category IN ('CHILDREN','COMPUTER')
GROUP BY p.name,ROLLUP(b.category)
HAVING AVG(b.retail) > 50
ORDER BY p.name, b.category;

--9--
SELECT firstname|| ' ' || lastname "Customer",state, TO_CHAR(SUM(oi.quantity*oi.paideach), '$999.99')"Order total"
FROM customers c JOIN orders o USING(customer#)
JOIN orderitems oi USING (order#)
WHERE c.state IN ('GA','FL')
GROUP BY firstname|| ' ' || lastname, state
HAVING SUM(oi.quantity*oi.paideach) > 80;