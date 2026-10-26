DROP FUNCTION IF EXISTS calculate_year_difference;

DELIMITER //

CREATE FUNCTION calculate_year_difference(input_year INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jan_first DATE;
    DECLARE diff INT;
    SET jan_first = MAKEDATE(input_year, 1);
    SET diff = TIMESTAMPDIFF(YEAR, jan_first, CURDATE());
    RETURN diff;
END //

DELIMITER ;

SELECT 
    id,
    country_id,
    Year,
	calculate_year_difference(Year) AS calculated_year_diff
FROM infectious_data;