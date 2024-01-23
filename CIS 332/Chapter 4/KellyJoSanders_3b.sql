--====================================================== 
--KELLY JO SANDERS
--CIS332: Database and SQL
--UNIT 3, CHAPTER 4 Assignment
--======================================================

--Clean-up & Preparation for Running the Script--
DROP TABLE actors 
	CASCADE CONSTRAINTS PURGE;
DROP TABLE film 
	CASCADE CONSTRAINTS PURGE;
DROP TABLE movieinx 
	CASCADE CONSTRAINTS PURGE;

--1--
CREATE TABLE film
  (Movieid    NUMBER(9),
   Title	   VARCHAR2(50),
   DirectorID NUMBER(5,0),
   Rating     VARCHAR2(15) NOT NULL,
   ReleaseDT  DATE,
  CONSTRAINT film_movieid_pk PRIMARY KEY (movidid)
  CONSTRAINT film_title_uk UNIQUE(title));

-- VERIFICATION --- 
DESC film;

SELECT constraint_name, constraint_type, search_condition, status
  FROM user_constraints
  WHERE table_name = 'FILM';


--2--
ALTER TABLE actors
  ADD CONSTRAINT actors_gender_ck CHECK (gender IN('M','F'));

--VERIFICATION-- 
SELECT *
  FROM user_constraints
  WHERE table_name = 'ACTORS';


--3--
ALTER TABLE actors
  ADD (Death_Date DATE);

--VERIFICATION-- 
DESC actors;