-- ============================================
-- PROJECT: E-Commerce Sales Analysis
-- Database: ecommerce | Table: orders
-- Goal: Explore order volume, sales performance, top products/cities,
--       profit, payment modes, and cancellations
-- ============================================

-- Setup
SHOW DATABASES;
CREATE DATABASE ecommerce;
USE ecommerce;
SHOW TABLES;

SELECT * FROM orders;


-- Question 1: What is the total number of orders?
SELECT COUNT(*) AS Total_Orders
FROM orders;
-- Answer: 109483


-- Question 2: What is the total sales value?
SELECT SUM(Net_amount) AS Total_Sales
FROM orders;
-- Answer: 32711156.04


-- Question 3: What are the top-selling products?
SELECT
    Product, SUM(Net_amount) AS Sales
FROM orders
GROUP BY Product
ORDER BY Sales DESC;
-- Answer: Top Product: Staples — 172908.47


-- Question 4: What are the top-performing cities?
SELECT
    City, SUM(Net_amount) AS Sales
FROM orders
GROUP BY City
ORDER BY Sales DESC;
-- Answer:
-- New York City    2859173.24
-- Los Angeles      2253526.21
-- Philadelphia     1704946.75


-- Question 5: What are monthly sales figures?
SELECT
    Month, SUM(Net_amount) AS Sales
FROM orders
GROUP BY Month;
-- Answer: November — 1244524.05


-- Question 6: Which product generates the highest profit?
SELECT
    Product, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product
ORDER BY Total_Profit DESC;
-- Answer: Staples — 25936.27


-- Question 7: How are orders distributed across payment modes?
SELECT
    Payment_Mode, COUNT(*) AS Order_Count
FROM orders
GROUP BY Payment_Mode;
-- Answer:
-- Credit Card    42028
-- Debit Card     26337


-- Question 8: How many orders were cancelled?
SELECT *
FROM orders
WHERE Order_Status = 'Shipping canceled';
-- Answer: 4691 orders

