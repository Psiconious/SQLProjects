--============================================
--Trever Cluney
--CIS332 Databases SQL
--Chapter 2 assignmnent
--============================================

--Hands-On Assignments
--1--
DESC books;

--2--
SELECT title FROM books;

--3--
SELECT title, pubdate from books;

--4--
SELECT customer#, city, state FROM customers;

--5--
SELECT name, phone, contact AS "Contact Person" FROM publisher;

--6--
SELECT UNIQUE category FROM books;

--7--
SELECT UNIQUE customer# FROM orders;

--8--
SELECT category, title FROM books;

--9--
SELECT lname||', '||fname FROM author;

--10--
SELECT isbn, item#, order#, paideach, quantity,
quantity*paideach AS "Item Total" FROM orderitems;

--Advanced Challenge
--1--
SELECT lastname||','||firstname AS "Name",
address, city||','||state AS "Location" FROM customers;

--2--
SELECT title, ((retail-cost)/cost)*100 AS "Profit %" FROM books;