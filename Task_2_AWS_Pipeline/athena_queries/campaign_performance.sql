SELECT campaign, 
       COUNT(user_id) AS total_conversions, 
       SUM(revenue) AS total_revenue, 
       SUM(revenue) / NULLIF(SUM(spend), 0) AS ROAS
FROM marketing_db.raw_data
GROUP BY campaign
ORDER BY total_revenue DESC;

