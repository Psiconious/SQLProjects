/*
* Name: Trever Cluney
* Date: 09/10/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 2 hands-on assignment 2-9 FOR loop assignment
*/
SET SERVEROUTPUT ON
/
DECLARE
    lv_start_date   DATE := SYSDATE; 
    lv_mo_pay_amt   NUMBER (8,2):= 100.00; 
    lv_no_payments  NUMBER (2):= 3; 
    lv_pledge_tot   NUMBER (8,2):= 0; 
    lv_pledge_bal   NUMBER (8,2) := 0; 
    lv_due_date     DATE;
BEGIN
    lv_pledge_bal := lv_mo_pay_amt * lv_no_payments;
    lv_pledge_tot := lv_pledge_bal;
    DBMS_OUTPUT.PUT_LINE(CONCAT('Total pledge amount: ',TO_CHAR(lv_pledge_tot, '$9,999.99')));
    FOR i in 1..lv_no_payments LOOP
        lv_due_date := ADD_MONTHS(lv_start_date,i);
        lv_pledge_bal := lv_pledge_bal - lv_mo_pay_amt;
        DBMS_OUTPUT.PUT_LINE(CONCAT(CONCAT(CONCAT('Payment #', i), ' '),CONCAT(CONCAT(CONCAT('Date: ', TO_CHAR(lv_due_date,'MON DD, YYYY')), ' '),CONCAT(CONCAT(CONCAT('Amt: ',TO_CHAR(lv_mo_pay_amt,'$9,999.99')),' '),CONCAT('Bal: ',TO_CHAR(lv_pledge_bal, '$9,999.99'))))));
    END LOOP;
END;
/
SET SERVEROUTPUT OFF