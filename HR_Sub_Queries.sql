select * from employees;

#Sub-queries and Nested Selects
#retrieve all employee records whose salary is lower than the average salary.
select * from employees where SALARY < (select avg(SALARY) from employees);

#retrieves all employee records with EMP_ID, SALARY, and maximum salary as MAX_SALARY in every row
select EMP_ID, SALARY, (select max(salary) from employees)  as MAX_SALARY from employees;

#extract the first and last names of the oldest employee.
select F_NAME, L_NAME from employees where B_DATE = (select min(B_DATE) from employees);

#Find the average salary of the top 5 earners in the company.
select salary from employees order by salary desc limit 5; #salry of top 5 earners
select avg(salary) from (select salary from employees order by salary desc limit 5) as Avg_salaryOf_TopEarners; #avg salary of this top 5 earners

#Write a query to find the average salary of the five least-earning employees
select salary from employees order by salary limit 5;
select avg(salary) from (select salary from employees order by salary limit 5) as Least_earning_employees;

#Write a query to find the records of employees older than the average age of all employees
SELECT YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, B_DATE))) AS Age FROM employees; #It will give age of the employees
SELECT * FROM EMPLOYEES WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE))) > (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE)))) FROM EMPLOYEES);

#From the Job_History table, display the list of Employee IDs, years of service, and average years of service for all entries.
select * from job_history;
#years from the joining:
select EMPL_ID, year(from_days(datediff(current_date, START_DATE))) as years_of_service from job_history;
select EMPL_ID, year(from_days(datediff(current_date, START_DATE))), (select avg(year(from_days(datediff(current_date, START_DATE)))) from job_history as avg_job_yrs) from job_history;
