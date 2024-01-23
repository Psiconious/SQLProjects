/*
* Name: Trever Cluney
* Date: 09/26/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 4 Hands-On Assignment 5 Handling Predefined Exception
*/

--Hands-On Assignments--
--5--
SET SERVEROUTPUT ON
/
DECLARE
 rec_shopper bb_shopper%ROWTYPE;
BEGIN
 SELECT *
  INTO rec_shopper
  FROM bb_shopper
  WHERE idShopper = 99;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Invalid shopper ID');
END;
/
SET SERVEROUTPUT OFF