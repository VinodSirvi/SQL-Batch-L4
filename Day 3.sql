-- 1 get the name , continent , region form the country table where the continent is not same as europe.alter
-- 2 -where the second latter of a region is a .
-- 3 where the continent the last third character is i
-- 4 where the continent should be of minimum five characters.
-- 5 where in the continent the second latter is c and second last char is i.
-- 6 where  at least two A seprate with the character,
         
   use world;
  select name , continent , region from  country  where continent <> 'Europe';
  select name , continent , region from  country  where region like '_a%';
  select name , continent , region from  country  where continent like '%i__';
  select name , continent , region from  country  where continent like '%_____%';
  select name , continent , region from  country  where continent like '_c%i_';
  select name , continent , region from  country  where region like '%a_a%';
  