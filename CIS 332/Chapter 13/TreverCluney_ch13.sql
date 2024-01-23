--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 12 Assignment
--======================================================

START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_8.sql";
DROP VIEW contact;
DROP VIEW homework13;
DROP VIEW reorderinfo;

--1--
CREATE OR REPLACE VIEW contact
AS SELECT publisher.contact, publisher.phone
   FROM publisher;

SELECT *
FROM contact;

--2--
CREATE OR REPLACE VIEW contact
AS SELECT publisher.contact, publisher.phone
   FROM publisher
WITH READ ONLY;

--3--
CREATE FORCE VIEW homework13
AS SELECT col1, col2
   FROM firstattempt;

--4--
SELECT *
FROM homework13;

--5--
CREATE OR REPLACE VIEW reorderinfo
AS SELECT isbn, title, contact, phone
   FROM books b JOIN publisher USING (pubid);

SELECT *
FROM reorderinfo;

