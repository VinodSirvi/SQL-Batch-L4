-- CASE statement (conditional statement in SQL)
use world ;

select name , population ,
CASE 
when population >100000 then 'large population'
when population >= 50000 then ' medium population'
when population >=8000 then 'small population'
else ' very small '
END
as ConditionPopulation from world.country;


-- group by with CASE 
select count(*),
CASE 
when population >100000 then 'large population'
when population >= 50000 then ' medium population'
when population >=8000 then 'small population'
else ' very small '
END
as ConditionPopulation from world.country Group by ConditionPopulation;

--  using aggregate function on CASE statement 
select continent ,
sum(CASE 
when population >=50000 then 1 else 0 
end ) as goodjob
from world.country group by continent ;

