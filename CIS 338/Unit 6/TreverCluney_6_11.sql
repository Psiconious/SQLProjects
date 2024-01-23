/*
* Name: Trever Cluney
* Date: 10/24/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 6 Hands-On Assignment 11 Identifying Pledge Status
*/

--11--
SET SERVEROUTPUT ON
/
CREATE OR REPLACE
FUNCTION DD_PLSTAT_SF(p_status IN NUMBER)
RETURN VARCHAR
IS
lv_status_char VARCHAR(10);
BEGIN
IF p_status = 10 THEN
    lv_status_char := 'Open';
ELSIF p_status = 20 THEN
    lv_status_char := 'Complete';
ELSIF p_status = 30 THEN
    lv_status_char := 'Overdue';
ELSIF p_status = 40 THEN
    lv_status_char := 'Closed';
ELSIF p_status = 50 THEN
    lv_status_char := 'Hold';
ELSE
    lv_status_char := 'Unknown';
END IF;
RETURN lv_status_char;
END;
/
SELECT idpledge, pledgedate, DD_PLSTAT_SF(idstatus)
FROM dd_pledge;
/
SELECT idpledge, pledgedate, DD_PLSTAT_SF(idstatus)
FROM dd_pledge
WHERE idpledge = 100;
/
SET SERVEROUTPUT OFF