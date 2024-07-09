# Bank Data Management Project

## Table of Contents

1. [Overview](#overview)
2. [Database Schema](#database-schema)
3. [Sample Data](#sample-data)
4. [Queries and Examples](#queries-and-examples)
5. [Setup Instructions](#setup-instructions)
6. [Contributing](#contributing)
7. [License](#license)

## Overview

This project showcases a SQL database designed for managing bank data. It includes tables for customers, accounts, transactions, branches, employees, and loans. The project demonstrates data modeling, SQL query skills, and data manipulation techniques typically used in banking systems.

## Database Schema

The database consists of the following tables:

- **Customers**: Stores customer information such as name, date of birth, contact details.
- **Accounts**: Manages different types of accounts linked to customers, including balances and creation dates.
- **Transactions**: Records financial transactions associated with accounts.
- **Branches**: Contains information about bank branches, including address details.
- **Employees**: Tracks employees working at various branches.
- **Loans**: Manages loan accounts, including loan amounts, interest rates, and repayment details.

## Sample Data

### Customers Table

| CustomerID | FirstName | LastName | DateOfBirth | Email                  | PhoneNumber    |
|------------|-----------|----------|-------------|------------------------|----------------|
| 1          | John      | Doe      | 1985-01-15  | john.doe@example.com   | 123-456-7890   |
| 2          | Jane      | Smith    | 1990-05-22  | jane.smith@example.com | 234-567-8901   |
...

### Accounts Table 

| AccountID | CustomerID | AccountType | Balance   | CreatedDate |
|-----------|------------|-------------|-----------|-------------|
| 1         | 1          | Savings     | 1500.50   | 2020-01-01  |
| 2         | 1          | Checking    | 500.75    | 2020-02-01  |
...

### Transactions Table

| TransactionID | AccountID | TransactionDate | Amount | TransactionType |
|---------------|-----------|-----------------|--------|-----------------|
| 1             | 1         | 2023-01-10      | 200.00 | Deposit         |
| 2             | 2         | 2023-02-15      | 50.00  | Withdrawal      |
...

## Queries and Examples

### Basic Query: Retrieve all customers

```sql
SELECT * FROM Customers;

**### Advanced Query; Calculate total balance for each customer**

```sql
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(Accounts.Balance) AS TotalBalance
FROM Customers 
JOIN Accounts  ON Customer.CustomerID = Accounts.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

**Setup Instructions**
1. Database Creation:
-Run the SQL script to create the 'BankDB' database.

2. Table Creation:
-Execute the SQL scripts to create tables ('Customers', 'Accounts', etc.).

3. Sample Data Insertion:
-Insert sample data into each table using SQL INSERT statements.

4. Run Queries:
-Execute SQL queries to retrieve and manipulate data as demonstrated in the examples.

**Contributing**
Contributions are welcome! Please fork the repository and submit a pull request to contribute to this project.
Ensure your code follows the project's coding standards and includes appropriate documentation.

**License**
This project is licensed under the MIT License.

**Additional Notes**
Feel free to contact me at kofipireku@gmail.com for any questions or feedback.

