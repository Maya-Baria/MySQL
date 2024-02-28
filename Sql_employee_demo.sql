SELECT * FROM parks_and_recreation.employee_demographics;
select first_name from employee_demographics;
select distinct(gender) from employee_demographics;
select * from employee_demographics where gender = "male";
select count(*) from employee_demographics where gender = "female";

insert into employee_demographics(employee_id, first_name, last_name, age, gender, birth_date)
values(13, "Suzen", "Peter", 26, "Female", '1983-06-14');
#select * from employee_demographics;

UPDATE employee_demographics 
SET gender = 'female' 
WHERE first_name = 'Andy' AND employee_id = 10;
#select * from employee_demographics;

delete from employee_demographics where employee_id = 8;
#select * from employee_demographics;

