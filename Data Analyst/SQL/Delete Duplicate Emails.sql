--You are given a table named “Emails”, which contains various email records with other relevant information such as name and phone number. However, the table may contain duplicate email records. Your task is to identify and remove these duplicate email records, ensuring that only one instance of each unique email address is kept in the table.
--To solve this problem, we need to identify and remove duplicate email records while preserving an instance of each unique email address in the table. After deduplication, the output data should contain the modified “Emails” table with the duplicate email records removed.
-- Create the Emails table
CREATE TABLE Emails (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255)
);

-- Insert data into the Emails table
INSERT INTO Emails (id, name, email, phone) VALUES
  (1, 'Rahul', 'rahul@example.com', '9876543210'),
  (2, 'Rohit', 'rohit@example.com', '8765432109'),
  (3, 'Suresh', 'rahul@example.com', '7654321098'),
  (4, 'Manish', 'manish@example.com', '6543210987'),
  (5, 'Amit', 'amit@example.com', '5432109876'),
  (6, 'Rahul', 'rahul@example.com', '4321098765');

--Now here’s how to delete the duplicate emails while preserving an instance of each unique email address in the table:
DELETE e1
FROM Emails e1, Emails e2
WHERE e1.id > e2.id
AND e1.email = e2.email;

--This query uses a self-join to identify and remove duplicate email records from the “Emails” table. Here’s how it works:
--1. The query selects rows from the “Emails” table using table aliases e1 and e2. It essentially creates two instances of the “Emails” table.
--2. The WHERE clause e1.id > e2.id ensures that only the duplicate records are selected. By comparing the IDs, it retains the rows with lower IDs while discarding the duplicate email records with higher IDs.
--3. Additionally, the e1.email = e2.email condition ensures that only rows with matching email addresses are considered duplicates.
--4. Finally, the DELETE statement DELETE e1 removes selected duplicate records based on the filter conditions.
