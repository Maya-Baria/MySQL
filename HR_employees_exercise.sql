SELECT * FROM hr.employees;

#Retrieve the first names F_NAME and last names L_NAME of all employees who live in Elgin, IL. 
select F_NAME,L_NAME from employees where ADDRESS like "%Elgin,IL%";

#Identify the employees who were born during the 70s.
select F_NAME,L_NAME from employees where B_DATE like "%197%";

#Retrieve all employee records in department 5 where salary is between 60000 and 70000
select * from employees where (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

#retrieve a list of employees ordered by department ID
SELECT F_NAME, L_NAME, DEP_ID FROM EMPLOYEES ORDER BY DEP_ID;

#Retrieve the number of employees in each department.
select DEP_ID, count(*) from employees group by DEP_ID;

#Retrieve the number of employees in the department and the average employee salary in the department
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES GROUP BY DEP_ID;

#Retrieve the list of all employees, first and last names, whose first names start with ‘S’
select F_NAME, L_NAME from employees where F_NAME like "S%";


#Arrange all the records of the EMPLOYEES table in ascending order of the date of birth.
SELECT * from employees order by B_DATE;

#Group the records in terms of the department IDs and filter them of ones that have average salary more than or equal to 60000. Display the department ID and the average salary.
select DEP_ID,avg(SALARY) from employees group by DEP_ID having avg(SALARY)>=60000;

#For the problem above, sort the results for each group in descending order of average salary
select DEP_ID,avg(SALARY) from employees  group by DEP_ID  having avg(SALARY)>=60000 order by avg(SALARY) DESC;


