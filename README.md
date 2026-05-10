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

![E-Commerce Dashboard](images/ecommerce_dashboard.png)

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
