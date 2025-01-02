--We have a table called “Employees” which contains information about employees. Each employee has an “id”, a “name”, a “salary”, and a “managerId”, which represents the identifier of their respective manager. Find the employees who earn a higher salary than their respective managers.
--To solve this problem, we need to find employees who earn a higher salary than their respective managers. By selecting the rows where the employee’s salary is greater than the manager’s salary, we can identify employees who earn more than their managers.
CREATE TABLE Employees (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  salary INT,
  managerId INT
);

INSERT INTO Employees (id, name, salary, managerId) VALUES
  (1, 'Rahul', 5000, 3),
  (2, 'Rohit', 8000, 4),
  (3, 'Suresh', 6000, NULL),
  (4, 'Manish', 9000, 3);

--Now here’s how to find employees earning more than their managers using SQL:
SELECT e.id, e.name, e.salary, e.managerId
FROM Employees e
JOIN Employees m ON e.managerId = m.id
WHERE e.salary > m.salary;

--In this SQL query, we are performing a self-join on the “Employees” table by joining it to itself based on the “managerId” and “id” columns. It establishes a relationship between each employee and their respective manager. Below is how the above solution solves the problem:
--1. The WHERE clause e.salary > m.salary filters the result to only include rows where the employee’s salary is greater than their manager’s salary.
--2. The columns selected in the SELECT statement include the employee’s “id”, “name”, “salary”, and “managerId”, providing the desired output of employees who earn more than their managers.
  
