# 🛒 E-Commerce Sales & Business Intelligence Dashboard

An end-to-end data analytics and business intelligence project utilizing **Power BI** to analyze e-commerce sales performance, customer buying patterns, regional revenue distribution, and payment preferences across India.

![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi)
![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-green?logo=pandas)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

## 📋 Project Overview & Problem Statement

E-commerce businesses need clear insights into their sales performance, customer segments, and regional demand to make data-driven decisions. This project analyzes **1,500 order line items across 500 orders (2018)** to uncover key revenue drivers, profitable product categories, preferred payment methods, and top-performing states and cities across India.

---

## 📸 Dashboard Preview

![E-Commerce Dashboard](./images/ecommerce_dashboard.png)

---

## 🛠️ Tech Stack & Architecture

| Tool | Purpose |
|------|---------|
| Microsoft Power BI Desktop | Data modeling & interactive dashboard |
| DAX (Data Analysis Expressions) | Advanced KPIs & calculated metrics |
| Python, Pandas | Data exploration & preprocessing |

---

## 📁 Repository Structure

```
ecommerce-dashboard-project/
├── images/                        # Dashboard screenshots
│   └── ecommerce_dashboard.png
├── Orders.csv                     # Customer order master data (500 rows)
├── Details.csv                    # Order line item details (1,500 rows)
├── ecommerce.pbix                 # Master Power BI report file
└── README.md                      # Project documentation
```

---

## 📊 Dataset Overview

### Orders.csv
- **Rows:** 500 orders
- **Columns:** 5 features
- **Date Range:** January 2018 – December 2018
- **Coverage:** 19 Indian states, 336 unique customers

### Details.csv
- **Rows:** 1,500 line items
- **Columns:** 7 features
- **Categories:** Electronics, Clothing, Furniture
- **Payment Modes:** COD, UPI, Debit Card, Credit Card, EMI

### Dataset Preview

**Orders.csv**

| Order ID | Order Date | CustomerName | State | City |
|:---|:---|:---|:---|:---|
| B-26055 | 10-03-2018 | Harivansh | Uttar Pradesh | Mathura |
| B-25993 | 03-02-2018 | Madhav | Delhi | Delhi |
| B-25973 | 24-01-2018 | Madan Mohan | Uttar Pradesh | Mathura |

**Details.csv**

| Order ID | Amount | Profit | Quantity | Category | Sub-Category | PaymentMode |
|:---|:---|:---|:---|:---|:---|:---|
| B-25681 | ₹1,096 | ₹658 | 7 | Electronics | Electronic Games | COD |
| B-26055 | ₹5,729 | ₹64 | 14 | Furniture | Chairs | EMI |
| B-25955 | ₹2,927 | ₹146 | 8 | Furniture | Bookcases | EMI |

---

## 📖 Data Dictionary

### Orders.csv

| Column Name | Data Type | Description |
|:---|:---|:---|
| **Order ID** | String | Unique identifier for each order |
| **Order Date** | Date | Date when the order was placed |
| **CustomerName** | String | Name of the customer |
| **State** | String | Indian state where the order was placed |
| **City** | String | City where the order was placed |

### Details.csv

| Column Name | Data Type | Description |
|:---|:---|:---|
| **Order ID** | String | Foreign key linking to Orders.csv |
| **Amount** | Integer | Total sale amount in INR |
| **Profit** | Integer | Profit earned on the order in INR |
| **Quantity** | Integer | Number of units sold |
| **Category** | String | Product category — Electronics, Clothing, Furniture |
| **Sub-Category** | String | Specific product type (e.g., Printers, Saree, Chairs) |
| **PaymentMode** | String | Mode of payment — COD, UPI, Debit Card, Credit Card, EMI |

---

### 🛠️ Phase 1: Automated Data Preprocessing Pipeline (Python)
Before loading data into relational structures, a script engineered in Python (Pandas, NumPy, OS) acts as an explicit staging validator to ensure operational data integrity.

Engineering Tasks Handled:
Relational Integrity Checks: Automatically identifies and drops records missing essential unique matching constraints (Order ID).

Chronological Standardization: Normalizes disparate dates into standard ISO-compliant formats (YYYY-MM-DD).

Text Normalization: Eradicates hidden leading or trailing whitespaces from categorization strings (Category, Sub-Category, PaymentMode) to prevent data leakage or downstream indexing failures in reporting views.

.📄 Complete Preprocessing Script (Python_Scripts/data_preprocessing.py)
    import pandas as pd
import numpy as np
import os

def run_advanced_pipeline(orders_csv="Orders.csv", details_csv="Details.csv"):
    print("🚀 Booting Enterprise Preprocessing Pipeline...")
    
    # Check if the data files exist in the path
    if not os.path.exists(orders_csv) or not os.path.exists(details_csv):
        print("❌ Error: Raw datasets not found in specified directory path.")
        return
        
    # Read the raw files
    orders = pd.read_csv(orders_csv)
    details = pd.read_csv(details_csv)
    
    # 1. Clear missing key values
    orders.dropna(subset=['Order ID'], inplace=True)
    details.dropna(subset=['Order ID'], inplace=True)
    
    # 2. Standardize dates to ISO format
    orders['Order Date'] = pd.to_datetime(orders['Order Date'], format='%d-%m-%Y')
    
    # 3. Strip hidden trailing white spaces from text inputs
    for col in ['CustomerName', 'State', 'City']: 
        orders[col] = orders[col].astype(str).str.strip()
    for col in ['Category', 'Sub-Category', 'PaymentMode']: 
        details[col] = details[col].astype(str).str.strip()
        
    # 4. Export clean production files
    orders.to_csv("Cleaned_Orders.csv", index=False)
    details.to_csv("Cleaned_Details.csv", index=False)
    print("✅ Success! Cleaned_Orders.csv and Cleaned_Details.csv have been created!")

if __name__ == "__main__":
    run_advanced_pipeline(orders_csv="Orders.csv", details_csv="Details.csv")

 ###   🗄️ Phase 2: Relational Schema & Analytical Layers (SQL)
The structured entities are handled using modular SQL configuration scripts written to mirror standard production warehouses.

1. Schema Configuration (SQL_Analytics/schema_setup.sql)
Implements an optimized Star Schema establishing clear primary and foreign key constraints between operational master boundaries. It applies database indexing on high-frequency filtering attributes (Order_Date, Category) to maximize join performance.

-- ====================================================================
-- DATABASE SCHEMA SETUP & TABLE CONFIGURATION
-- Purpose: Builds relational tables with strict constraint integrity
-- ====================================================================

-- Create the database staging container
CREATE DATABASE IF NOT EXISTS ecommerce_staging;
USE ecommerce_staging;

-- Drop existing tables to ensure clean compilation during deployments
DROP TABLE IF EXISTS Details;
DROP TABLE IF EXISTS Orders;

-- Create parent Dimension Table (Orders)
CREATE TABLE Orders (
    Order_ID VARCHAR(50) NOT NULL,
    Order_Date DATE NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    PRIMARY KEY (Order_ID)
);

-- Create child Fact Table (Details) with relational Foreign Key mapping
CREATE TABLE Details (
    Line_Item_ID INT AUTO_INCREMENT,
    Order_ID VARCHAR(50) NOT NULL,
    Amount INT NOT NULL,
    Profit INT NOT NULL,
    Quantity INT NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Sub_Category VARCHAR(100) NOT NULL,
    PaymentMode VARCHAR(50) NOT NULL,
    PRIMARY KEY (Line_Item_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

-- Indexing optimized for frequent business analytics reporting joins
CREATE INDEX idx_orders_date ON Orders(Order_Date);
CREATE INDEX idx_details_category ON Details(Category);

2. Business Intelligence Scripting (SQL_Analytics/business_analytics_queries.sql)
Advanced business metrics are evaluated directly inside the engine layer using Common Table Expressions (CTEs), Window Functions (SUM() OVER (...)), and complex filtering matrices.

-- ====================================================================
-- ADVANCED BUSINESS ANALYTICS & EXECUTIVE INSIGHTS
-- Purpose: Drives strategic decision-making using high-performance queries
-- ====================================================================

USE ecommerce_staging;

-- --------------------------------------------------------------------
-- QUERY A: The Cash-on-Delivery (COD) Risk Exposure Profile
-- Business Value: Quantifies high-risk payment channels to save logistics costs
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
-- Business Value: Verifies regional spikes and tracks average order values
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


-- --------------------------------------------------------------------
-- QUERY C: Rolling Revenue running totals via Window Functions
-- Business Value: Visualizes growth acceleration across dates for micro-trends
-- --------------------------------------------------------------------
WITH DailySales AS (
    SELECT 
        o.Order_Date,
        SUM(d.Amount) AS Daily_Revenue
    FROM Orders o
    INNER JOIN Details d ON o.Order_ID = d.Order_ID
    GROUP BY o.Order_Date
)
SELECT 
    Order_Date,
    Daily_Revenue,
    SUM(Daily_Revenue) OVER (ORDER BY Order_Date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Cumulative_Running_Revenue
FROM DailySales
ORDER BY Order_Date;

📊 Phase 3: Interactive Analytical Workspace (Power BI)
The processed analytical data tables feed directly into a business-ready executive dashboard layout using optimized Data Analysis Expressions (DAX) calculations.

Core Calculations Used:
Total Revenue Calculation:
   Core Calculations Used:
Total Revenue Calculation:

Code snippet
Total Revenue = SUM(Details[Amount])
Dynamic Net Profit Margin:

Code snippet
Profit Margin = DIVIDE(SUM(Details[Profit]), [Total Revenue], 0)

## 💡 Key Business Insights

| Metric | Value |
|:---|:---|
| 📦 Total Orders | 500 |
| 🧾 Total Line Items | 1,500 |
| 💰 Total Revenue | ₹4,37,771 |
| 📈 Total Profit | ₹36,963 |
| 📊 Profit Margin | 8.44% |
| 🛍️ Total Units Sold | 5,615 |
| 👥 Unique Customers | 336 |
| 🏆 Top Category | Electronics (₹1,66,267) |
| 📍 Top State | Maharashtra (₹1,02,498) |
| 🏙️ Top City | Indore (₹63,680) |
| 💳 Most Used Payment | COD (684 transactions) |
| 🔝 Top Sub-Category | Printers (₹59,252) |

---

## 🚀 How to Run the Project Locally

### Requirements
- [Microsoft Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
- Python 3.x with `pandas` for data exploration (optional)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/NandanR75/<your-repo-name>.git
   cd <your-repo-name>
   ```

2. **Open the Power BI Dashboard**
   - Double-click `ecommerce.pbix` to open in Power BI Desktop
   - If prompted to update data source path:
     - Go to **Home → Transform Data → Data Source Settings**
     - Click **Change Source** and browse to your local `Orders.csv` and `Details.csv`
     - Click **Apply Changes** to refresh all visuals

3. **Explore the Data (Optional)**
   ```python
   import pandas as pd
   orders = pd.read_csv('Orders.csv')
   details = pd.read_csv('Details.csv')
   merged = orders.merge(details, on='Order ID')
   print(merged.describe())
   ```

---

## 🤝 Let's Connect!

Interested in collaborating or discussing this project?

- 💼 **LinkedIn:** https://www.linkedin.com/in/nandan-r-010564224
- 📧 **Email:** nandanr121995@gmail.com
