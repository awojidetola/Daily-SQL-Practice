--User Events by Macbook Pro Users (Apple)
/*
Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.
*/

SELECT event_name, COUNT(*) AS event_count
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY event_name
ORDER BY event_count DESC;

--Order Details (Amazon, Shopify)
/*Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.*/

SELECT c.first_name, o.order_date, o.order_details, o.total_order_cost
FROM customers AS c
JOIN orders AS o
ON c.id = o.cust_id
WHERE c.first_name IN ('Jill', 'Eva')
ORDER BY c.id DESC;

--Profitable Company Financial Sector (Forbes)
/*Find the most profitable company from the financial sector. Output the result along with the continent.*/
SELECT company, continent
FROM forbes_global_2010_2014
WHERE sector = 'Financials'
ORDER BY profits DESC
LIMIT 1;

--Average Salaries using Window Functions (Salesforce, Glassdoor)
/*Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.*/

SELECT department, first_name, salary, AVG(salary) OVER (PARTITION BY department) AS avg
FROM employee;

--Library Preferences (City of San Francisco)
/*Find libraries who haven't provided the email address in circulation year 2016 but their notice preference definition is set to email.
Output the library code.*/

SELECT home_library_code 
FROM library_usage
WHERE (circulation_active_year = '2016') AND (provided_email_address = FALSE) AND (notice_preference_definition = 'email')
GROUP BY home_library_code
ORDER BY home_library_code;

--Churro Activity Date (City of Los Angeles)
/*Find the activity date and the pe_description of facilities with the name 'STREET CHURROS' and with a score of less than 95 points.*/
SELECT activity_date, pe_description 
FROM los_angeles_restaurant_health_inspections
WHERE facility_name = 'STREET CHURROS' AND score < 95

--Police Base Pay (City of San Francisco)
/*Find the base pay for Police Captains.*/

SELECT employeename, basepay
FROM sf_public_salaries
WHERE jobtitle = 'CAPTAIN III (POLICE DEPARTMENT)'

--Salary Differences (DropBox, LinkedIn)
/*Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.*/

SELECT(ABS(
(SELECT MAX(e.salary) FROM db_employee AS e
JOIN db_dept AS d
ON e.department_id = d.id
WHERE d.department = 'engineering')- 
(SELECT MAX(e.salary) FROM db_employee AS e
JOIN db_dept AS d
ON e.department_id = d.id
WHERE d.department = 'marketing')))

--Spotify Ranking List (Spotify)
/*Find how many times each artist appeared on the Spotify ranking list
Output the artist name along with the corresponding number of occurrences.
Order records by the number of occurrences in descending order.*/

SELECT artist, COUNT(*) AS n_occurences
FROM spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY n_occurences DESC;

--Lyft Driver Wages (Lyft)
/*Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
Output all details related to retrieved records.
*/
SELECT * FROM lyft_drivers
WHERE (yearly_salary <= 30000) OR (yearly_salary >= 70000);

--Finding updated records (Microsoft)
/*We have a table with employees and their salaries, however, 
some of the records are old and contain outdated salary information. 
Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. 
Order your list by employee ID in ascending order.*/

SELECT id,first_name, last_name, department_id, MAX(salary) AS max_salary
FROM ms_employee_salary
GROUP BY first_name, last_name,department_id,id
ORDER BY id;

--Popularity of Hack (Meta)
/*Meta/Facebook has developed a new programing language called Hack.To measure the popularity of Hack they ran a survey with their employees. The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack. Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. Luckily the user IDs of employees completing the surveys were stored.
Based on the above, find the average popularity of the Hack per office location.
Output the location along with the average popularity.*/

Select e.location, AVG(s.popularity) from facebook_hack_survey As s
Join facebook_employees As e
On e.id =s.employee_id
Group by e.location;

--Number of Shipments per Month (Amazon)
/*Write a query that will calculate the number of shipments per month. The unique key for one shipment is a combination of shipment_id and sub_id. Output the year_month in format YYYY-MM and the number of shipments in that month.*/
select 
to_char(shipment_date, 'YYYY-MM') as year_month,
COUNT(shipment_id+sub_id) as count
from amazon_shipment
group by year_month
order by count desc;

--Most Lucrative Products (Meta)
/*You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 (from January to June inclusive).
Output their IDs and the total revenue.*/

SELECT product_id,  SUM(cost_in_dollars * units_sold) AS revenue
FROM online_orders
WHERE date BETWEEN '2022-01-01' AND '2022-06-30'
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 5;

--Posts with Hearts (Meta)
/*Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.*/

SELECT DISTINCT p.post_id, p.poster, p.post_text, p.post_keywords, p.post_date
FROM facebook_posts AS p
JOIN facebook_reactions AS r
ON p.post_id = r.post_id
WHERE r.reaction = 'heart';