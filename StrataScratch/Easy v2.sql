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

