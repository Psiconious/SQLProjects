/*
* Name: Trever Cluney
* Date: 10/17/21
* Email: tlcluney@dmacc.edu
* Overview: Chapter 5 Hands-On Assignment 3 Calculating tax on an order
*/

--3--
SET SERVEROUTPUT ON
/
CREATE OR REPLACE 
PROCEDURE TAX_COST_SP
    (p_state IN bb_tax.state%type,
    p_subtotal IN bb_basket.subtotal%type,
    p_tax OUT bb_tax.taxrate%type)
AS
BEGIN
    SELECT taxrate
    INTO p_tax
    FROM bb_tax
    WHERE UPPER(p_state) = state;
    p_tax := p_tax * p_subtotal;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_tax := 0;
END TAX_COST_SP;
/
DECLARE
 lv_taxamt_num bb_basket.subtotal%type;
BEGIN
    TAX_COST_SP('va',100,lv_taxamt_num);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(lv_taxamt_num, '$9,999.99'));
    tax_cost_sp ('VA', 100, lv_taxamt_num);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(lv_taxamt_num, '$9,999.99'));
    tax_cost_sp ('va', 50, lv_taxamt_num);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(lv_taxamt_num, '$9,999.99'));
    tax_cost_sp ('MN', 10, lv_taxamt_num);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(lv_taxamt_num, '$9,999.99'));
    tax_cost_sp ('Mn', 100, lv_taxamt_num);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(lv_taxamt_num, '$9,999.99'));
END;
/
SET SERVEROUTPUT OFF