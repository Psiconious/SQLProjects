/*
* Name: Trever Cluney
* Date: 09/10/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 2 hands-on assignment 2-1 Scalar Vars assignment
*/

SET SERVEROUTPUT ON
/
DECLARE
    lv_test_date DATE := '10-DEC-2012';
    lv_test_num NUMBER(3) := 10;
    lv_test_text VARCHAR(10) := 'Cluney';
BEGIN
    DBMS_OUTPUT.PUT_LINE(lv_test_date);
    DBMS_OUTPUT.PUT_LINE(lv_test_num);
    DBMS_OUTPUT.PUT_LINE(lv_test_text);
END;
/
SET SERVEROUTPUT OFF
