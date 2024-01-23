/*
* Name: Trever Cluney
* Date: 10/28/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 7 Hands-On Assignment 5 Overloading Package Procedures
*/

--5--
SET SERVEROUTPUT ON
/
CREATE OR REPLACE PACKAGE shop_query_pkg 
    IS
    PROCEDURE shop_lookup_pp
        (p_id IN bb_shopper.idshopper%type,
        p_name OUT bb_shopper.firstname%type,
        p_city OUT bb_shopper.city%type,
        p_state OUT bb_shopper.state%type,
        p_phone OUT bb_shopper.phone%type,
        p_email OUT bb_shopper.email%type);
    PROCEDURE shop_lookup_pp
        (p_id IN bb_shopper.lastname%type,
        p_name OUT bb_shopper.firstname%type,
        p_city OUT bb_shopper.city%type,
        p_state OUT bb_shopper.state%type,
        p_phone OUT bb_shopper.phone%type,
        p_email OUT bb_shopper.email%type);
END;
/
CREATE OR REPLACE PACKAGE BODY shop_query_pkg
    IS
    PROCEDURE shop_lookup_pp
        (p_id IN bb_shopper.idshopper%type,
        p_name OUT bb_shopper.firstname%type,
        p_city OUT bb_shopper.city%type,
        p_state OUT bb_shopper.state%type,
        p_phone OUT bb_shopper.phone%type,
        p_email OUT bb_shopper.email%type)
        IS
    BEGIN
        SELECT firstname || ' ' || lastname, city, state, phone, email
            INTO p_name, p_city,p_state, p_phone, p_email
            FROM bb_shopper
            WHERE idshopper = p_id;
    END shop_lookup_pp;
    PROCEDURE shop_lookup_pp
        (p_id IN bb_shopper.lastname%type,
        p_name OUT bb_shopper.firstname%type,
        p_city OUT bb_shopper.city%type,
        p_state OUT bb_shopper.state%type,
        p_phone OUT bb_shopper.phone%type,
        p_email OUT bb_shopper.email%type)
        IS
    BEGIN
        SELECT firstname || ' ' || lastname, city, state, phone, email
            INTO p_name, p_city,p_state, p_phone, p_email
            FROM bb_shopper
            WHERE lastname = p_id;
    END shop_lookup_pp;
END;
/
DECLARE
  lv_name_txt VARCHAR2(20);
  lv_city_txt VARCHAR2(15);
  lv_state_txt VARCHAR2(2);
  lv_phone_txt VARCHAR2(12);
  lv_email_txt VARCHAR2(20);
BEGIN
  shop_query_pkg.shop_lookup_pp(23,lv_name_txt,lv_city_txt,
    lv_state_txt,lv_phone_txt,lv_email_txt);
  DBMS_OUTPUT.PUT_LINE(lv_name_txt);
  DBMS_OUTPUT.PUT_LINE(lv_city_txt);
  DBMS_OUTPUT.PUT_LINE(lv_state_txt);
  DBMS_OUTPUT.PUT_LINE(lv_phone_txt);
  DBMS_OUTPUT.PUT_LINE(lv_email_txt);
  shop_query_pkg.shop_lookup_pp('Ratman',lv_name_txt,lv_city_txt,
    lv_state_txt,lv_phone_txt,lv_email_txt);
  DBMS_OUTPUT.PUT_LINE(lv_name_txt);
  DBMS_OUTPUT.PUT_LINE(lv_city_txt);
  DBMS_OUTPUT.PUT_LINE(lv_state_txt);
  DBMS_OUTPUT.PUT_LINE(lv_phone_txt);
  DBMS_OUTPUT.PUT_LINE(lv_email_txt);
END;
/
SET SERVEROUTPUT OFF