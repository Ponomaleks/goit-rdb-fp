# GoIT RDB Final Project: Infectious Diseases Database Normalization & Analytics

This project is the final assignment for the Relational Databases (RDB) course. It demonstrates data import, normalization up to the 3rd Normal Form (3NF), aggregation queries, date manipulation using built-in SQL functions, and custom stored functions in MySQL.

---

## Project Structure & Implementation Steps

### 1. Database Creation & Data Import
* Created a dedicated database schema.
* Imported the raw dataset (`infectious_cases`) containing global public health statistics (such as data on yaws, polio, guinea worm, rabies, malaria, HIV, tuberculosis, smallpox, and cholera).
* Handled messy data types and empty string values (`''`) during the staging and import phase.

### 2. Database Normalization (3NF)
To eliminate data redundancy and follow the Third Normal Form (3NF), the original flat table was split into two related tables:
* **`countries`**: A reference table containing unique entities (countries and regions) and their corresponding country codes (`Code`).
* **`infectious_data`**: A fact table storing the annual statistical indicators, linked to the `countries` table via a foreign key (`country_id`) with proper numeric data types (`INT` and `DOUBLE`) and `NULL` support.

### 3. Data Analysis (`Number_rabies` Statistics)
* Filtered out missing/empty values for the `Number_rabies` attribute.
* Grouped the data by country/region.
* Calculated **average**, **minimum**, **maximum**, and **sum** values for rabies cases.
* Sorted the results by the calculated average in descending order and limited the output to the top 10 rows.

### 4. Date Functions & Year Difference Calculation
* Used built-in SQL functions (`MAKEDATE`, `CURDATE`, `TIMESTAMPDIFF`) on the `Year` column to:
  * Generate the date corresponding to January 1st of each recorded year (e.g., `1996` $\rightarrow$ `1996-01-01`).
  * Retrieve the current system date.
  * Compute the exact year difference between the generated date and the current date.

### 5. Custom Stored Function
* Created a custom MySQL stored function (`calculate_year_difference`) that accepts an integer year as input, constructs the January 1st date, and returns the computed year difference relative to the current date.

---

## How to Run

1. Clone this repository or download the source files as an archive.
2. Open **MySQL Workbench** or your preferred MySQL client.
3. Execute the SQL scripts sequentially to create the schema, normalize the tables, and run the analytical queries and functions.