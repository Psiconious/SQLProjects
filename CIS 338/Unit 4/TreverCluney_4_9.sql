/*
* Name: Trever Cluney
* Date: 09/26/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 4 Hands-On Assignment 9 Using an Explicit Cursor
*/

--Hands-On Assignments--
--9--
SET SERVEROUTPUT ON
/
DECLARE
    CURSOR curr_pledge IS
        SELECT idpledge, pledgeamt, paymonths, paydate, payamt
        FROM dd_pledge JOIN dd_payment
        USING (idpledge)
        WHERE idpledge = 104;
    lv_firstrow_bool BOOLEAN := true;
BEGIN
FOR rec_pledge IN curr_pledge LOOP
    IF lv_firstrow_bool THEN
       DBMS_OUTPUT.PUT(rec_pledge.idpledge || ' - ' || TO_CHAR(rec_pledge.pledgeamt, '$9,999.99') || ' - ' || rec_pledge.paymonths || ' - ' || rec_pledge.paydate || ' - ' || TO_CHAR(rec_pledge.payamt, '$9,999.99') );
       DBMS_OUTPUT.PUT_LINE(' - First Payment');
       lv_firstrow_bool := false;
    ELSE
        DBMS_OUTPUT.PUT_LINE(rec_pledge.idpledge || ' - ' || TO_CHAR(rec_pledge.pledgeamt, '$9,999.99') || ' - ' || rec_pledge.paymonths || ' - ' || rec_pledge.paydate || ' - ' || TO_CHAR(rec_pledge.payamt, '$9,999.99') );
    END IF;
END LOOP;
END;
/
SET SERVEROUTPUT OFF
