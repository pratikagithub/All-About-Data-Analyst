--1. AccountNumber represents the unique identifier for each bank account;
--2. AccountHolderName represents the name of the account holder;
--3. TransactionDate is the date when a transaction occurred;
--4. TransactionType represents the type of transaction, such as deposit or withdrawal;
--5. TransactionAmount represents the amount involved in the transaction;
--Your task is to write a query that produces a bank account summary according to the total balance after considering the transaction history for each account.
--Creating Bank Account Summary using SQL
--To solve this problem, we need to write a SQL query that retrieves the necessary information and presents it in a specific format. The bank account summary should include the total balance for each account, which is the sum of all deposits minus the sum of all withdrawals.
CREATE TABLE BankTransactions (
  AccountNumber INT,
  AccountHolderName VARCHAR(255),
  TransactionDate DATE,
  TransactionType VARCHAR(255),
  TransactionAmount DECIMAL(10, 2)
);

INSERT INTO BankTransactions (AccountNumber, AccountHolderName, TransactionDate, TransactionType, TransactionAmount)
VALUES
  (1001, 'Ravi Sharma', '2023-07-01', 'Deposit', 5000),
  (1001, 'Ravi Sharma', '2023-07-05', 'Withdrawal', 1000),
  (1001, 'Ravi Sharma', '2023-07-10', 'Deposit', 2000),
  (1002, 'Priya Gupta', '2023-07-02', 'Deposit', 3000),
  (1002, 'Priya Gupta', '2023-07-08', 'Withdrawal', 500),
  (1003, 'Vikram Patel', '2023-07-04', 'Deposit', 10000),
  (1003, 'Vikram Patel', '2023-07-09', 'Withdrawal', 2000);
--Now, here’s how to create a bank account summary using SQL for all the accounts in the database:
SELECT
  AccountNumber,
  AccountHolderName,
  SUM(CASE WHEN TransactionType = 'Deposit' THEN TransactionAmount ELSE -TransactionAmount END) AS TotalBalance
FROM
  BankTransactions
GROUP BY
  AccountNumber, AccountHolderName
ORDER BY
  AccountNumber;

--The above script uses the SELECT statement to retrieve the necessary information from the “BankTransactions” table. It calculates the total balance for each account by summing the deposit amounts and subtracting the withdrawal amounts. The CASE statement is used to differentiate between deposit and withdrawal transactions and appropriately adjust the transaction amounts. The results are then grouped by the account number and account holder name using the GROUP BY clause. Finally, the results are ordered by the account number using the ORDER BY clause.
