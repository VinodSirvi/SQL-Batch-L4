-- subquery 
-- query within a query is called as subquery 
-- it is used to perform calculations based on related tables and used to perform calculation based on dynamic conditions

use sakila;
-- query 1
select amount from payment where payment_id = 5;

-- query 2
select * from payment where amount =9.99;

-- sub query
select * from payment where amount =(select amount from payment where payment_id = 5);

-- select * from payment where the staff is surving for payment id 8 ;
select * from payment;

select * from payment where staff_id = ( select staff_id from payment where payment_id = 8);

-- get the payment id , amount and the payment date where the month should be same as of payment id 20 

select payment_id , amount , payment_date from payment where month(payment_date) = ( select month(payment_date) from payment where payment_id =20);

-- get the amount and the total number of payment done for each amount where the amount should be less then the amount of rental id 1725;
select * from payment;

select amount from payment where rental_id = 1725;
select amount , count(*) from payment where amount < (select amount from payment where rental_id =1725) group by amount;

-- get the month and the total amount spend from the payments table where the month is greater then the month of customer id 1 with the payment id 3

select month(payment_date) from payment 

select month(payment_date) , sum(amount) from payment where month(payment_date)>(select month(payment_date) from payment where customer_id=1 and payment_id =3)
group by month(payment_date);

-- single row subquery ( subquery will return only one row);
select customer_id from payment where amount = ( select amount from payment where payment_id = 2);

-- multi row subquery ( we cant use < > <= >= = != operator);
-- in , any and all operator ( used with multiline subquery)
select * from payment where amount in ( select amount from payment where payment_id = 1 or payment_id = 2);











