/*
* Name: Trever Cluney
* Date: 12/08/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 10 Hands-On Assignment 2 Using the DMBS_DDL Package
*/

--2--
SET SERVEROUTPUT ON
/
DECLARE
    CURSOR invalid_curr IS
        SELECT object_name, object_type
        FROM user_objects
        WHERE status = 'INVALID';
    invalid invalid_curr%ROWTYPE;
BEGIN
    FOR invalid IN invalid_curr LOOP
        dbms_ddl.alter_compile(invalid.object_type, NULL, invalid.object_name);
    END LOOP;
END;
/
SET SERVEROUTPUT OFF