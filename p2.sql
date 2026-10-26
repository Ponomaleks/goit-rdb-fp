DROP TABLE IF EXISTS infectious_data;
DROP TABLE IF EXISTS countries;

CREATE TABLE IF NOT EXISTS countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Entity VARCHAR(255) NOT NULL UNIQUE,
    Code VARCHAR(10) NULL
);

INSERT INTO countries (Entity, Code)
SELECT TRIM(Entity), NULLIF(MAX(Code), '') AS Code 
FROM infectious_cases
WHERE Entity IS NOT NULL
GROUP BY TRIM(Entity);

CREATE TABLE IF NOT EXISTS infectious_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL,
    Year INT NOT NULL,
    Number_yaws INT NULL,
    polio_cases INT NULL,
    cases_guinea_worm INT NULL,
    Number_rabies DOUBLE NULL,
    Number_malaria DOUBLE NULL,
    Number_hiv DOUBLE NULL,
    Number_tuberculosis DOUBLE NULL,
    Number_smallpox INT NULL,
    Number_cholera_cases INT NULL,
    CONSTRAINT fk_country 
        FOREIGN KEY (country_id) 
        REFERENCES countries(id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

INSERT INTO infectious_data (
    country_id, 
    Year, 
    Number_yaws, 
    polio_cases, 
    cases_guinea_worm, 
    Number_rabies, 
    Number_malaria, 
    Number_hiv, 
    Number_tuberculosis, 
    Number_smallpox, 
    Number_cholera_cases
)
SELECT 
    c.id,
    ic.Year,
    NULLIF(ic.Number_yaws, ''),
    NULLIF(ic.polio_cases, ''),
    NULLIF(ic.cases_guinea_worm, ''),
    NULLIF(ic.Number_rabies, ''),
    NULLIF(ic.Number_malaria, ''),
    NULLIF(ic.Number_hiv, ''),
    NULLIF(ic.Number_tuberculosis, ''),
    NULLIF(ic.Number_smallpox, ''),
    NULLIF(ic.Number_cholera_cases, '')
FROM infectious_cases ic
JOIN countries c ON ic.Entity = c.Entity;

SELECT COUNT(*) FROM infectious_cases