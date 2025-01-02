--We have two tables: “Customers” and “Orders”. The “Customers” table contains customer information with “id” and “name” columns. The “Orders” table contains order information with the “id” and “customerId” columns, where “customerId” refers to the “id” column in the “Customers” table. Find customers who never place an order.
--To solve this problem, we need to retrieve customers who have never placed an order, which means that the output would be the customers that are in the “Customers” table but not present in the “Orders” table.
-- Create the Customers table
CREATE TABLE Customers (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Insert data into the Customers table
INSERT INTO Customers (id, name) VALUES
  (1, 'Joe'),
  (2, 'Henry'),
  (3, 'Sam'),
  (4, 'Max');

-- Create the Orders table
CREATE TABLE Orders (
  id INT PRIMARY KEY,
  customerId INT,
  FOREIGN KEY (customerId) REFERENCES Customers(id)
);

-- Insert data into the Orders table
INSERT INTO Orders (id, customerId) VALUES
  (1, 3),
  (2, 1);

--Till now we have created the input tables. Now here’s how to find customers who never order using SQL:
SELECT name AS Customers
  FROM Customers
  WHERE NOT EXISTS (SELECT 1 FROM Orders WHERE customerId = Customers.id);

--Below is how the above solution solves the problem:
--1. SELECT name AS Customers: This is the main query where you select the name column from the Customers table. The Customers alias is assigned to the selected column.
--2. FROM Customers: Specifies the source table for the main query, which is the Customers table.
--3. WHERE NOT EXISTS (SELECT 1 FROM Orders WHERE customerId = Customers.id): This is a subquery that checks for the existence of orders for each customer. It correlates the subquery with the outer query using the condition customerId = Customers.id. The NOT EXISTS operator returns true if the subquery returns no rows, which means there are no matching orders for this customer.
  
