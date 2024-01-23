/*
* Name: Trever Cluney
* Date: 10/24/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 6 Hands-On Assignment 4 Identifying the Weekday
*/

--4--
SET SERVEROUTPUT ON
/
CREATE OR REPLACE
FUNCTION DAY_ORD_SF(p_date IN DATE)
RETURN VARCHAR
IS
lv_day_char VARCHAR(10);
BEGIN
lv_day_char := TO_CHAR(p_date,'DAY');
RETURN lv_day_char;
END;
/
SELECT idbasket BASKET, DAY_ORD_SF(DTCREATED) DAY
FROM BB_BASKET;
/
SELECT DAY_ORD_SF(dtcreated) DAY, COUNT(idBasket) COUNT
FROM bb_basket
GROUP BY DAY_ORD_SF(dtcreated)
ORDER BY COUNT DESC;
/
SET SERVEROUTPUT OFF