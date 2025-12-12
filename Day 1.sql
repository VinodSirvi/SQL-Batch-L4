select database();
-- change to world database
use world;
-- tables
show tables;

-- to see the structure of table
describe city;

-- to print the data of a table 
select * from city;

-- to access column

select name , population from city;

-- columns can be prints in any order;

select population , name , district from city;

-- only show not update
select name , population , population+10 from city;

-- query can be written in multiple line 

select name , population ,
       countrycode , 
       population from city;
       
-- sql is not case sensitive 

SElect naME , poPulation from City;

-- alias ( nickename)
select * , population+12-13+12 as 'newpopulation' from country;


       