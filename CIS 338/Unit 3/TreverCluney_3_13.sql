/*
* Name: Trever Cluney
* Date: 09/20/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 3 Hands-On Assignment 13 Modifying data
*/

--Hands-On Assignments--
--13--

SET SERVEROUTPUT ON
/
DECLARE
    rec_project dd_project%ROWTYPE;
    lv_projid_num NUMBER(3) := 501;
    lv_projgoal_num dd_project.projfundgoal%TYPE := 1000000;
BEGIN
    SELECT *
        INTO rec_project
        FROM dd_project
        WHERE idproj = lv_projid_num;
    DBMS_OUTPUT.PUT_LINE('Project Name: ' || rec_project.projname);
    DBMS_OUTPUT.PUT_LINE('Start Date: ' || rec_project.projstartdate);
    DBMS_OUTPUT.PUT_LINE('Previous Goal: ' || rec_project.projfundgoal);
    DBMS_OUTPUT.PUT_LINE('New Goal: ' || lv_projgoal_num);
    UPDATE dd_project
        SET projfundgoal = lv_projgoal_num
        WHERE idproj = lv_projid_num
        RETURNING idproj, projname, projstartdate, projenddate, projfundgoal, projcoord
            INTO rec_project;
    DBMS_OUTPUT.PUT_LINE('Returning New Goal: ' || rec_project.projfundgoal);
END;
/
ROLLBACK
/
SET SERVEROUTPUT OFF


