SELECT * FROM pet.petrescue;

#Aggregation Functions
#1.Write a query that calculates the total cost of all animal rescues in the PETRESCUE table.
select sum(COST) from petrescue;

#2.Write a query that displays the maximum quantity of animals rescued (of any kind).
select max(ANIMAL) from petrescue;
SELECT MAX(QUANTITY) FROM PETRESCUE;

#3.Write a query that displays the average cost of animals rescued.
select avg(cost) from petrescue;

#4.Write a query that displays the rounded integral cost of each rescue.
select round(COST) from petrescue;

#5.Write a query that displays the length of each animal name.
select distinct ANIMAL, length(ANIMAL) from petrescue;

#6.Write a query that displays the animal name in each rescue in uppercase.
select distinct ucase(animal) from petrescue;


#Date Functions
#1.Write a query that displays the day of the month when cats have been rescued. 
select day(rescuedate) from petrescue where animal="cat";

#2.Animals rescued should see the vet within three days of arrival. Write a query that displays the third day of each rescue. 
select date_add(rescuedate, interval 3 day) as vactinationDate from petrescue;

#3.Write a query that displays the length of time the animals have been rescued, for example, the difference between the current date and the rescue date 
select FROM_DAYS(datediff(current_date, rescuedate)) as under_observation from petrescue;

#Practice Problems:
#1.Write a query that displays the average cost of rescuing a single dog. Note that the cost per dog would not be the same in different instances
select avg(cost/QUANTITY) from petrescue where animal = "dog";

#2.Write a query that displays the animal name in each rescue in uppercase without duplications. 
select distinct ucase(ANIMAL) from petrescue;

#3.Write a query that displays all the columns from the PETRESCUE table where the animal(s) rescued are cats. Use cat in lowercase in the query. 
select * from petrescue where lcase(ANIMAL) = "cat";

#4.Write a query that displays the number of rescues in the 5th month. 
select sum(QUANTITY) from petrescue where month(RESCUEDATE) = 5;

#5.The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. Write a query that displays the ID and the target date. 
select id, date_add(rescuedate, interval 1 year) as target_date from petrescue;