/*
* Name: Trever Cluney
* Date: 09/10/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 2 hands-on assignment 2-4 case statement assignment
*/
SET SERVEROUTPUT ON
/
DECLARE
    lv_test_totalamt NUMBER;
    lv_test_rating VARCHAR(4);
BEGIN
   lv_test_totalamt := 201;
   CASE 
        WHEN lv_test_totalamt > 200 THEN lv_test_rating := 'HIGH';
        WHEN lv_test_totalamt > 100 THEN lv_test_rating := 'MID';
        ELSE lv_test_rating := 'LOW';
   END CASE;
   DBMS_OUTPUT.PUT('Total of Purchases: ');
   DBMS_OUTPUT.PUT_LINE(lv_test_totalamt);
   DBMS_OUTPUT.PUT('Customer Rating: ');
   DBMS_OUTPUT.PUT_LINE(lv_test_rating);
END;
/
DECLARE
    lv_test_totalamt NUMBER;
    lv_test_rating VARCHAR(4);
BEGIN
   lv_test_totalamt := 150;
   CASE 
        WHEN lv_test_totalamt > 200 THEN lv_test_rating := 'HIGH';
        WHEN lv_test_totalamt > 100 THEN lv_test_rating := 'MID';
        ELSE lv_test_rating := 'LOW';
   END CASE;
   DBMS_OUTPUT.PUT('Total of Purchases: ');
   DBMS_OUTPUT.PUT_LINE(lv_test_totalamt);
   DBMS_OUTPUT.PUT('Customer Rating: ');
   DBMS_OUTPUT.PUT_LINE(lv_test_rating);
END;
/
DECLARE
    lv_test_totalamt NUMBER;
    lv_test_rating VARCHAR(4);
BEGIN
   lv_test_totalamt := 50;
   CASE 
        WHEN lv_test_totalamt > 200 THEN lv_test_rating := 'HIGH';
        WHEN lv_test_totalamt > 100 THEN lv_test_rating := 'MID';
        ELSE lv_test_rating := 'LOW';
   END CASE;
   DBMS_OUTPUT.PUT('Total of Purchases: ');
   DBMS_OUTPUT.PUT_LINE(lv_test_totalamt);
   DBMS_OUTPUT.PUT('Customer Rating: ');
   DBMS_OUTPUT.PUT_LINE(lv_test_rating);
END;
/
SET SERVEROUTPUT OFF