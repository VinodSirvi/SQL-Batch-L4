use sakila ;
-- multi row subquery ( we cant use < > <= >= = != operator);
-- in , any and all operator ( used with multiline subquery)
select * from payment where amount in ( select amount from payment where payment_id = 1 or payment_id = 2);

-- =any ( dono me se kisi ke bhi barabar ) (=any , >any , <any)
select * from payment where amount =any( select amount from payment where payment_id = 1 or payment_id = 2);

-- all ( sabme se copmare karega) 
select * from payment where amount >all( select amount from payment where payment_id = 1 or payment_id = 2);
