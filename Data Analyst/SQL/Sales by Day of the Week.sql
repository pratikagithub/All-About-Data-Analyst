--Questions like Sales by Day of the Week Report are popular SQL questions in Data Science interviews. To solve this problem, you need to group the sales data by the day of the week, calculate the total sales amount for each day, and present the results in a clear and organized format.
--Sales by Day of the Week: Problem Statement
--Retrieve a report that displays the total sales for each day of the week from the provided sales data table. The report should present the results in a format that clearly indicates the sales amount for each day of the week. The table contains records of transactions, including:

--1. the transaction ID
--2. the date of the purchase
--3. and the amount of the purchase 
--Our task is to create a report that provides information about the total sales for each day of the week based on the sales data.
--Sales by Day of the Week using SQL
--To solve this problem, we need to group the sales data by the day of the week, calculate the total sales amount for each day, and present the results in a clear and organized format. This report will help in analyzing the sales patterns and identifying which days of the week have higher sales volumes. The final output should show the sales amount for each day of the week.
CREATE TABLE SalesData (
    TransactionID INT,
    PurchaseDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO SalesData (TransactionID, PurchaseDate, Amount) VALUES
    (1, '2023-08-14', 50.00),
    (2, '2023-08-15', 75.00),
    (3, '2023-08-15', 60.00),
    (4, '2023-08-16', 45.00),
    (5, '2023-08-16', 55.00),
    (6, '2023-08-17', 90.00),
    (7, '2023-08-17', 70.00),
    (8, '2023-08-17', 120.00),
    (9, '2023-08-18', 65.00),
    (10, '2023-08-18', 85.00);

--Now here’s how to create a report of the sales by day of the week using SQL:
SELECT 
    DAYNAME(PurchaseDate) AS DayOfWeek,
    SUM(Amount) AS TotalSales
FROM SalesData
GROUP BY DAYOFWEEK(PurchaseDate), DAYNAME(PurchaseDate)
ORDER BY DAYOFWEEK(PurchaseDate);
--Our query retrieves the day name and calculates the total sales amount for each day of the week from the SalesData table. It does this by first using the DAYNAME() function to extract the day name from the PurchaseDate column and then applying the SUM() function to calculate the total sales amount.
--The results are grouped based on both the numerical day of the week and the day name, ensuring accurate grouping across different weeks. The query orders the results by the numerical day of the week. It allows the output to display the total sales for each day of the week, even if certain days have zero sales recorded in the data.
