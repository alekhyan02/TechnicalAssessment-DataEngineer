SELECT 
    user_id, 
    SUM(revenue) AS total_revenue,
    COUNT(*) AS total_transactions,
    AVG(revenue) AS avg_revenue_per_transaction
FROM marketing_db.processed_data
WHERE revenue IS NOT NULL
GROUP BY user_id
ORDER BY total_revenue DESC;

