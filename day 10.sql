-- primary key explanation

use world;
-- id is primry key in city table
select count(id) , count( distinct id) , count(population) , count(distinct population) from city;

-- country code is primary key
select * from country;

select * from city;
select ct.name , ct.countrycode from city as ct;

select * from country;
select cnty.code , cnty.name from country as cnty;

-- SQL joins ============================================================================================= 
select ct.name , ct.countrycode , cnty.code from city as ct 
join country as cnty 
where ct.countrycode = cnty.code;

select cnty.code , cnty.name from country as cnty;

-- question 1 => you need to find the country name , population of the city along with the government form in that city with the population 
-- from highest to the lowest 

select * from city ;
select * from country;
desc country;
select * from countrylanguage;
desc countrylanguage;

select ct.name , ct.population , cnty.governmentform from city as ct 
join country as cnty 
where ct.countrycode = cnty.code order by ct.population asc;

-- question 2 ==>
-- 1. country 2, country language 
-- you need to get country name , population and all the language spoken for each country 


select cnty.name , cnty.population , cntl.countrycode, cntl.language from country as cnty
join countrylanguage as cntl
where cnty.code = cntl.countrycode;
 
-- SAKILA ==========================================================
use sakila;
select * from actor;
select * from film_actor;
desc film_actor;
select count(film_id) , count(distinct film_id) from film_actor; 

-- find out get the actor id and the first name along with its film id 
select act.actor_id , act.first_name , fact.film_id from actor as act 
join film_actor as fact
where act.actor_id = fact.actor_id;

select * from film;
select * from actor;
select * from film_actor;
-- actor , film , film_actor
select act.actor_id , act.first_name , fact.film_id , fm.title from actor as act 
join film_actor as fact 
join film as fm 
where act.actor_id = fact.actor_id and fact.film_id = fm.film_id ;



