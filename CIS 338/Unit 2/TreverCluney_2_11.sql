/*
* Name: Trever Cluney
* Date: 09/11/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 2 hands-on assignment 2-11 WHILE loop assignment
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
    lv_loop_count    NUMBER (2) := 0;
BEGIN
    lv_pledge_tot := lv_mo_pay_amt * lv_no_payments;
    DBMS_OUTPUT.PUT_LINE(CONCAT('Total pledge amount: ',TO_CHAR(lv_pledge_tot, '$9,999.99')));
    WHILE lv_loop_count < lv_no_payments LOOP
        lv_due_date := ADD_MONTHS(lv_start_date,lv_loop_count + 1);
        lv_pledge_bal := lv_pledge_bal + lv_mo_pay_amt;
        DBMS_OUTPUT.PUT_LINE(CONCAT(CONCAT(CONCAT('Payment #', lv_loop_count + 1), ' '),CONCAT(CONCAT(CONCAT('Date: ', TO_CHAR(lv_due_date,'MON DD, YYYY')), ' '),CONCAT(CONCAT(CONCAT('Amt: ',TO_CHAR(lv_mo_pay_amt,'$9,999.99')),' '),CONCAT('Total paid: ',TO_CHAR(lv_pledge_bal, '$9,999.99'))))));
        lv_loop_count := lv_loop_count + 1;
    END LOOP;
END;
/
SET SERVEROUTPUT OFF