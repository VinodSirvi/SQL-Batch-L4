use world;

-- where clause
select * from city where countrycode='ARG';
select * from city where population>600000;

-- not equal to ( != , <> )
select * from city where countrycode<>'ARG';

-- in operator (getting countries in below continents) 
-- in operators is used to retrive data in the set of specific values;
select * from country where continent in ('north America' , 'Europe' , 'Asia', 'India');

-- not in
select * from country where continent not in ('north America' , 'Europe' , 'Asia', 'India');

-- indepyear

select name , continent , indepyear from country where indepyear in (1901 , 1960);

-- between operator ( Range of values )
select name , indepyear , continent from country where indepyear between 1901 and 1960;

-- not between 
select name , indepyear , continent from country where indepyear not between 1901 and 1960;



-- 1 get the code the coyntry name and the region where the region is not middle east 
-- 2 get the name indepyear and population with a expected 10% increment in population 
-- 3 get all the columns of the contry where live expentencty is 38.3 or 66.4
-- 4 get the name , continwnt , pupultion and gmp columns from the table where the population 
-- not from 5,000 to 200,000  

desc country;
select * from country;

select name , region from country where region != 'Middle East';

select name ,indepyear , population , population+population*0.10 as updatedPopulation from country ;

select * from country where lifeexpectancy in ( 38.3 , 66.4 );

select name , continent , population , gnp from country where population not between 5000 and 200000;



-- like operator
-- pattern ko search karna

select name , region from country where region like 'Middle East';

-- special character is called as wildcard character
-- % [ we are finding zero or more character]  Asia%

-- a% [ starting me A ko find karega ]
select name , region from country where region like 'a%';

-- %a [ end me a ko find karega ]
select name , region from country where region like '%a';

-- %a% [ puri string me search karega ]
select name , region from country where region like '%a%';


-- _ [ underscore ] = character skip karega fir find karega [ 1 underscore = 1 char]

select name , region from country where region like 'as__';


-- sql logical operator padhna hai 
-- string functions 



  
  
   
  
  
  
  



