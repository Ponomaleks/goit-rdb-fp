SELECT 
    c.Entity,
    c.Code,
    c.id AS country_id,
    AVG(d.Number_rabies) AS avg_rabies,
    MIN(d.Number_rabies) AS min_rabies,
    MAX(d.Number_rabies) AS max_rabies,
    SUM(d.Number_rabies) AS sum_rabies
FROM infectious_data d
JOIN countries c ON d.country_id = c.id
WHERE d.Number_rabies IS NOT NULL
  AND d.Number_rabies != ''
GROUP BY c.id, c.Entity, c.Code
ORDER BY avg_rabies DESC
LIMIT 10;