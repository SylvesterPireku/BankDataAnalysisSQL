-- This is a project that manages bank data

-- Creating the database
CREATE DATABASE Bankdb;

-- Use the database
USE Bankdb; 

-- Create Tables
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DateOfBirth DATE,
  Email VARCHAR(100),
  PhoneNumber VARCHAR (15)
);

CREATE TABLE Accounts (
  AccountID INT PRIMARY KEY,
  CustomerID INT,
  AccountType VARCHAR(20),
  Balance DECIMAL(15,2),
  CreatedDate DATE
);

CREATE TABLE transations (
  TransactionID INT PRIMARY KEY,
  AccountID INT,
  TransactionDate DATE,
  Amount DECIMAL(15,2),
  transactionType VARCHAR(20)
);

CREATE TABLE Branches (
  BranchID INT PRIMARY KEY,
  BranchName VARCHAR(100),
  BranchAddress VARCHAR(200),
  BranchCity VARCHAR(50),
  BranchRegion VARCHAR(100)
);

CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  PhoneNumber VARCHAR(15),
  BranchID INT 
);

CREATE TABLE Loans (
  LoanID INT PRIMARY KEY,
  CustomerID INT,
  LoanAmount DECIMAL(15,2),
  LoanDate DATE,
  DueDate DATE,
  InterestRate DECIMAL(5,2)
);

-- Inserting Data Into The Tables

INSERT INTO Customers (CustomerID, FirstName, LastName, DateOfBirth, Email, PhoneNumber)
VALUES
(1, 'John', 'Appiah', '1987-09-18', 'j.appiah899@gmail.com', '0245689908'),
(2,'Vida', 'Quaye', '1998-08-02', 'q.vee88@yahoo.com', '0208893421'),
(3,'Elizabeth', 'Owusu', '1967-04-12', 'lizzyowusuwaa@gmail.com', '0538879650'),
(4,'Ben', 'Koomson', '1965-06-06', 'kwekukoomsonb@gmail.com', '0598853724'),
(5,'Victor', 'VanDijk', '1973-12-03', 'vicvandijk42@gmail.com', '0577890644');

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, CreatedDate)
VALUES
(101, 1, 'Savings', 12889.50, '2017-02-09'),
(102, 2, 'Savings', 5000.50, '2023-09-10'),
(103, 3, 'Current', 3400.50, '2019-03-16'),
(104, 4, 'Current', 9042.50, '2016-07-30'),
(105, 5, 'Savings', 15590.50, '2022-01-17');

INSERT INTO transations ( TransactionID, AccountID, TransactionDate, Amount, transactionType)
VALUES 
(3040123, 101, '2024-09-10', 2000.50, 'Deposit'),
(3040124, 102, '2024-09-10', 300.00, 'Withdrawal'),
(3040125, 103, '2024-09-11', 50.00, 'Withdrawal'),
(3040126, 104, '2024-09-12', 850.00, 'Deposit'),
(3040127, 105, '2024-09-12', 1200.00, 'Deposit');

INSERT INTO Branches (BranchID, BranchName, BranchAddress, BranchCity, BranchRegion)
VALUES 
(567, 'Osu Branch', '123 oxford strt', 'Accra', 'Greater Accra'),
(678, 'Adum Branch', '443 main road', 'Kumasi', 'Ashati Region'),
(345, 'Pedu Branch', '221 west st', 'Cape Coast', 'Central Region'),
(900, 'Circle Branch', '554 Nkrumah st', 'Accra', 'Greater Accra'),
(476, 'Anagye Branch', '15 Mango ase st', 'Takorade', 'Western Region');

INSERT INTO Employees ( EmployeeID, FirstName, LastName, Email, PhoneNumber)
VALUES
(001, 'Richard', 'Ansah', 'richieansah@hotmail.com','0209907231'),
(002, 'Patricia', 'Wobil', 'pwobil@gmail.com', '0556438997'),
(003, 'Michael', 'Turkson', 'miketurkson@gmail.com', '0266890723'),
(004, 'Edwina', 'Gyamfie', 'edwina42@yahoo.com', '0594416842'),
(005, 'Prince', 'Grantson', 'pgrants@gmail.com', '0205533891');

INSERT INTO Loans ( LoanID, CustomerID, LoanAmount, LoanDate, DueDate, InterestRate)
VALUES
(11, 1, 3000.00, '2024-03-15', '2025-03-15', 0.35),
(22, 2, 16000.00, '2022-04-12', '2025-04-12', 0.2),
(33, 3, 2000.00, '2024-02-14', '2025-02-14', 0.35),
(44, 4, 3500.00, '2024-05-09', '2025-05-09', 0.22),
(55, 5, 59000.00, '2023-06-09', '2026-06-09', 0.33);

-- Practicing Queries
--Retreive all Customers
SELECT *
FROM Customers;

--Retreive all Accounts from a specific customer 
SELECT *
FROM Accounts
WHERE CustomerID = 1;

-- Retreive transactions from a specific Account
SELECT * 
FROM transations
WHERE AccountID = 103

-- Calculate the total balance from each customer
SELECT Customers.CustomerID, SUM(Accounts.Balance) AS TotalBalance
FROM Customers
JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID
GROUP BY Customers.CustomerID;

-- List Employees in a specific branch
SELECT Employees.FirstName, Employees.LastName, Branches.BranchName
FROM Employees
JOIN Branches ON Employees.BranchID = Branches.BranchID
GROUP BY Employees.FirstName, Employees.LastName,Branches.BranchName;

--Retrieve top 3 customers with the highest total balance
SELECT TOP 3 Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(Accounts.Balance) AS TotalBalance
FROM Customers
JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY TotalBalance DESC;

-- Calculate the total interest for each loan
SELECT 
    LoanID, 
    CustomerID, 
    LoanAmount, 
    InterestRate, 
    LoanAmount * (InterestRate / 100) AS InterestAmount
FROM Loans l;

-- Find All Customers who have both a loan and an account
SELECT DISTINCT Customers.CustomerID, Customers.FirstName, Customers.LastName
FROM Customers
JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID
JOIN Loans ON Customers.CustomerID = Loans.CustomerID;

-- Retreive the monthly transactions of the current year
SELECT MONTH(transations.TransactionDate) AS Month, SUM(transations.Amount) AS TotalTransactions
FROM transations
WHERE YEAR(TransactionDate) =YEAR(GETDATE())
GROUP BY  MONTH(transations.TransactionDate);
 





























