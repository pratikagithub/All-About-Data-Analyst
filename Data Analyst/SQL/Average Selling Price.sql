--You are given a table named Sales that contains information about different products sold by a company. Each row in the table represents a single sale
--The table contains multiple rows, each representing sale of a specific product. The ProductID uniquely identifies each product, and the ProductName column contains the name of the corresponding product. The SellingPrice column represents the price at which each product was sold.
--Your task is to calculate the Average Selling Price for each product and present the result in a specific format.
--To solve this problem, we need to find the average selling price for each product in the Sales table. The average selling price is calculated by adding up all the selling prices of a specific product and dividing the total by the number of sales made for that product. To represent the result in the specified format, we can display the ProductName along with its corresponding Average Selling Price. It will give a clear view of how much each product is being sold for on average.
CREATE TABLE Sales (
    ProductID INT,
    ProductName VARCHAR(50),
    SellingPrice DECIMAL(10, 2)
);

INSERT INTO Sales (ProductID, ProductName, SellingPrice)
VALUES (1, 'Product A', 100),
       (2, 'Product B', 150),
       (1, 'Product A', 120),
       (3, 'Product C', 200),
       (2, 'Product B', 180),
       (1, 'Product A', 90),
       (3, 'Product C', 210);
--Now here’s how to calculate the average selling price using SQL:
SELECT
    ProductName,
    AVG(SellingPrice) AS AverageSellingPrice
FROM
    Sales
GROUP BY
    ProductName;
--We retrieved data from the “Sales” table and used the AVG function to determine the average selling price for each product. The AVG function computes the sum of all selling prices for a specific product and divides this total by the number of sales, resulting in the average selling price. To provide a clear column name in the output, we used the “AS AverageSellingPrice” alias. By grouping the results using the GROUP BY clause based on the ProductName column, we ensure that the average selling price is calculated for each unique product. 
--The final output presents the ProductName alongside its corresponding AverageSellingPrice for each product, giving a comprehensive view of the pricing dynamics for various products.
  
