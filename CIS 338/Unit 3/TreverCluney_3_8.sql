/*
* Name: Trever Cluney
* Date: 09/20/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 3 Hands-On Assignment 8 Record Variable Data Retrival
*/

--Hands-On Assignments--
--8--
SET SERVEROUTPUT ON
/
DECLARE
    TYPE type_basket IS RECORD(
        basket NUMBER(5),
        sub NUMBER(7,2),
        ship NUMBER(5,2),
        taxamt NUMBER(5,2),
        tot NUMBER(7,2)
    );
    rec_basket type_basket;
    lv_row_num NUMBER(2) := 12;
BEGIN
SELECT idbasket, subtotal, shipping, tax, total
    INTO rec_basket
    FROM bb_basket
    WHERE idbasket = lv_row_num;
    DBMS_OUTPUT.PUT_LINE(rec_basket.basket || ' ' || rec_basket.sub || ' ' || rec_basket.ship || ' ' || rec_basket.taxamt || ' ' || rec_basket.tot  );
END;
/
SET SERVEROUTPUT OFF