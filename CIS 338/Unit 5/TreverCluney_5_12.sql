/*
* Name: Trever Cluney
* Date: 10/17/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 5 Hands-On Assignment 12 Creating a procedure
*/

--3--
SET SERVEROUTPUT ON
/
CREATE OR REPLACE 
PROCEDURE DDCKPAY_SP
    (p_id IN dd_pledge.idpledge%type,
    p_pay IN dd_pledge.pledgeamt%type)
AS
    lv_pledgeamt dd_pledge.pledgeamt%type;
    lv_paymonths dd_pledge.paymonths%type;
    lv_monthlypay dd_pledge.pledgeamt%type;
BEGIN
    SELECT pledgeamt, paymonths
    INTO lv_pledgeamt, lv_paymonths
    FROM dd_pledge
    WHERE p_id = idpledge;
    lv_monthlypay := lv_pledgeamt / lv_paymonths;
    IF p_pay != lv_monthlypay THEN
        RAISE_APPLICATION_ERROR(-20050,'Incorrect ' || p_pay ||' - ' || lv_monthlypay || ' = ' || TO_CHAR(p_pay - lv_monthlypay));
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND OR ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('No payment information.');
END DDCKPAY_SP;
/
BEGIN
  ddckpay_sp(104,25);
END;
/
BEGIN
  ddckpay_sp(104,20);
END;
/
BEGIN
  ddckpay_sp(101,50);
END;
/
SET SERVEROUTPUT OFF