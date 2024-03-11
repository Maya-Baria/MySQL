Drop Table if exists EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

select * from EmployeeErrors;

/*Remove the white space */
select EmployeeID, TRIM(EmployeeID) as TrimID from EmployeeErrors;

/* Replace the item */
select FirstName, REPLACE(FirstName, 'Jimbo', 'Jim') from EmployeeErrors;
select LastName , REPLACE(LastName, '- Fired', ' ') from EmployeeErrors;

/* using substrings */
--select SUBSTRING(FirstName,1,3) from EmployeeErrors;
select dem.FirstName, err.FirstName from EmployeeErrors err
join EmployeeDemographics dem
on err.FirstName =dem.FirstName

select SUBSTRING(err.FirstName, 1, 3), SUBSTRING(dem.FirstName, 1,3) 
from EmployeeErrors err
join EmployeeDemographics dem
on SUBSTRING(err.FirstName, 1, 3)=SUBSTRING(dem.FirstName, 1,3)

/* Upper & lower */
select FirstName, LOWER(FirstName) from EmployeeErrors;


