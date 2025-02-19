SELECT user_id, 
       SUM(revenue) AS lifetime_value
FROM marketing_db.raw_data
GROUP BY user_id
ORDER BY lifetime_value DESC
LIMIT 10;

