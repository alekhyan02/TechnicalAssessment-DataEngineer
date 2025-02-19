SELECT 
    channel, 
    COUNT(*) AS total_interactions,
    SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) AS total_conversions,
    (SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS conversion_rate
FROM marketing_db.processed_data
GROUP BY channel
ORDER BY conversion_rate DESC;

