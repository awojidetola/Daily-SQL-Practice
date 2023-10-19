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

