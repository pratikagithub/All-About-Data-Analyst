--Given two tables, “Trips” and “Users”, containing information on trips and users respectively. Calculate the cancellation rate for carpool requests involving users who are not banned. A ride request is considered cancelled if it is cancelled either by the customer or by the driver. The cancellation rate is calculated by dividing the number of cancelled requests (involving non-banned users) by the total number of requests (with non-banned users) each day.
--The “Trips” table includes details such as trip ID, rider ID, driver ID, city ID, status, and request date. The “Users” table contains user information such as user ID, ban status, and role. To solve this problem, we can join the “Trips” and “Users” tables based on the rider ID and driver ID, ensuring both the client and driver are not banned. By applying this filter, we can focus specifically on ride requests involving unbanned users.
--Next, we need to group the data by request date and calculate the number of cancelled requests and the total number of requests for each day.
CREATE TABLE Trips (
    id INT,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(20),
    request_at DATE
);

INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
    (1, 1, 10, 1, 'completed', '2023-07-12'),
    (2, 2, 11, 1, 'cancelled_by_driver', '2023-07-12'),
    (3, 3, 12, 6, 'completed', '2023-07-12'),
    (4, 4, 13, 6, 'cancelled_by_client', '2023-07-12'),
    (5, 1, 10, 1, 'completed', '2023-07-13'),
    (6, 2, 11, 6, 'completed', '2023-07-13'),
    (7, 3, 12, 6, 'completed', '2023-07-13'),
    (8, 2, 12, 12, 'completed', '2023-07-14'),
    (9, 3, 10, 12, 'completed', '2023-07-14'),
    (10, 4, 13, 12, 'cancelled_by_driver', '2023-07-14');

CREATE TABLE Users (
    users_id INT,
    banned VARCHAR(3),
    role VARCHAR(10)
);

INSERT INTO Users (users_id, banned, role) VALUES
    (1, 'No', 'client'),
    (2, 'Yes', 'client'),
    (3, 'No', 'client'),
    (4, 'No', 'client'),
    (10, 'No', 'driver'),
    (11, 'No', 'driver'),
    (12, 'No', 'driver'),
    (13, 'No', 'driver');
--Now below is how we can calculate the ride cancellation rate using SQL:
WITH UnbannedTrips AS (
    SELECT
        t.request_at AS Day,
        COUNT(CASE WHEN t.status LIKE 'cancelled%' THEN 1 END) AS canceled_requests,
        COUNT(*) AS total_requests
    FROM
        Trips t
        JOIN Users u1 ON t.client_id = u1.users_id
        JOIN Users u2 ON t.driver_id = u2.users_id
    WHERE
        u1.banned = 'No' AND u2.banned = 'No'
    GROUP BY
        t.request_at
)
SELECT
    Day,
    ROUND(canceled_requests / NULLIF(total_requests, 0), 2) AS `Cancellation Rate`
FROM
    UnbannedTrips
ORDER BY
    Day;

--The above solution uses a Common Table Expression (CTE) named UnbannedTrips to calculate the cancellation rate for ride requests involving unbanned users. The CTE performs a join between the Trips and Users tables based on the client and driver IDs, filtering for unbanned users. It aggregates the counts of cancelled requests and total requests per day. The main query then selects the day and calculates the cancellation rate by dividing the cancelled requests by the total requests, rounded to two decimal places. The result is then ordered by the day.
  
