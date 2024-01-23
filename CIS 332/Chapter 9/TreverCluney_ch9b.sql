--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 9 Assignment
--======================================================

--Clean-up and Preperations--
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_8.sql";
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_9.sql";

--Hands-On Assignments--
--3--
SELECT c.firstname, c.lastname, b.title, c.state, b.category
FROM customers c, orders o, orderitems oi, books b
WHERE c.customer# = o.customer#
AND o.order# = oi.order#
AND oi.isbn = b.isbn
AND c.state = 'FL'
AND b.category = 'COMPUTER';

--7--
SELECT *
FROM books b, promotion p
WHERE b.retail BETWEEN p.minretail AND p.maxretail
AND b.title = 'SHORTEST POEMS';

--9--
SELECT b.title, oi.order#, c.state
FROM books b, orderitems oi, orders o, customers c 
WHERE b.isbn = oi.isbn(+)
AND oi.order# = o.order#(+)
AND o.customer# = c.customer#(+)
ORDER BY b.title, oi.order#;