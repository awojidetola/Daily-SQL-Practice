StrataScratch

-- Bike Last Used (Door Dash Interview)
/*Find the last time each bike was in use. Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned). Order the results by bikes that were most recently used.
*/

SELECT 
bike_number, 
MAX(end_time)
FROM 
dc_bikeshare_q1_2012
GROUP BY 
bike_number;

--Admin Employees (Google Interview)
/*Find the number of employees working in the Admin department that joined in April or later.*/
SELECT COUNT(*)
FROM worker
WHERE department = 'Admin' AND 
EXTRACT(MONTH FROM joining_date) >= 4;

--Employees by Deparment (Amazon Interview)
/*Find the number of workers by department who joined in or after April.*/

SELECT department, COUNT(*) AS num_workers
FROM worker
WHERE EXTRACT(MONTH FROM joining_date) >= 4
GROUP BY department;

--Bathrooms and Bedrooms (Airbnb Interview)
/*Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.*/

SELECT city, property_type, AVG(bathrooms) AS n_bathrooms_avg, AVG(bedrooms) AS n_bedrooms_avg
FROM airbnb_search_details
GROUP BY city, property_type;

--Customer Details (Amazon, Apple)
/*Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
You may have duplicate rows in your results due to a customer ordering several of the same items. Sort records based on the customer's first name and the order details in ascending order.*/

SELECT c.first_name, c.last_name, c.city, o.order_details
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.cust_id
ORDER BY c.first_name ASC, o.order_details ASC


--Reviews of Hotel Arena (Airbnb)
/*Find the number of rows for each review score earned by 'Hotel Arena'. Output the hotel name (which should be 'Hotel Arena'), 
review score along with the corresponding number of rows with that score for the specified hotel.*/

SELECT hotel_name, reviewer_score, COUNT(*)
FROM hotel_reviews
WHERE hotel_name = 'Hotel Arena'
GROUP BY reviewer_score, hotel_name

--Abigail Breslin Oscar(Google Netflix)
/*Count the number of movies that Abigail Breslin was nominated for an oscar.*/

SELECT COUNT(*)
FROM oscar_nominees
WHERE nominee = 'Abigail Breslin'

--Unique Users per Month (Apple, Microsoft, Dell)

/*Write a query that returns the number of unique users per client per month*/
SELECT client_id, EXTRACT(MONTH from time_id) AS month, COUNT(DISTINCT user_id) AS users_num
FROM fact_events
GROUP BY client_id, EXTRACT(MONTH from time_id);