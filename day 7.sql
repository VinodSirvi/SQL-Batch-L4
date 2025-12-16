-- group by 
use world;
select region , count(name) from country group by region;
select district , count(name) as TotalCity from city group by district;

-- where ( sabse pehle execute) => group by => count()
select district , count(name) as totalcity from city where population >100000 group by district;

-- get total country which got indep after 1950 in each continent
select continent , count(name) from country where indepyear>1950 group by continent;

-- having clause

-- where will only filter the data which exist on our original table.
-- difference between having and where clause
-- where clause is use to filter the dsta from the table but on the other hand having is uesed to filter the data on aggrigate column

-- having to filter the data based on aggregate column like sum , count , max
select continent , sum(population) from country group by continent having sum(population)>100;
select * from country;
select continent , sum(population) from country where lifeexpectancy >35 group by continent;

-- 1.you need to find out the total country for each governmentform wjere the total numbr of country should be greater then 30 
-- 2.only for the countries having there capital greater then 30 and total population greate then 3 lakh 

select governmentform , count(name) from country group by governmentform having count(name)>30; 
select governmentform , count(name) , sum(population) from country where capital >30  group by governmentform having sum(population)>300000;

select continent , region , count(name) from country group by continent , region;
