SELECT 
    id,
    country_id,
    Year,
    MAKEDATE(Year, 1) AS jan_first_date,
    CURDATE() AS current_date_value,
    TIMESTAMPDIFF(YEAR, MAKEDATE(Year, 1), CURDATE()) AS year_difference
FROM infectious_data;