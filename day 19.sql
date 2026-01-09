-- data types in sql 
-- numaric => int, float , decimal , tinyint , medium ,big int , small int ,int 
-- 1 byte => 8 bit ( 2**8) => 256

-- TINY INT (-128 to 127 )
use regex;
create table test9 (id tinyint);
insert into test9 values(1) , (-128) , (127);
insert into test9 values(128);

-- ( 0 to 255 )
create table test10 ( id tinyint unsigned);
insert into test10 values(129) , (255);
select * from test10;

-- DECIMAL 
-- float ( point ke baad 2-3 value hi rakhega)
create table test11 ( id float);
insert into test11 values(129.238982) , (255.23342);
select * from test11;

-- double ( point ke baad puri value rakhega )
create table test12 ( id double);
insert into test12 values(129.238982) , (255.23342);
select * from test12;

-- double with () 
create table test13 ( id double(5,2));
insert into test13 values(129.238982) , (255.23342);
select * from test13;

-- varchar and char 
-- vharchar is datatype => string / character values
-- char => characterbut of fix length of character 

-- maximum 200 character  (it will not count the size of the character its only count the char by 1 )
create table test14 ( name  char(10));
insert into test14 values('abc') , ('wwrewerer');
insert into test14 values('aaaaaaaaaaaaa'); -- maximum size reached error 




