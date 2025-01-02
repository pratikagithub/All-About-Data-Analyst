--You are given two tables: “Users” and “ActivityLog”. The “Users” table includes valuable information such as user identities, including their unique user IDs, names, and corresponding email addresses. On the other hand, the “ActivityLog” table contains a complete log of various user activities, including log IDs, associated user IDs, the type of activity performed, and precise timestamps of when each activity occurred.
--Your task is to extract and analyze the user activity data within the designated timeframe of the past 30 days. You are required to write an SQL query to retrieve relevant user activity records that occurred in the last 30 days.
--User Activity Analysis using SQL
--To solve this problem, we need to write an SQL query to retrieve the user activity for the past 30 days by filtering the records based on the timestamp column. We need to write a query that retrieves the user_id, name, email, activity_type, and timestamp for the activity logs that occurred within the past 30 days by combining information from the “Users” and “ActivityLog” tables based on the user_id column.
CREATE TABLE Users (
  user_id INT,
  name VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE ActivityLog (
  log_id INT,
  user_id INT,
  activity_type VARCHAR(50),
  timestamp DATETIME
);

INSERT INTO Users (user_id, name, email)
VALUES
  (1, 'Rahul', 'rahul@example.com'),
  (2, 'Priya', 'priya@example.com'),
  (3, 'Amit', 'amit@example.com'),
  (4, 'Sneha', 'sneha@example.com'),
  (5, 'Gaurav', 'gaurav@example.com'),
  (6, 'Anika', 'anika@example.com');

INSERT INTO ActivityLog (log_id, user_id, activity_type, timestamp)
VALUES
  (1, 1, 'login', '2023-06-10 09:00:00'),
  (2, 1, 'search', '2023-06-10 09:15:00'),
  (3, 2, 'login', '2023-06-10 10:00:00'),
  (4, 3, 'login', '2023-06-11 11:00:00'),
  (5, 1, 'purchase', '2023-06-12 14:30:00'),
  (6, 2, 'search', '2023-06-15 16:45:00'),
  (7, 1, 'logout', '2023-06-18 20:00:00'),
  (8, 1, 'login', '2023-01-15 10:30:00'),
  (9, 2, 'search', '2023-02-05 14:45:00'),
  (10, 3, 'purchase', '2023-03-20 09:15:00'),
  (11, 1, 'search', '2023-04-10 16:30:00'),
  (12, 2, 'login', '2023-05-05 11:45:00'),
  (13, 3, 'search', '2023-06-15 08:30:00');

--Now here’s how to solve the User Activity Analysis problem using SQL:
SELECT U.user_id, U.name, U.email, A.activity_type, A.timestamp
FROM Users U
JOIN ActivityLog A ON U.user_id = A.user_id
WHERE A.timestamp >= DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 DAY);

--Here’s how the above query works:
--1. The query begins with the SELECT clause, which specifies the columns we want to include in the resulting output. In this case, we want to retrieve the user_id, name, and email from the “Users” table, along with the activity_type and timestamp from the “ActivityLog” table.
--2. The FROM clause specifies the tables we are querying. We use the “Users” table as U and the “ActivityLog” table as A. It allows us to reference these tables later in the query.
--3. The JOIN keyword combines the data from the “Users” and “ActivityLog” tables based on the user_id column.
--4. The ON keyword is followed by the join condition, which specified that we want to join the tables where the user_id in the “Users” table matches the user_id in the “ActivityLog” table.
--5. The WHERE clause filters the results based on the specified condition: A.timestamp >= DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 DAY). It checks if the timestamp in the “ActivityLog” table is greater than or equal to the current timestamp minus 30 days. It ensures that only activity logs within the past 30 days are included in the result set.
  
