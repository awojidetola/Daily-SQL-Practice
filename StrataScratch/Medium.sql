--Reviews of Categories (Yelp)
/*
Find the top business categories based on the total number of reviews. Output the category along with the total number of reviews. Order by total reviews in descending order.
*/

SELECT 
UNNEST(STRING_TO_ARRAY(categories, ';')) AS category, SUM(review_count) AS total_reveiw
FROM yelp_business
GROUP BY category
ORDER BY total_reveiw DESC;

--Top Cool Votes (Yelp)
/* Find the review_text that received the highest number of  'cool' votes.
Output the business name along with the review text with the highest numbef of 'cool' votes.
*/

SELECT business_name, review_text
FROM yelp_reviews
ORDER BY cool DESC
LIMIT 2;

