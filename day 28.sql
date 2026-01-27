-- common table expression (CTE)
-- it is a temprory name of sql query , it will store the result of your query 
-- validation -- > tab tak query ko ; ke saath closed nhi kar dete 
-- they are not store on permanent bases 
-- it will help to break complex query to readable form 
use sakila;
with cte_vinod as 
(select * from sakla.actor where actor_id between 5 and 50)
select * from sakila.actor;

-- ====  rankings
with hello as 
(select *  , dense_rank() over( order by amount desc ) as rankings from sakila.payment )
select * from hello where rankings = 2;

with hello1 as 
(select *  , dense_rank() over( partition by customer_id order by amount desc ) as rankings from sakila.payment )
select * from hello1 where rankings = 2;

-- combination of correlated subquery , cte , join 

-- correlated 
select emp_id , emp_name , department , salary from employee as e 
where salary > ( select avg(salary) from employee where department = e.department);

-- cte 
with cte as (
select department as dept , avg(salary) as deptsalary from employee group by department )
select emp_id , emp_name , department , salary , dept , deptsalary 
from employee as e join cte 
where e.department = cte.dept and salary > deptsalary;

-- learning assignment 
-- DCL ( grant , revoke ) 
-- difference between cte and temporary table 
--  authentacton
 