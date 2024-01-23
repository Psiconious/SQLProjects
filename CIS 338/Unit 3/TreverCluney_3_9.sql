/*
* Name: Trever Cluney
* Date: 09/20/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 3 Hands-On Assignment 9 Retriving Pledge Totals
*/

--Hands-On Assignments--
--9--
SET SERVEROUTPUT ON
/
DECLARE
    TYPE type_pledge IS RECORD(
        prodjid dd_project.idproj%TYPE,
        prodjname dd_project.projname%TYPE,
        pledgeamt dd_pledge.pledgeamt%TYPE
    );
    TYPE type_pledgecollection IS TABLE OF type_pledge;
    tbl_pledges type_pledgecollection;
    lv_pledgeavg_num NUMBER(7,2) := 0;
    lv_pledgetot_num NUMBER(7,2) := 0;
    lv_prodj_num NUMBER(3) := 501;
BEGIN
    SELECT pr.idproj, pr.projname, pl.pledgeamt
        BULK COLLECT INTO tbl_pledges
        FROM dd_project pr
        JOIN dd_pledge pl ON pr.idproj = pl.idproj
        WHERE pr.idproj = lv_prodj_num;
    FOR i IN 1..tbl_pledges.COUNT loop
        lv_pledgetot_num := lv_pledgetot_num + tbl_pledges(i).pledgeamt;
    END LOOP;
    lv_pledgeavg_num := lv_pledgetot_num / tbl_pledges.COUNT;
    DBMS_OUTPUT.PUT_LINE('Project id: ' || lv_prodj_num || ' Project name: ' || tbl_pledges(1).prodjname || ' Number of pledges: ' || tbl_pledges.COUNT || ' Total amomunt pledged: ' || TO_CHAR(lv_pledgetot_num, '$9,999.99') || ' Avgerage pledge: ' || TO_CHAR(lv_pledgeavg_num, '$9,999.99'));
END;
/
SET SERVEROUTPUT OFF