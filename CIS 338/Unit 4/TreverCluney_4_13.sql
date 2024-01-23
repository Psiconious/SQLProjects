/*
* Name: Trever Cluney
* Date: 09/26/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 4 Hands-On Assignment 13 Exception Handling
*/

--Hands-On Assignments--
--13--
SET SERVEROUTPUT ON
/
DECLARE
    lv_old_num dd_donor.iddonor%type := 301;
    lv_new_num dd_donor.iddonor%type := 305;
    ex_id_update EXCEPTION;
BEGIN
  UPDATE dd_donor
   SET iddonor = lv_new_num
   WHERE iddonor = lv_old_num;
IF SQL%NOTFOUND THEN
    RAISE ex_id_update;
END IF;
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('This ID is already assigned.');
WHEN ex_id_update THEN
    DBMS_OUTPUT.PUT_LINE('No data changed.');
END;
/
ROLLBACK
/
SET SERVEROUTPUT OFF