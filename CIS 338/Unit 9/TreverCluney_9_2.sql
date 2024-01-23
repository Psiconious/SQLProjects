/*
* Name: Trever Cluney
* Date: 11/30/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 9 Hands-On Assignment 2 Updating Stock information
*/

--2--
SET SERVEROUTPUT ON
/
CREATE OR REPLACE TRIGGER BB_REQFILL_TRG
    AFTER
    UPDATE OF DTRECD 
    ON BB_PRODUCT_REQUEST
    FOR EACH ROW
    BEGIN
        UPDATE bb_product
        SET stock = stock + :NEW.qty
        WHERE idproduct = :NEW.idproduct;
    END;
/
SET SERVEROUTPUT OFF