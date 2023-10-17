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
