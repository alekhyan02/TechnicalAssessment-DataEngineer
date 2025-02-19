SELECT channel, 
       SUM(spend) AS total_spend,
       SUM(impressions) AS total_impressions,
       SUM(clicks) AS total_clicks,
       SUM(installs) AS total_installs
FROM marketing_db.raw_data
GROUP BY channel
ORDER BY total_spend DESC;

