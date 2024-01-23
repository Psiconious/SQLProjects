--============================================
--Trever Cluney
--CIS332 Databases SQL
--Chapter 3 assignmnent
--============================================

--Clean up & Preperations for code--
DROP TABLE category PURGE;
DROP TABLE employees PURGE;
DROP TABLE jl_emps PURGE;
DROP TABLE book_pricing PURGE;

--Hands-On Assignments--
--1--
CREATE TABLE category
(catcode VARCHAR2(2),
catdesc VARCHAR2(10));

--Verification--
DESC category;

--2--
CREATE TABLE employees
(emp# NUMERIC(5),
lastname VARCHAR2(12),
firstname VARCHAR2(12),
job_class VARCHAR2(4));

--Verification--
DESC employees;

--3--
ALTER TABLE employees ADD 
(empdate DATE DEFAULT SYSDATE,
enddate DATE);

--Verification--
DESC employees;

--4--
ALTER TABLE employees
MODIFY (job_class VARCHAR2(2));

--Verification--
DESC employees;

--5--
ALTER TABLE employees
DROP COLUMN enddate;

--Verification--
DESC employees;

--6--
RENAME employees TO jl_emps;

--Verification--
SELECT table_name FROM user_tables;
DESC jl_emps;

--7--
CREATE TABLE book_pricing
AS (SELECT isbn AS id, cost, retail, category FROM books);

--Verification--
DESC book_pricing;
SELECT * FROM book_pricing;

--8--
ALTER TABLE book_pricing SET UNUSED (category);

--Verification--
DESC book_pricing;

--9--
TRUNCATE TABLE book_pricing;

--Verification--
SELECT * FROM book_pricing;
DESC book_pricing;

--10--
DROP TABLE book_pricing purge; 

SELECT table_name FROM user_tables;

DROP TABLE jl_emps;

SELECT table_name FROM user_tables;

SELECT object_name, original_name
FROM recyclebin;

FLASHBACK TABLE jl_emps TO BEFORE DROP;

--Verification--
SELECT table_name FROM user_tables;