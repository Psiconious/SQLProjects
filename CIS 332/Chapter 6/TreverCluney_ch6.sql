--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 6 Assignment
--======================================================

--Clean-Up and Preperation--
DROP TABLE acctbonus PURGE;
DROP TABLE email_log PURGE;
START "C:\Users\Code_Bear\Desktop\Programs\CIS CLASSES\CIS 332\JLDB_Build_5.sql";
DROP SEQUENCE customers_customer#_seq;
--DROP SEQUENCE my_first_seq;

--Hands-on Assignment--
--1--
CREATE SEQUENCE customers_customer#_seq
INCREMENT BY 1
START WITH 1021
NOCYCLE
NOCACHE;

--Verification--
SELECT object_name
FROM user_objects
WHERE object_type = 'SEQUENCE';

--2--
INSERT INTO customers (customer#, lastname, firstname)
VALUES (customers_customer#_seq.NEXTVAL, 'Cluney', 'Trever');

--Verification--
SELECT customer#
FROM customers
WHERE customer# = 1021;

--3--
CREATE SEQUENCE MY_FIRST_SEQ
START WITH 5
INCREMENT BY -3
MAXVALUE 5
MINVALUE 0
NOCYCLE;

--Verification--
SELECT object_name
FROM user_objects
WHERE object_type = 'SEQUENCE';

--4--
SELECT MY_FIRST_SEQ.nextval
FROM DUAL;

SELECT MY_FIRST_SEQ.nextval
FROM DUAL;

SELECT MY_FIRST_SEQ.nextval
FROM DUAL;

--Verification--
--MINVALUE doesn't allow for us to go past 0 this is why we get an error.

--5--
ALTER SEQUENCE my_first_seq
MINVALUE -1000;

--Verification--
SELECT MY_FIRST_SEQ.nextval
FROM DUAL;

--6--
CREATE TABLE email_log
    (emailid NUMERIC GENERATED AS IDENTITY PRIMARY KEY,
     emaildate DATE,
     customer# NUMERIC);

INSERT INTO email_log (emaildate,customer#)
VALUES (SYSDATE,1007);

INSERT INTO email_log (emailid,emaildate,customer#)
VALUES (DEFAULT,SYSDATE,1008);

INSERT INTO email_log (emailid,emaildate,customer#)
VALUES (25,SYSDATE,1009);

--Verification--
--We are using an autogenorated primary key so is will not take in any outside values

--7--
CREATE SYNONYM numgen
FOR my_first_seq;

--Verification--
SELECT numgen.NEXTVAL
FROM dual;

--8--
DROP SYNONYM numgen;

DROP SEQUENCE my_first_seq;

--Verification--
SELECT object_name
FROM user_objects
WHERE object_type = 'SEQUENCE';

--10--
CREATE INDEX customers_lastname_idx
ON customers (lastname);

SELECT table_name, index_name, index_type
FROM user_indexes
WHERE table_name = 'CUSTOMERS';

DROP INDEX customers_lastname_idx;

SELECT table_name, index_name, index_type
FROM user_indexes
WHERE table_name = 'CUSTOMERS';