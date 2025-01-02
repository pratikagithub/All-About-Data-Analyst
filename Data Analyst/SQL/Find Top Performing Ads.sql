--You are given a table named “Ads” containing data about the ads and their performance metrics, such as ad ID, number of views, clicks, and related costs. Your task is to analyze ad performance and identify the top-performing ads based on click-through rate (CTR). CTR is calculated by dividing the number of clicks by the number of views. You are required to write an SQL query to retrieve the top-performing ads based on their CTR.
--To solve this problem, we need to calculate the click-through rate (CTR) of each ad by dividing the number of clicks by the number of views. The CTR represents the percentage of users who clicked on the ad after seeing it. Higher CTR values indicate better ad performance.
CREATE TABLE Ads (
  adId INT PRIMARY KEY,
  views INT,
  clicks INT,
  cost DECIMAL(10, 2)
);

INSERT INTO Ads (adId, views, clicks, cost) VALUES
  (1, 1000, 50, 20.5),
  (2, 800, 30, 15.2),
  (3, 1200, 80, 25.7),
  (4, 600, 20, 10.9),
  (5, 1500, 120, 40.3);

--Now here’s how to find top-performing ads based on their CTR:
SELECT adId, CONCAT(ROUND(clicks/views * 100, 1), '%') 
AS CTR, views, clicks, cost
FROM Ads
ORDER BY CTR DESC;

--The SQL query retrieves the top-performing ads based on their click-through rate (CTR) from the “Ads” table, as shown in the output above. Here’s how it works:
--1. The SELECT statement selects the columns we need from the output: adId, CTR, views, clicks, and cost.
--2. CTR is calculated using the expression ROUND(clicks/views * 100, 1), which divides the number of clicks by the number of views and multiplies it by 100 to get the percentage. The ROUND function is used to round the CTR to one decimal place.
--3. The CONCAT function is used to add the per cent sign (%) to the CTR value to make it more readable in the output.
--4. The FROM clause specifies the “Ads” table as the data source.
--5. The ORDER BY clause sorts the result set in descending order based on CTR. By using DESC, ads with the highest CTR will appear at the top.
