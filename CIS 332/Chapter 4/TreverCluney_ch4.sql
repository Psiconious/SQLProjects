--====================================================== 
--Trever Cluney
--CIS332: Database and SQL
--CHAPTER 4 Assignment
--======================================================

--Clean up and Prep--
DROP TABLE rep_contracts PURGE;
DROP TABLE book_stores PURGE;
DROP TABLE store_reps PURGE;

--Hands-On Assignment--
--1--
CREATE TABLE store_reps
    (rep_ID NUMBER(5),
     last VARCHAR2(15),
     first VARCHAR2(10),
     comm CHAR(1) DEFAULT 'Y',
     CONSTRAINT storereps_id_pk PRIMARY KEY (rep_id));
     
--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'STORE_REPS';

--2--
ALTER TABLE store_reps
     MODIFY (last CONSTRAINT storereps_last_nn NOT NULL,
     first CONSTRAINT storereps_first_nn NOT NULL);

--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'STORE_REPS';

--3--
ALTER TABLE store_reps
     ADD CONSTRAINT storereps_comm_ck CHECK (comm IN ('Y', 'N'));

--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'STORE_REPS';

--4--
ALTER TABLE store_reps
    add (base_salary NUMBER(7,2),
    CONSTRAINT storereps_basesalary_ck CHECK (base_salary > 0));

--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'STORE_REPS';

--5--
CREATE TABLE book_stores
    (store_id NUMBER(8),
     name VARCHAR2(30) CONSTRAINT bookstore_name_nn NOT NULL,
     contact VARCHAR2(30),
     rep_id VARCHAR2(5),
     CONSTRAINT bookstore_id_pk PRIMARY KEY (store_id),
     CONSTRAINT bookstore_name_uk UNIQUE (name));

--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'BOOK_STORES';

--6--
ALTER TABLE book_stores
    MODIFY rep_id NUMBER(5);

ALTER TABLE book_stores
    ADD CONSTRAINT  bookstore_repid_fk FOREIGN KEY (rep_id)
    REFERENCES store_reps (rep_id);

--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'BOOK_STORES';

--7--
ALTER TABLE book_stores
    DROP CONSTRAINT bookstore_repid_fk;

ALTER TABLE book_stores
    ADD CONSTRAINT bookstore_repid_fk FOREIGN KEY (rep_id)
    REFERENCES store_reps (rep_id) ON DELETE CASCADE;

--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'BOOK_STORES';

--8--
CREATE TABLE rep_contracts
    (store_id NUMBER(8),
     name NUMBER(5),
     quarter CHAR(3),
     rep_id NUMBER(5),
     CONSTRAINT repcontracts_storeidrepidquarter_pk PRIMARY KEY (store_id, rep_id, quarter),
     CONSTRAINT repcontracts_storeid_fk FOREIGN KEY (store_id) 
        REFERENCES book_stores (store_id),
     CONSTRAINT repcontracts_repid_fk FOREIGN KEY (rep_id)
        REFERENCES store_reps (rep_id));

--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'REP_CONTRACTS';

--9--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'STORE_REPS';

--10--
ALTER TABLE store_reps
    DISABLE CONSTRAINT storereps_basesalary_ck;

ALTER TABLE store_reps
    ENABLE CONSTRAINT storereps_basesalary_ck;

--Verification--
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
    FROM user_constraints
    WHERE table_name = 'STORE_REPS';