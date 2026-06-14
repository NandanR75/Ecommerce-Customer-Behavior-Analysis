-- ====================================================================
-- ADVANCED BUSINESS ANALYTICS & EXECUTIVE INSIGHTS
-- Purpose: Drives strategic decision-making using high-performance queries
-- ====================================================================

USE ecommerce_staging;

-- --------------------------------------------------------------------
-- QUERY A: The Cash-on-Delivery (COD) Risk Exposure Profile
-- --------------------------------------------------------------------
SELECT 
    PaymentMode,
    COUNT(DISTINCT Order_ID) AS Total_Transactions,
    SUM(Amount) AS Aggregated_Revenue,
    SUM(Profit) AS Total_Net_Profit,
    ROUND((SUM(Profit) / SUM(Amount)) * 100, 2) AS Segment_Profit_Margin_Pct
FROM Details
GROUP BY PaymentMode
ORDER BY Total_Transactions DESC;

-- --------------------------------------------------------------------
-- QUERY B: Regional Deep-Dive & Market Penetration (Indore Focus)
-- --------------------------------------------------------------------
SELECT 
    o.City,
    o.State,
    COUNT(DISTINCT o.Order_ID) AS Order_Volume,
    COUNT(DISTINCT o.CustomerName) AS Unique_Buyer_Count,
    SUM(d.Amount) AS Total_City_Revenue,
    ROUND(SUM(d.Amount) / COUNT(DISTINCT o.Order_ID), 2) AS Average_Order_Value_INR
FROM Orders o
INNER JOIN Details d ON o.Order_ID = d.Order_ID
GROUP BY o.City, o.State
HAVING Total_City_Revenue > 10000
ORDER BY Total_City_Revenue DESC;
