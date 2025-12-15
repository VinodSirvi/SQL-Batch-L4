use world;

-- // numaric functions , dates
-- 1. round function ( if point ke baad wali value greater then 5 ho toh round figure hokar next value me convert ho jayegi or point hat jayga)
select lifeexpectancy , round(lifeexpectancy) from country;

-- 
select 83.62 , round(83.647 ,2);

-- ( -1 = one place (10) -2 = ( hundered 100 ) -3 (1000)
select (456.23) , round(476.23, -2);

-- truncate // extract the decimal value ( 3 matlab Sirf 3 decimal value hi print karega )
select 456.67 , round(456.68,1) , truncate(456.67223,3);

-- mod (remainder kya bachega )
select  mod(30,3);

-- pow() , ceil , floor  ( pow => power nikalega , ceil => agar point ke badd koi bhi value ho toh sidha next integer value me convert)
-- floor ( interger value ke baad kitne bhi point wali value ho toh remove karega)
select pow(2,3) , ceil(3.00008) , floor(3.99999);

-- // date functions 

-- date 
-- inbuilt date ya date and time print karna 
select now(), curdate(), current_timestamp(), current_time();

-- adddate
-- adddate(now(),2) => date ko aage increase kar dega  //  interval -3 month => 3 month pichhe chala jayega 
select now() , adddate(now(),2) , adddate(now(), interval -3 month) , year ( now());

-- subdate
select now(), subdate( now(), 2);

-- extract 
select now() , extract( year from now() );

-- date format 
select now(), date_format(  now(), 'month is %M & year is %y');



