--create procedure TEST
--as
--select * from EmployeeDemographics;

--exec TEST

create procedure Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN  EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

select * from #temp_employee
exec Temp_Employee @JobTitle = 'salesman'