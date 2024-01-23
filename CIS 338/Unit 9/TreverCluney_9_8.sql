/*
* Name: Trever Cluney
* Date: 11/30/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 9 Hands-On Assignment 8 Maintaining an audit trail
*/

--8--
SET SERVEROUTPUT ON
/
CREATE OR REPLACE TRIGGER BB_AUDIT_TRG
    AFTER
    UPDATE ON BB_PRODUCT
    FOR EACH ROW
    BEGIN
        INSERT INTO bb_prodchg_audit(user_id,chg_date,name_old,name_new,price_old,price_new,start_old,start_new,end_old,end_new,sale_old,sale_new)
        VALUES(SYS_CONTEXT('USERENV','OS_USER'),SYSDATE,:OLD.productname,:NEW.productname,:OLD.price,:NEW.price,:OLD.salestart,:NEW.salestart,:OLD.saleend,:NEW.saleend,:OLD.saleprice,:NEW.saleprice);
    END;
/
SET SERVEROUTPUT OFF