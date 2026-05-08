# 📊 Sales Dashboard — Power BI

> An interactive Power BI dashboard analyzing 1,500 sales transactions across Electronics, Clothing, and Furniture categories — uncovering revenue trends, profit drivers, and payment behavior.

---

## 🗂️ Dataset Overview

| Field | Description |
|---|---|
| `Order ID` | Unique identifier for each order |
| `Amount` | Sale amount (in ₹) |
| `Profit` | Profit earned per order (in ₹) |
| `Quantity` | Number of units sold |
| `Category` | Product category — Electronics, Clothing, Furniture |
| `Sub-Category` | Specific product type (17 sub-categories) |
| `PaymentMode` | Payment method used — COD, UPI, Debit Card, Credit Card, EMI |

- **Total Records:** 1,500 transactions
- **Unique Orders:** 500
- **Categories:** 3 (Electronics, Clothing, Furniture)
- **Sub-Categories:** 17

---

## 📈 Key Metrics

| Metric | Value |
|---|---|
| Total Sales Amount | ₹4,37,771 |
| Total Profit | ₹36,963 |
| Total Quantity Sold | 5,615 units |
| Overall Profit Margin | 8.44% |
| Average Order Value | ₹292 |

---

## 📊 Dashboard Visuals

### 1. KPI Cards
- Total Amount, Total Profit, Total Quantity, Profit Margin — displayed as summary cards at the top of the dashboard.

### 2. Sales Amount by Category (Bar / Donut Chart)
- Electronics leads with ₹1,66,267 (38%)
- Clothing: ₹1,44,323 (33%)
- Furniture: ₹1,27,181 (29%)

### 3. Profit by Category (Bar Chart)
- Clothing is the most profitable: ₹13,325
- Electronics: ₹13,162
- Furniture: ₹10,476

### 4. Top Sub-Categories by Amount (Horizontal Bar Chart)
| Sub-Category | Amount (₹) |
|---|---|
| Printers | 59,252 |
| Saree | 59,094 |
| Bookcases | 56,861 |
| Phones | 46,119 |
| Electronic Games | 39,168 |

### 5. Top Sub-Categories by Profit (Bar Chart)
| Sub-Category | Profit (₹) |
|---|---|
| Printers | 8,606 |
| Bookcases | 6,516 |
| Saree | 4,057 |
| Accessories | 3,353 |
| Tables | 3,139 |

### 6. Loss-Making Sub-Categories (Bar Chart)
| Sub-Category | Loss (₹) |
|---|---|
| Furnishings | -806 |
| Electronic Games | -644 |
| Kurti | -401 |
| Skirt | -315 |
| Leggings | -130 |

### 7. Payment Mode Distribution (Donut Chart)
| Payment Mode | Orders |
|---|---|
| COD | 684 (45.6%) |
| UPI | 331 (22.1%) |
| Debit Card | 202 (13.5%) |
| Credit Card | 163 (10.9%) |
| EMI | 120 (8.0%) |

---

## 💡 Business Insights

1. **Electronics drives the highest revenue** but Clothing edges ahead in profit — indicating better margins in Clothing.
2. **Printers are the star product** — highest in both sales amount (₹59,252) and profit (₹8,606).
3. **Electronic Games is a loss-maker** despite being a top revenue sub-category — pricing or cost structure needs review.
4. **COD dominates payment modes at 45.6%** — high operational cost; promoting UPI/digital payments could improve margins.
5. **Furnishings generate a net loss of ₹806** — should be reviewed for discontinuation or repricing.
6. **Overall profit margin of 8.44% is thin** — focus should shift toward high-margin sub-categories like Printers, Bookcases, and Accessories.

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| Power BI Desktop | Dashboard building and visualization |
| DAX | Calculated measures (Profit Margin, KPIs) |
| Power Query | Data cleaning and transformation |
| CSV | Source data format |

---

## 📁 Project Structure

```
sales-dashboard/
│
├── Sales_Dashboard.pbix       ← Main Power BI dashboard file
├── Details.csv                ← Raw dataset (1,500 records)
└── README.md                  ← Project documentation
```

---

## 🚀 How to Open

1. Download and install **Power BI Desktop** (free) from [powerbi.microsoft.com](https://powerbi.microsoft.com/desktop)
2. Clone or download this repository
3. Open `Sales_Dashboard.pbix` in Power BI Desktop
4. If prompted, update the data source path to point to `Details.csv`
5. Click **Refresh** to load the data

---

## 📌 How to Use the Dashboard

- Use **category slicers** to filter visuals by Electronics, Clothing, or Furniture
- Use **payment mode filters** to compare performance across COD, UPI, EMI, etc.
- Hover over charts to see **exact values in tooltips**
- Click any bar or slice to **cross-filter** other visuals on the page

---

## 👤 Author

**Your Name**
[LinkedIn](#) | [GitHub](#) | [Portfolio](#)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
