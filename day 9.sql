-- Data Models 
-- Primary key 
-- Forign key 
-- Types of Realtionship 

-- todays topic ==> Subquery / nested query( query with a query)
-- ( ek query ka result kisi or query pe depend karta hai )
-- inner query and outer query 

use sakila;
select * from payment;
select * from payment where amount >0.99;

select amount from payment where payment_id = 20;
select * from payment where amount >2.99;

select payment_date , month(payment_date) from payment where payment_id=3;
select * from payment where month(payment_date) =6; 

-- sub Query 
-- first solve the inner query then 
-- after first query solve the outer query  

select * from payment where month(payment_date) = (select month(payment_date) from payment where payment_id=3);

  select * from payment where amount=(select amount from payment where payment_id =15);

 
