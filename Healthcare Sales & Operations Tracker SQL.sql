SELECT * FROM healthcare_sales;
SELECT * FROM inventory;
SELECT * FROM product_master;
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1️. Which region is generating the highest revenue?
SELECT Region, SUM(UnitsSold * UnitPrice) AS TotalRevenue
FROM Healthcare_Sales
GROUP BY Region
ORDER BY TotalRevenue DESC;

-- Helps prioritize regional marketing and expansion strategies.
-- Central region contributes  '17,47,081.00' revenue, making it ideal for future investment.
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. What are the top 5 best-selling products by volume?
SELECT Product, SUM(UnitsSold) AS TotalUnits
FROM Healthcare_Sales
GROUP BY Product
ORDER BY TotalUnits DESC
LIMIT 5;

-- Guides demand forecasting and stock replenishment.
-- Atorvastatin, Lisinopril,  Amoxicillin, Metformin, Aspirin are top 5 best-selling products by volume.
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. How are monthly sales trending over time?
SELECT DATE_FORMAT(SaleDate, '%Y-%m') AS Month, SUM(UnitsSold * UnitPrice) AS Revenue
FROM Healthcare_Sales
GROUP BY Month
ORDER BY Month;

-- Detects seasonality and performance dips to guide promotions.
-- Strongest Quarter: Q4 2023, Significant Drop: September 2023, Early Momentum in 2023, 2024 Started Slower, Q3 Volatility
-- Q1 2023 - 📈 Gradual growth
-- Q2 2023 - 📈 Strong increase
-- Q3 2023 - 📉 Drop in Sep
-- Q4 2023 - 📈 Peak in Nov
-- Q1 2024 - 📉 Jan dip, Feb recovery
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4. Which products are at risk of stockouts?
SELECT ProductName, StockLevel, ReorderLevel
FROM Inventory
WHERE StockLevel < ReorderLevel;

-- Avoid stockouts that lead to lost sales and customer dissatisfaction.
-- | Category               | % Below Reorder
-- Antibiotics (Amoxicillin)   | \~68%           
-- Blood Pressure (Lisinopril) | \~70%          
-- Cholesterol (Atorvastatin)  | \~60%          
-- Diabetes (Metformin)        | \~55%          
-- Pain Relief (Aspirin)       | \~50%       
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Category-wise revenue performance
SELECT 
    pm.Category, 
    SUM(hs.UnitsSold * hs.UnitPrice) AS CategoryRevenue
FROM Healthcare_Sales hs
JOIN Product_Master pm 
    ON hs.Product = LEFT(pm.ProductName, LENGTH(hs.Product))
GROUP BY pm.Category
ORDER BY CategoryRevenue DESC;
 
 -- Informs where to allocate resources in product development or marketing.
 -- Blood Pressure Products Are Market Leaders
 -- Antibiotics and Cholesterol Are High-Performing
 -- Diabetes and Pain Relief Categories Are Close.
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6. Supplier-wise dependency and risk analysis
SELECT Supplier, COUNT(DISTINCT ProductName) AS ProductCount
FROM Product_Master
GROUP BY Supplier
ORDER BY ProductCount DESC;

-- High reliance on a single supplier can be a business risk.
-- PharmaLife is the Dominant Supplier, Supplies 40%+ of all products.
-- MedCure, HealthGenix, and WellCure Have Moderate Share.
------------------------------------------------------------------------------------------------------------------------------------------------------------------