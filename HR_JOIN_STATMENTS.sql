SELECT * FROM EMPLOYEES
SELECT * FROM JOB_HISTORY
SELECT * FROM DEPARTMENTS
SELECT * FROM JOBS
SELECT * FROM LOCATIONS
SELECT * FROM EMPLOYEES Full outer join JOB_HISTORY ON EMPLOYEES.EMP_ID = JOB_HISTORY.EMPL_ID


/*Retrieve the names and job start dates of all employees who work for department number 5*/
SELECT F_NAME,L_NAME,START_DATE from EMPLOYEES inner join JOB_HISTORY ON EMPLOYEES.EMP_ID = JOB_HISTORY.EMPL_ID WHERE DEP_ID = 5

/*Retrieve employee ID, last name, department ID, and department name for all employees */
--SELECT EMP_ID, L_NAME, DEP_ID,DEP_NAME FROM EMPLOYEES inner join DEPARTMENTS ON  EMPLOYEES.DEP_ID = DEPARTMENTs.DEPT_ID_DEP
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
FROM EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D 
ON E.DEP_ID=D.DEPT_ID_DEP;

/*Retrieve the First name, Last name, and Department name of all employees*/
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP

UNION

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP

/*Retrieve the names, job start dates, and job titles of all employees who work for department number 5 */
select E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE 
from EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
INNER JOIN JOBS as J on E.JOB_ID=J.JOB_IDENT
where E.DEP_ID ='5';

/*Retrieve employee ID, last name, and department ID for all employees but department names for only those born before 1980.*/
select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
from EMPLOYEES as E left outer join DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP AND YEAR(E.B_DATE)<1980;

/*Retrieve the first name and last name of all employees but department ID and department names only for male employees.*/
SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M'

UNION

SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME
from EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M';