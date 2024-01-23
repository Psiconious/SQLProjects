CREATE TABLE email_log
    (emailid NUMERIC GENERATED AS IDENTITY PRIMARY KEY,
     emaildate DATE,
     customer# NUMERIC);

INSERT INTO email_log (emaildate,customer#)
VALUES (SYSDATE,1007);

INSERT INTO email_log (emailid,emaildate,customer#)
VALUES (DEFAULT,SYSDATE,1008);

INSERT INTO email_log (emailid,emaildate,customer#)
VALUES (25,SYSDATE,1009);
