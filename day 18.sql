-- constraints in sql 
-- rules that we apply to limit the data in the table 
-- why use ?
-- to maintain the accurecy and the relaibility 

-- table creation 
-- structure ( DDL ) -> create , alter , drop , truncate 

use regex ;
create table test1 ( sno int );
desc test1;

-- inserting data ( DML) -> insert 
insert into test1 values(10);
insert into test1(sno) values(20);
insert into test1(sno) values(null) ,(20);
select count(sno) , count(*) from test1;
select * from test1;

-- NOT NULL constraint
create table test2 ( sno int not null , salary int );
insert into test2(sno , salary) values(10 , 2000);
insert into test2(sno , salary) values(null , 200);
insert into test2(salary) values(20004);

create table test3(sno int not null default 80 , salary int );
insert into test3(salary) values( 3000);
insert into test3(sno) values(5000);
select * from test3;


-- UNIQUE constraint ( values cannot be duplicate , accept multiple null values)
create table test4(sno int not null , salary int unique default 100);
insert into test4(sno , salary) values(1000 , 2000);

-- error : duplicate value in salary
insert into test4(sno , salary) values(1001 , 2000);
insert into test4(sno ) values(1003);

-- error : duplicate default value 
insert into test4(sno) values(1004);

-- accept multiple null values 
insert into test4(sno , salary) values(1005 , null);
insert into test4(sno , salary) values(1005 , null);
select * from test4;


-- CHECK constraint
create table test6(sno int , salary int   ,
 constraint regex_test5_sno_check check (sno between 1 and 100 ),  -- give the name of check condition to know where is the error 
 constraint regex_test5_salary_check check ( salary in(1000 ,2000)));
 
 insert into test6(sno , salary) values(1 , 1000);
 insert into test6(sno , salary) values(123 , 2500);
 
 -- PRIMARY KEY 
 create table test8(sno int primary key , salary int );
 insert into test8(sno , salary) values(4 , 100);
 insert into test8(sno  , salary) values(4 , 100);  -- error duplicate value in sno 
 
 -- FORIGN KEY 
 create table customer1( cid int primary key , cname varchar(20));
 insert into customer1 values(10 , "aman") , (11 , "ajay");
 select * from customer1;
 
 create table order1(order_no int primary key , city varchar(20), cid int,
 foreign key (cid) references customer1(cid));
 
 insert into order1 values(1007 , "jaipur" ,10) , (1008 , "ajamer" ,11);
 insert into order1 values(1009 , "goa" , 25); -- error cid - 25 is not in customer table ;
 select * from order1;
 




