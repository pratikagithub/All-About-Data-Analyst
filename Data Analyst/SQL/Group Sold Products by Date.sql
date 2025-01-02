--The task is to organize and present this sales data in a meaningful format. The goal is to group the products that were sold on each date and calculate the total number of products sold on that date.
--Group Sold Products by Date using SQL
--Solving this problem requires grouping the data based on the dates and aggregating the number of products sold on each date. Additionally, the unique product names for each date need to be combined into a single string, separated by commas.
CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(50)
);

INSERT INTO Activities (sell_date, product)
VALUES
    ('2020-05-30', 'Apples'),
    ('2020-06-01', 'Milk'),
    ('2020-06-02', 'Bread'),
    ('2020-05-30', 'Bananas'),
    ('2020-06-01', 'Cereal'),
    ('2020-06-02', 'Bread'),
    ('2020-05-30', 'Oranges');
--Now here’s how to group sold products by date using SQL:
SELECT
    sell_date,
    COUNT(*) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date;

--Below is how the above SQL script works:

--1. The SELECT statement retrieves data from the Activities table.
--2. We select the sell_date column to represent the date of sales.
--3. The COUNT(*) function calculates the total number of products sold on each sell date.
--4. The GROUP_CONCAT(DISTINCT product ORDER BY product ASC) function concatenates the distinct product names for each sell date, ordered alphabetically.
--5. The GROUP BY clause groups the results by sell_date, ensuring that the aggregation is performed for each unique date.
--6. The ORDER BY clause sorts the results in ascending order of sell_date.
