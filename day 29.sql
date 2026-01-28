-- hierarchical / recursive CTE


-- ======= union ============
use sakila ;
select actor_id , first_name from sakila.actor where actor_id between 1 and 4 
union 
select actor_id , first_name from sakila.actor where actor_id between 3 and 5 ;

-- note --> dono query me number of selected columns same hone chahiye , unko aage pichhe likh sakte hai 

select actor_id , first_name from sakila.actor where actor_id between 1 and 4 
union all
select  first_name , actor_id   from sakila.actor where actor_id between 3 and 5 ;

-- ======= recursive cte ================

with recursive cte as (    -- recursive keyword 
select 10 as num          -- assigning values to the num column (starting point )
union all    
select num+1 from cte     -- cte call karna 
where num <15 )           -- terminating condition (stop point )
select * from cte ;         


-- employee hierarchy
use test; 
CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);


INSERT INTO employees (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie




with xyz as (
select employeeid , name , name as hierarchy_path from employees where managerid is null 
)
select employeeid , name , concat(employees.name , '->' , xyz.name) from employees join xyz where employees.managerid = xyz.employesid;



with recursive cte as (
select employeeid , name , name as hierarchy_path from employees where managerid is null 
union all 
select e.employeeid , e.name , concat(e.name , '->' , cte.hierarchy_path) from employees as e 
join cte 
on e.managerid = cte.employeeid and e.employeeid < 5 )
select * from cte;

-- learning assignment --
-- what is views 
