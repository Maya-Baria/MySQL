SELECT * FROM EmployeeDemographics;
SELECT * FROM WareHouseEmployeeDemographics;
select * from EmployeeSalary;

SELECT * FROM EmployeeDemographics full outer join WareHouseEmployeeDemographics on EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID;
SELECT * FROM EmployeeDemographics union SELECT * FROM WareHouseEmployeeDemographics;


/* CASE STATMENT */

/* catagrorized by age group */
select FirstName, LastName , Age, 
case 
	when Age > 30 then 'Old'
	else 'Young'
end
from EmployeeDemographics where Age is not Null
order by Age;


--/* calculate the salary raise*/
select FirstName, LastName, JobTitle, Salary,
case
	when JobTitle = 'salesman' then Salary + (Salary * 0.10)
	when JobTitle = 'Accountant' then Salary + (Salary * 0.05)
	when JobTitle = 'HR' then Salary + (Salary * 0.00001)
	else Salary + (Salary * 0.3)
end as salaryAfterRaise
from EmployeeDemographics
join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


/* Having clause */

select ES.JobTitle, count(JobTitle)
from EmployeeDemographics
join EmployeeSalary as ES on EmployeeDemographics.EmployeeID = ES.EmployeeID
group by JobTitle
having count(JobTitle) > 1

/* Update / Delete DATA */

UPDATE EmployeeDemographics
SET EmployeeID = 1012, AGE = 22, GENDER = 'FEMALE'
WHERE FirstName = 'HOLLY' AND LastName ='FLAX'

DELETE FROM EmployeeDemographics
WHERE EmployeeID = 1002

/*ALIASING */
SELECT FirstName + ' ' + LastName AS FULLNAME FROM EmployeeDemographics;

/* COMMON TABLE EXPRESION (CTE) */
with CTE_Employee as 
(select FirstName, LastName, Gender, Salary,
		count(Gender) over (partition by Gender) as TotalGender,
		avg(Salary) over (partition by Gender) as AvgSalary
from EmployeeDemographics as EmpDemo 
join EmployeeSalary as Sal
on EmpDemo.EmployeeID = Sal.EmployeeID
where Salary > '4500'
)
select FirstName, Gender, Salary from CTE_Employee;

/* Temp Tables */
drop table if exists #Temp_Employee;
create table #Temp_Employee(
FirstName  varchar(50),
LastName varchar(50),
Age int,
Salary int
)

insert into #Temp_Employee 
select FirstName, LastName, Age, Salary
from EmployeeDemographics 
join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

select * from #Temp_Employee
