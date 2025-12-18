use sakila ;
select * from payment;
select count(*) from payment where customer_id = 1;
select customer_id,  count(payment_id) from payment group by customer_id;
-- you need to find outy the number of transaction for each customer where the amoutn of the rtransaction should be greater then 3

select customer_id , count(payment_id) from payment where amount > 3 group by customer_id;

-- you need to find the total number of transaction for each amount in the month of may.

select payment_id , extract(month from payment_date)   from payment  where month(payment_date) =5;
select amount , count(*) from payment where month(payment_date) =5 group by amount;

-- you need to find out the maximum amount is spend the avg amount sepnt and the toal amount amount spent spent for each staff;
-- you need   only for customer id 1 3 7 11 ;

select customer_id, max(amount) , avg(amount) , sum(amount) from payment group by customer_id;
select customer_id , max(amount) , avg(amount) , sum(amount) from payment where customer_id in(1,3,7,11) group by customer_id; 

-- find  the total amount spent and the number of customer who have done the payment in each month 
-- where the amount spent should be greater then 1 dollar 
 
select month(payment_date) , sum(amount) , count(customer_id) from payment where amount>1 group by month(payment_date);