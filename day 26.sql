-- 22nd January - Driver file for practice

use regex_l4;
CREATE TABLE drivers (
  driver_id   INT PRIMARY KEY,
  driver_name VARCHAR(50) NOT NULL,
  base_area   VARCHAR(50) NOT NULL
);

-- -------------------------
-- Create table: trips  (DATE column included)
-- -------------------------
CREATE TABLE trips (
  trip_id      INT PRIMARY KEY,
  driver_id    INT NOT NULL,
  trip_date    DATE NOT NULL,
  distance_km  DECIMAL(5,1) NOT NULL,
  fare         INT NOT NULL,
  rating       DECIMAL(3,1) NOT NULL,
  CONSTRAINT fk_trips_driver
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- -------------------------
-- Insert data: drivers (4 rows)
-- -------------------------
INSERT INTO drivers (driver_id, driver_name, base_area) VALUES
(1, 'Asha',  'Indiranagar'),
(2, 'Ravi',  'Koramangala'),
(3, 'Meera', 'Whitefield'),
(4, 'Kabir', 'HSR Layout');

-- -------------------------
-- Insert data: trips (10 rows)
-- -------------------------
INSERT INTO trips (trip_id, driver_id, trip_date, distance_km, fare, rating) VALUES
(101, 1, '2025-11-01', 12.0, 350, 4.8),
(102, 1, '2025-11-02',  5.5, 180, 4.6),
(103, 2, '2025-11-01',  8.0, 260, 4.9),
(104, 2, '2025-11-03', 15.0, 500, 4.7),
(105, 3, '2025-11-02',  3.0, 120, 4.2),
(106, 3, '2025-11-04', 22.0, 780, 4.9),
(107, 4, '2025-11-01',  6.0, 210, 4.5),
(108, 4, '2025-11-03',  9.0, 300, 4.4),
(109, 4, '2025-11-04',  4.0, 150, 4.8),
(110, 1, '2025-11-04', 18.0, 620, 4.9);

-- Quick check
SELECT * FROM drivers ;
SELECT * FROM trips ;




-- Question: For each trip_date, show number of trips, total fare, and average rating.
select trip_date , count(*) , sum(fare) , avg(rating) from trips group by trip_date ;


-- Question: By base_area, show total trips, total fare, and average distance.

select d.base_area ,  count(*)  , sum(t.fare) , avg(t.distance_km) from drivers as d
join trips as t 
on d.driver_id = t.driver_id 
group by d.base_area;



-- Rating buckets count (>=4.8 as “High”, else “Other”) rating_bucket trips

 -- select buckets count( rating >= 4.8 as "high" , esle "other")  over(order by rating) from trips ;

-- Days where total fare >= 800 (GROUP BY + HAVING)

select trip_date , sum(fare) from trips group by trip_date having sum(fare) >= 800 ;


-- Base-area average rating, only areas with avg rating >= 4.7 (HAVING)
SELECT * FROM drivers ;
 SELECT * FROM trips ;
 
 select d.base_area , avg(t.rating) as avg_rating from drivers as d 
 join trips as t 
 on d.driver_id = t.driver_id 
 group by d.base_area 
 having avg(t.rating) >=4.7;
 
 -- Trips with fare greater than the overall average fare (single-row subquery)
-- trip_id  ,  driver_id ,  fare

select trip_id , driver_id , fare from trips where fare > ( select avg(fare) from trips );

-- Drivers who have at least one trip rated 4.9 (multi-row IN subquery)
-- driver_id , driver_name
 
 select driver_id , driver_name from drivers where driver_id in ( select driver_id from trips  where rating = 4.9 ) ;
 
 -- Drivers whose total fare is greater than the average total fare per driver
-- Hint: (subquery on aggregated derived table) Hard level
-- driver_id , driver_name  , total_fare
 
select d.driver_id , d.driver_name , sum(t.fare) from drivers as d 
join trips as t 
on d.driver_id = t.driver_id 
group by d.driver_id , d.driver_name 
having sum(t.fare) > ( select avg(total_fare) from ( select sum(fare) as total_fare from trips group by driver_id ) as derived_table ) ;

-- Latest trip per driver
-- driver_id trip_id trip_date fare

-- select driver_id , trip_id , trip_date , fare  from trips where driver_id in ( select driver_id from trips group by driver_id having 

select driver_id , trip_id , trip_date , fare from ( select * , row_number() over(partition by driver_id order by trip_date desc) as rn from trips ) as t where rn =1; 

-- Row number of trips per driver ordered by date (then trip_id)
-- driver_id , trip_id  , trip_date ,  rn

select driver_id , trip_id , trip_date , row_number() over(partition by driver_id order by trip_date) from trips ;

-- Running total fare per driver over time 
-- driver_id , trip_id , trip_date , fare , running_fare

select driver_id , trip_id , trip_date , fare , sum(fare)  over( partition by driver_id order by fare asc) from trips ;

-- Rank trips by fare within each driver (highest fare rank 1)
-- driver_id , trip_id  , fare  , fare_rank
select driver_id , trip_id , fare , rank() over(partition by driver_id order by fare desc) from trips ;


-- Show each trip’s fare minus the driver’s average fare (window AVG)
-- driver_id  , trip_id ,  fare , diff_from_avg
select driver_id , trip_id , fare , avg(fare) over(partition by driver_id ) ;

-- For each driver, show the previous trip’s fare (LAG) ordered by date
-- driver_id , trip_id  , trip_date ,  fare  , prev_fare

select driver_id , trip_id , trip_date , fare , lag(fare) over(partition by driver_id order by trip_date) from trips ;
