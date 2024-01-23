--====================================================== 
--KELLY JO SANDERS
--CIS332: Database and SQL
--UNIT 2, CHAPTER 3 Assignment
--======================================================

--Clean-up & Preparation for Running the Script--
DROP TABLE movieinx PURGE;
DROP TABLE actors PURGE;


--1--
CREATE TABLE actors
  (Actor#     NUMBER(5,0),
   Lastname   VARCHAR2(18),
   Firstname  VARCHAR2(15),
   Birth_date DATE);

--VERIFICATION--
DESC actors


--2--
ALTER TABLE actors
  ADD (Death_Date DATE);

--VERIFICATION-- 
DESC actors
