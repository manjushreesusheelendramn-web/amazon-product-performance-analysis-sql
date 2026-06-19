CREATE DATABASE amazon_project;
USE amazon_project;

SELECT *
FROM amazon_project_data
LIMIT 5;

DESCRIBE amazon_project_data;

SELECT COUNT(*) AS Total_Products
FROM amazon_project_data;

SELECT Title, `Average Rating`
FROM amazon_project_data
ORDER BY `Average Rating` DESC
LIMIT 10;

SELECT Manufacturer,
       COUNT(*) AS Product_Count
FROM amazon_project_data
GROUP BY Manufacturer
ORDER BY Product_Count DESC
LIMIT 10;

SELECT Manufacturer,
       ROUND(AVG(`Average Rating`),2) AS Avg_Rating
FROM amazon_project_data
GROUP BY Manufacturer
ORDER BY Avg_Rating DESC;

SELECT Title,
       Manufacturer,
       `Average Rating`
FROM amazon_project_data
WHERE `Average Rating` < 3;

SELECT COUNT(*) AS Products_In_Stock
FROM amazon_project_data
WHERE Stock = 'TRUE';

SELECT COUNT(*) AS Products_Out_Of_Stock
FROM amazon_project_data
WHERE Stock = 'FALSE';

SELECT COUNT(*) AS No_Reviews
FROM amazon_project_data
WHERE `Num Of Reviews` = 0;

SELECT Manufacturer,
       COUNT(*) AS Total_Products
FROM amazon_project_data
GROUP BY Manufacturer
ORDER BY Total_Products DESC;

SELECT
    CASE
        WHEN `Average Rating` >= 4 THEN 'Highly Rated'
        WHEN `Average Rating` >= 3 THEN 'Average Rated'
        ELSE 'Low Rated'
    END AS Rating_Category,
    COUNT(*) AS Product_Count
FROM amazon_project_data
GROUP BY Rating_Category;

SELECT Title,
       `Number Of Ratings`
FROM amazon_project_data
WHERE `Number Of Ratings` <> 'NA'
ORDER BY CAST(`Number Of Ratings` AS UNSIGNED) DESC
LIMIT 10;

SELECT
    CASE
        WHEN CAST(Price AS DECIMAL(10,2)) < 50 THEN 'Low Price'
        WHEN CAST(Price AS DECIMAL(10,2)) BETWEEN 50 AND 200 THEN 'Medium Price'
        ELSE 'High Price'
    END AS Price_Category,
    ROUND(AVG(`Average Rating`),2) AS Avg_Rating
FROM amazon_project_data
WHERE Price <> 'NA'
GROUP BY Price_Category;

SELECT Title,
       `Average Rating`,
       `Number Of Ratings`
FROM amazon_project_data
WHERE `Number Of Ratings` <> 'NA'
ORDER BY CAST(`Number Of Ratings` AS UNSIGNED) DESC,
         `Average Rating` DESC
LIMIT 10;

SELECT
CASE
    WHEN `Average Rating` >= 4 THEN 'Satisfied'
    WHEN `Average Rating` >= 3 THEN 'Neutral'
    ELSE 'Dissatisfied'
END AS Customer_Satisfaction,
COUNT(*) AS Products
FROM amazon_project_data
GROUP BY Customer_Satisfaction;

SELECT Stock,
       COUNT(*) AS Product_Count
FROM amazon_project_data
GROUP BY Stock;

SELECT Title,
       Price,
       `Average Rating`
FROM amazon_project_data
WHERE Price <> 'NA'
AND CAST(Price AS DECIMAL(10,2)) > 100
AND `Average Rating` < 3;

SELECT Title,
       Price,
       `Average Rating`
FROM amazon_project_data
WHERE Price <> 'NA'
AND CAST(Price AS DECIMAL(10,2)) < 50
AND `Average Rating` >= 4;

SELECT Manufacturer,
       COUNT(*) AS Products,
       ROUND(AVG(`Average Rating`),2) AS Avg_Rating
FROM amazon_project_data
GROUP BY Manufacturer
ORDER BY Avg_Rating DESC;

SELECT
CASE
    WHEN CAST(Price AS DECIMAL(10,2)) < 50 THEN 'Budget'
    WHEN CAST(Price AS DECIMAL(10,2)) BETWEEN 50 AND 200 THEN 'Mid Range'
    ELSE 'Premium'
END AS Price_Category,
COUNT(*) AS Products,
ROUND(AVG(`Average Rating`),2) AS Avg_Rating
FROM amazon_project_data
WHERE Price <> 'NA'
GROUP BY Price_Category;

SELECT Title,
       `Number Of Ratings`
FROM amazon_project_data
WHERE `Number Of Ratings` <> 'NA'
ORDER BY CAST(`Number Of Ratings` AS UNSIGNED) DESC
LIMIT 10;

SELECT `Average Rating`,
       COUNT(*) AS Product_Count
FROM amazon_project_data
GROUP BY `Average Rating`
ORDER BY `Average Rating` DESC;

SELECT Manufacturer,
       COUNT(*) AS Products,
       ROUND(AVG(`Average Rating`),2) AS Avg_Rating,
       SUM(
           CASE
               WHEN `Number Of Ratings` <> 'NA'
               THEN CAST(`Number Of Ratings` AS UNSIGNED)
               ELSE 0
           END
       ) AS Total_Customer_Engagement
FROM amazon_project_data
GROUP BY Manufacturer
ORDER BY Total_Customer_Engagement DESC;