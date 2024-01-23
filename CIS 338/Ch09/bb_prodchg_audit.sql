CREATE TABLE bb_prodchg_audit
 (user_id VARCHAR2(10),
  chg_date DATE,
  name_old VARCHAR2(25),
  name_new VARCHAR2(25),
  price_old NUMBER(5,2),
  price_new NUMBER(5,2),
  start_old DATE,
  start_new DATE,
  end_old DATE,
  end_new DATE,
  sale_old NUMBER(5,2),
  sale_new NUMBER(5,2) );
