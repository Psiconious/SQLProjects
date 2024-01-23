/*
* Name: Trever Cluney
* Date: 09/20/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 3 Hands-On Assignment 10 Adding a Project
*/

--Hands-On Assignments--
--10--
CREATE SEQUENCE DD_PROJID_SEQ
START WITH 530
NOCACHE;
/
SET SERVEROUTPUT ON
/
DECLARE
    rec_project dd_project%ROWTYPE;
BEGIN
    rec_project.idproj := dd_projid_seq.nextval;
    rec_project.projname := 'HK Animal Shelter Extension';
    rec_project.projstartdate := '01-JAN-2013';
    rec_project.projenddate := '31-MAY-2013';
    rec_project.projfundgoal := 65000;
    INSERT INTO dd_project VALUES rec_project;
END;
/
ROLLBACK
/
SET SERVEROUTPUT OFF
/
DROP SEQUENCE DD_PROJID_SEQ;

