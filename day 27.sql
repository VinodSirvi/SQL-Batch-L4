-- TCL ( transaction control language )
-- transaction ko control karna 
-- set of logical statment ( ese changes jo permanent nhi hai ) 
-- insert , update , delete jo bhi kar rahe hai usko permanently save karne ka tarika TCL 
use regex_l4;
create table actor_cp as select actor_id , first_name from sakila.actor where actor_id between 1 and 5 ;
 
 select * from actor_cp;
 insert into actor_cp values (6 , "tushar");
 
 -- autocommit => by default enabled
 
 set @@autocommit = 0;
 select @@autocommit;
 
 -- in case if you run any dml operation and you start write down any transaction keyword 

-- how to start transaction ?
-- by making autocommit = 0 
-- or using start transcaction 

-- == close transaction =======
 -- when my transaction is going to automatically closed 
 -- use any tcl statement like commit or rollback 
 -- in case if i run any ddl operation like create , alter then still transaction closed 
 
 -- commit to make the changes permanent 

-- purani state par jana hai jaha last save kiya tha toh rollback use karo 

 insert into actor_cp values (7 , "tushar");
 select * from actor_cp ;

-- pending statement me rahega   
start transaction ;
insert into actor_cp values (13 , "flipkart");
select * from actor_cp;
create table xyz( id int ); 

start transaction ; 
insert into actor_cp values(18, 'asdfasfddfsf');
insert into actor_cp values(19 , "fffdgfgdfg");
savepoint db_checkpoint1;
delete from actor_cp where actor_id in (13);
rollback to db_checkpoint1;
select * from actor_cp;


select * from actor_cp;
drop  table actor_cp;

create table actor_cp as select actor_id , first_name from sakila.actor where actor_id between 1 and 5 ;
select * from actor_cp;





