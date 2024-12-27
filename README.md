# Food Delivery System - Database Management

This repository contains the implementation of a database management system for a food delivery system, specifically for Foodpanda. It includes the SQL scripts required for setting up the database schema, inserting sample data, and running queries.

## Overview

The system is designed to manage food delivery operations including:

- **Riders**: Individuals responsible for delivering orders.
- **Customers**: Users who place orders.
- **Orders**: Transactions made by customers.
- **Payments**: Methods and records of payments for orders.
- **Menu Items**: Food and drink options available for ordering from various restaurants.
- **Promotions**: Special offers available for customers.
- **Feedback**: Ratings and reviews for orders made.

The repository includes SQL scripts for creating the database tables, inserting sample data, and performing various queries for aggregating data (such as total sales, order counts, etc.).

## File Structure

```bash
/food-delivery-system
│
├── 363125_Assignment 2_2_2020.pdf   # Assignment 2's description or report
├── Assignment 1_2_2020.pdf           # Assignment 1's description or report
├── DBMS Report 2.pdf                 # Assignment 2's report
├── Foodpanda ERD.pdf                 # ERD diagram for the Foodpanda food delivery system
├── Group4-Corrected.pdf              # Corrected version of Assignment 1's report
├── TIS1101.sql                       # SQL source code for the database setup and queries
└── README.md                         # This readme file
```

- **363125_Assignment 2_2_2020.pdf**: Describes the second assignment in detail.
- **Assignment 1_2_2020.pdf**: Provides details of the first assignment.
- **DBMS Report 2.pdf**: Report for Assignment 2.
- **Foodpanda ERD.pdf**: Entity Relationship Diagram (ERD) for the Foodpanda Food Delivery System, detailing how entities relate to one another.
- **Group4-Corrected.pdf**: The corrected version of Assignment 1's report.
- **TIS1101.sql**: SQL script containing the source code for database creation, sample data, and queries.
- **README.md**: This file which provides an overview of the project, its setup, and usage.

## Setup

To set up the database:

1. Download and install a database management system (DBMS) like Oracle SQL or any compatible system.
2. Open the `TIS1101.sql` file in the DBMS and run the script to create the required tables and insert sample data.

## SQL Queries and Operations

The repository contains several SQL queries that demonstrate common operations, including:

- **Table Creation**: For example, `Rider`, `Customer`, `Order`, `Restaurant`, and more.
- **Data Insertion**: Example queries for inserting records into the various tables.
- **Data Manipulation**: Queries using aggregate functions, such as displaying the most expensive menu, total orders per customer, and riders' vehicle usage.
- **Foreign Key Constraints**: The relationships between tables are maintained using foreign keys.
  
### Example Queries

1. **Display the most expensive menu item:**

```sql
SELECT Menu_ID, Menu_Name, Menu_Price
FROM Menu                     
WHERE Menu_Price 
BETWEEN (SELECT MIN(Menu_Price) FROM Menu) AND 22
AND Menu_Price = (SELECT MAX(Menu_Price) FROM Menu)
```

2. **Count payments with specific amounts:**

```sql
SELECT Payment_ID, COUNT(PAYMENT_ID), MIN(Amount_Paid)
FROM Payment
GROUP BY Payment_ID
HAVING MIN(Amount_Paid) IN(5.50,7.75,8.30)
```

3. **Count of deliveries per rider:**

```sql
SELECT Rider_Vehicle, COUNT(*) AS Total
FROM Rider
GROUP BY Rider_Vehicle
HAVING COUNT(*) > 2;
```

## Notes

- The SQL script creates multiple tables such as Rider, Customer, Order, Payment, Menu, Feedback, and more. Each table contains sample data.
- The queries provided in the TIS1101.sql demonstrate aggregate functions, GROUP BY with HAVING, and complex joins to retrieve meaningful information.
- Foreign keys are used to maintain data integrity across tables.

## License

This project is not under any license yet, but it is intended solely for educational purposes.


