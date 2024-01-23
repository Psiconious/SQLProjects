/*
* Name: Trever Cluney
* Date: 09/20/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 3 Hands-On Assignment 7 Scalar Variable Data Retrival
*/

--Hands-On Assignments--
--7--
SET SERVEROUTPUT ON
/
DECLARE
    lv_idbasket_num NUMBER(5);
    lv_subtotal_num NUMBER(7,2);
    lv_shipping_num NUMBER(5,2);
    lv_tax_num NUMBER(5,2);
    lv_total_num NUMBER(7,2);
    lv_row_num NUMBER(2) := 12;
BEGIN
SELECT idbasket, subtotal, shipping, tax, total
    INTO lv_idbasket_num, lv_subtotal_num, lv_shipping_num, lv_tax_num, lv_total_num
    FROM bb_basket
    WHERE idbasket = lv_row_num;
    DBMS_OUTPUT.PUT_LINE(lv_idbasket_num || ' ' || lv_subtotal_num || ' ' || lv_shipping_num || ' ' || lv_tax_num || ' ' || lv_total_num  );
END;
/
SET SERVEROUTPUT OFF