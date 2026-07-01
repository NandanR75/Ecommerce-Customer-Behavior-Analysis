# 🛒 E-Commerce Sales & Customer Behaviour Analysis

An end-to-end data analytics project analysing sales performance, profitability drivers, regional demand, and customer behaviour for an Indian e-commerce platform.

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
![Pandas](https://img.shields.io/badge/Pandas-EDA-green?logo=pandas)
![SQL](https://img.shields.io/badge/SQL-20%20Queries-orange?logo=postgresql)
![Power BI](https://img.shields.io/badge/PowerBI-Dashboard-yellow?logo=powerbi)

---

## 📋 Project Overview

E-commerce businesses face a hidden profitability problem: high revenue does not guarantee high profit. This project analyses **1,500 order line items across 500 orders (2018)** to answer five key business questions:

1. Which product sub-categories are actually destroying margin?
2. Which payment methods generate the most profit per transaction?
3. Which months and quarters drive disproportionate revenue — and which are loss-making?
4. Which states and cities are the strongest markets?
5. What share of customers are repeat buyers, and what is the revenue risk from one-time buyers?

---

## 🔑 Key Findings

| Finding | Detail |
|---------|--------|
| 35.3% of line items are loss-making | Losing ₹38,079 gross while gaining ₹75,042 — marginal net profit of ₹36,963 |
| Electronic Games & Furnishings destroy margin | Net-negative sub-categories; selling more hurts the business |
| Credit Card has 14.5% margin vs UPI's 4.8% | Statistically significant difference (p = 0.0002) |
| Q1 = 36.8% of annual revenue; Q3 = 16.4% | Massive seasonal skew with actionable inventory implications |
| Only 31.8% of customers are repeat buyers | Retention is the single biggest revenue growth lever |
| Shirts & T-shirts have ~20% margin | Highest-margin sub-categories, yet underweighted vs loss-makers |

---

## Dashboard
![Dashboard](dashboard.png)

## 📁 Repository Structure

```
ecommerce-analysis/
├── Orders.csv                          # 500 orders — date, customer, state, city
├── Details.csv                         # 1,500 line items — amount, profit, category, payment
├── ecommerce.pbix                      # Power BI interactive dashboard
├── Python_Scripts/
│   ├── EDA_analysis.ipynb              # Full EDA: 12 sections, charts, statistical tests
│   └── data_preprocessing.py          # Data cleaning pipeline
├── SQL_Analytics/
│   ├── business_analytics_queries.sql  # 20 analytical SQL queries
│   ├── sql_runner.py                   # Run all queries via DuckDB (no DB setup needed)
│   └── schema_setup.sql               # MySQL schema for production deployment
└── README.md
```

---

## 📊 Dataset

### Orders.csv (500 rows)
| Column | Type | Description |
|--------|------|-------------|
| Order ID | String | Unique order identifier |
| Order Date | Date | DD-MM-YYYY format |
| CustomerName | String | Customer name |
| State | String | Indian state (19 states) |
| City | String | City of delivery |

### Details.csv (1,500 rows)
| Column | Type | Description |
|--------|------|-------------|
| Order ID | String | Foreign key → Orders |
| Amount | Integer | Sale value in INR |
| Profit | Integer | Profit/loss in INR (can be negative) |
| Quantity | Integer | Units sold |
| Category | String | Electronics, Clothing, Furniture |
| Sub-Category | String | 17 product types |
| PaymentMode | String | COD, UPI, Debit Card, Credit Card, EMI |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Python (Pandas, Matplotlib, Seaborn, SciPy) | EDA, visualisation, statistical testing |
| SQL (DuckDB / MySQL 8+) | 20 analytical queries with window functions |
| Power BI + DAX | Interactive business intelligence dashboard |

---

## 🚀 How to Run

### Python EDA Notebook
```bash
pip install pandas matplotlib seaborn scipy jupyter
cd Python_Scripts
jupyter notebook EDA_analysis.ipynb
```

### SQL Analysis (no database needed)
```bash
pip install duckdb pandas
cd SQL_Analytics
python sql_runner.py                  # run all 20 queries
python sql_runner.py --section 2      # run only Section 2 (Profitability)
python sql_runner.py --export         # save all results to sql_results/
```

### Power BI Dashboard
- Open `ecommerce.pbix` in Power BI Desktop
- If prompted, update data source paths to your local `Orders.csv` and `Details.csv`

---

## 📈 SQL Query Coverage

| Section | Queries | Topics |
|---------|---------|--------|
| 1. Executive KPIs | 2 | Business summary, loss exposure |
| 2. Profitability | 3 | Sub-category margins, loss leaders, category mix |
| 3. Time Series | 4 | Monthly/quarterly trends, MoM growth, seasonality index |
| 4. Regional | 3 | State ranking, city deep-dive, top product per state |
| 5. Payment | 2 | Payment mode profitability, payment preference by category |
| 6. Customer | 3 | Customer value ranking, repeat vs one-time, loss-making customers |
| 7. Advanced | 3 | 3-month rolling average, order value bands, customer quartiles |

---

## 💡 Business Recommendations

| Priority | Finding | Action |
|----------|---------|--------|
| 🔴 High | 35% of line items are loss-making | Immediate pricing/supplier audit |
| 🔴 High | Electronic Games & Furnishings net-negative | Reprice or discontinue |
| 🟡 Medium | Credit Card has 14.5% margin vs COD's 8.1% | Incentivise prepay over COD |
| 🟡 Medium | Only 31.8% customer retention | Launch loyalty/re-engagement programme |
| 🟡 Medium | Top customer Harivansh is loss-making | Track margin, not just revenue, per customer |
| 🟢 Low | Q3 (Jul–Sep) weakest quarter | Reduce inventory build; run clearance promotions |
| 🟢 Low | Maharashtra + MP = 43% of revenue | Deepen stock depth in top two states |

---

## 🤝 Connect

- 💼 **LinkedIn:** [Nandan R](https://www.linkedin.com/in/nandan-r-010564224)
- 📧 **Email:** nandanr121995@gmail.com
