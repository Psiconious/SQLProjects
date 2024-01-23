--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 7 Assignment
--======================================================

--Hands-on Assignment--
--1--
CREATE USER tcluney
    IDENTIFIED BY myfirstuser;

--3--
GRANT CREATE SESSION, CREATE TABLE, ALTER ANY TABLE
    TO tcluney;

--4--
CREATE ROLE CUSTOMERREP;

GRANT INSERT, DELETE
ON ORDERS
TO CUSTOMERREP;

GRANT INSERT, DELETE
ON ORDERITEMS
TO CUSTOMERREP;

--6--
SELECT *
FROM user_sys_privs
WHERE username = 'ORA603';

SELECT *
FROM user_role_privs
WHERE username = 'ORA603';

--9--
DROP USER tcluney;