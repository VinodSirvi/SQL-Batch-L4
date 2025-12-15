 -- aggregate function ( multiline function )
 -- to perform the calculation on set of rows
 -- date , string , number 
 
 use world;
select * from country;
-- 1. Count
-- jaha data null hai us row ko count nhi karega  or rows ka count batayega 
select count(indepyear) from country;

-- sabhi row ko count karega or total rows kitni hai vo batayega 
select count(*) from country;


-- 2. distinct ( unique value nikal kar dega )
select distinct  continent  from  country;
select distinct continent , region from country;

-- sum , average 
select count(population) , sum(population) , avg(population) from country;

select governmentform from country;

select  count(name) , sum(population) , count(distinct indepyear) from country where continent = 'Africa';

-- question.1 ( get the total countries the avg surface area the & total population for the countries wihch 
-- got there indep from the year 1947 - 1998 ( make sure the year should not included)

select * from country ;

select count(name) , avg(surfacearea) , sum(population) from country where indepyear  > 1947 and indepyear < 1998 ;
 
-- question.2 ( get the total number of countries and the number of unique continents along with the avegrage population and the total number of capitals 
-- for the countries starting with a or starting with d ) 

select   count(name) , count(distinct continent),  avg(population) , sum(capital) from country where name like 'a%' or '%d';


-- GROUP BY clause ( similar data ka group bana deta hai )
-- note ( group by ke saath jo column use kar rahe hai sirf wahi select karenge )

select continent , count(*) from country group by continent;

select indepyear , count(*) from country group by indepyear;

select  governmentform , count(name)  from country group by governmentform  ;

select continent , count(name) , sum(population) , avg(population) , max(population) , min( population) ,max(indepyear) , min(indepyear)
from country group by continent;


-- question.3 (form the city table you have to find the total cities , the total district , unique district , the total population from the city table )
select * from city;
select  countrycode, count(name) , count( district) ,count( distinct district) , sum(population) from city group by countrycode;






