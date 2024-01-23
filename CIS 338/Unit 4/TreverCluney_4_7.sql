/*
* Name: Trever Cluney
* Date: 09/26/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 4 Hands-On Assignment 7 Handling Exceptions with User-Defined Errors
*/

--Hands-On Assignments--
--7--
SET SERVEROUTPUT ON
/
DECLARE
    lv_old_num bb_basketitem.idBasket%type := 30;
    lv_new_num bb_basketitem.idBasket%type := 4;
    ex_basket_update EXCEPTION;
BEGIN
  UPDATE bb_basketitem
   SET idBasket = lv_new_num
   WHERE idBasket = lv_old_num;
IF SQL%NOTFOUND THEN
    RAISE ex_basket_update;
END IF;
EXCEPTION
WHEN ex_basket_update THEN
    DBMS_OUTPUT.PUT_LINE('Invalid original basket');
END;
/
ROLLBACK
/
SET SERVEROUTPUT OFF