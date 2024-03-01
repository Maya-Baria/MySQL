DROP DATABASE IF EXISTS `HR`;
CREATE DATABASE `HR`;
use `HR`;
CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
INSERT INTO EMPLOYEES (`EMP_ID`,`F_NAME`,`L_NAME`,`SSN`,`B_DATE`,`SEX`,`ADDRESS`,`JOB_ID`,`SALARY`,`MANAGER_ID`,`DEP_ID`)
VALUES
 ('E1001','John','Thomas','123456','1976-09-01','M','5631Rice, OakPark,IL','100',100000.00,'30001','2'),
 ('E1002','Alice','James','123457','1972-07-31','F','980 Berry ln, Elgin,IL','200',80000.00,'30002','5'),
 ('E1003','Steve','Wells','123458','1980-10-08','M','291 Springs, Gary,IL','300',50000.00,'30002','5'),
 ('E1004','Santosh','Kumar','123459','1985-07-20','M','511 Aurora Av, Aurora,IL','400',60000.00,'30002','5'),
 ('E1005','Ahmed','Hussain','123410','1981-04-01','M','216 Oak Tree, Geneva,IL','500',70000.00,'30001','2'),
 ('E1006','Nancy','Allen','123411','1978-06-02','F','111 Green Pl, Elgin,IL','600',90000.00,'30001','2'),
 ('E1007','Mary','Thomas','123412','1975-05-05','F','100 Rose Pl, Gary,IL','650',65000.00,'30003','7'),
 ('E1008','Bharath','Gupta','123413','1985-06-05','M','145 Berry Ln, Naperville,IL','660',65000.00,'30003','7'),
 ('E1009','Andrea','Jones','123414','1990-09-07','F','120 Fall Creek, Gary,IL','234',70000.00,'30003','7'),
 ('E1010','Ann','Jacob','123415','1982-03-30','F','111 Britany Springs,Elgin,IL','220',70000.00,'30002','5');


                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
INSERT INTO JOB_HISTORY (`EMPL_ID`,`START_DATE`,`JOBS_ID`,`DEPT_ID`) 
VALUES
('E1001','2000-01-08','100','2'),
('E1002','2001-08-01','200','5'),
('E1003','2001-08-16','300','5'),
('E1004','2000-08-16','400','5'),
('E1005','2000-05-30','500','2'),
('E1006','2001-08-16','600','2'),
('E1007','2002-05-30','650','7'),
('E1008','2010-05-06','660','7'),
('E1009','2016-08-16','234','7'),
('E1010','2016-08-16','220','5');


 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));
INSERT INTO JOBS (`JOB_IDENT`,`JOB_TITLE`,`MIN_SALARY`,`MAX_SALARY`) 
VALUES 
('100','Sr. Architect',60000.00,100000.00),
('200','Sr. Software Developer',60000.00,80000.00),
('220','Sr. Designer',70000.00,90000.00),
('234','Sr. Designer',70000.00,90000.00),
('300','Jr.Software Developer',40000.00,60000.00),
('400','Jr.Software Developer',40000.00,60000.00),
('500','Jr. Architect',50000.00,70000.00),
('600','Lead Architect',70000.00,100000.00),
('650','Jr. Designer',60000.00,70000.00),
('660','Jr. Designer',60000.00,70000.00);



CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));
INSERT INTO DEPARTMENTS (`DEPT_ID_DEP`,`DEP_NAME`,`MANAGER_ID`,`LOC_ID`) 
VALUES
('2','Architect Group','30001','L0001'),
('5','Software Group','30002','L0002'),
('7','Design Team','30003','L0003');



CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
INSERT INTO LOCATIONS (`LOCT_ID`,`DEP_ID_LOC`) VALUES ('L0001','2'), ('L0002','5'),('L0003','7');
