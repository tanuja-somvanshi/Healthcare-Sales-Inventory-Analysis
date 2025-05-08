
# 🏥 Healthcare Sales & Operations Dashboard 📊

This project showcases a full-stack data analysis workflow combining **SQL** and **Excel** for a healthcare company. The goal is to extract meaningful business insights across **sales**, **inventory**, and **product performance**.

# Dashboard Preview 
![Image](https://github.com/user-attachments/assets/16ac2e53-4be7-4e36-85fa-b85913f1df84)

![Image](https://github.com/user-attachments/assets/caf759b0-de5a-46a4-b365-1a09c72ce358)

---

## 📌 Project Summary

This dashboard was built using:

- **SQL**: For querying and transforming sales and inventory data.
- **Excel**: For building pivot tables, trend analysis, and KPI visualization.

---

## 🗃️ Datasets & Schema

### 1. `Healthcare_Sales`
| Column     | Type      | Description              |
|------------|-----------|--------------------------|
| SaleID     | INT       | Unique Sale Record       |
| Product    | VARCHAR   | Name of the product      |
| Region     | VARCHAR   | Sales region             |
| SaleDate   | DATE      | Date of sale             |
| UnitsSold  | INT       | Quantity sold            |
| UnitPrice  | DECIMAL   | Price per unit           |
| Channel    | VARCHAR   | Retail / Distributor     |

### 2. `Product_Master`
| Column       | Type    | Description           |
|--------------|---------|-----------------------|
| ProductID    | INT     | Unique product ID     |
| ProductName  | VARCHAR | Name of the product   |
| Category     | VARCHAR | Therapeutic category  |
| Supplier     | VARCHAR | Supplier company name |

### 3. `Inventory`
| Column         | Type    | Description         |
|----------------|---------|---------------------|
| InventoryID    | INT     | Unique inventory ID |
| ProductName    | VARCHAR | Name of product     |
| Warehouse      | VARCHAR | Location stored     |
| StockLevel     | INT     | Current stock level |
| ReorderLevel   | INT     | Threshold to refill |
| LastRestockDate| DATE    | Last date restocked |

---

## 🔍 Key Insights

- **South** region had the highest revenue 📈
- **Metformin** was the best-selling drug 💊
- **2 products** fell below reorder threshold 🚨
- Monthly revenue peaked in **March 2024** 🗓️
- Category-wise, **Diabetes** and **Cholesterol** drugs dominate sales

---

## ⚙️ SQL Queries Sample

```sql
-- Total Revenue by Region
SELECT Region, SUM(UnitsSold * UnitPrice) AS TotalRevenue
FROM Healthcare_Sales
GROUP BY Region;
```

```sql
-- Low Inventory Alert
SELECT ProductName, StockLevel
FROM Inventory
WHERE StockLevel < ReorderLevel;
```

---

## 📊 Excel Dashboard Features

- Pivot Tables for Sales by Region/Product
- KPI Cards: Total Revenue, Top Product
- Conditional Formatting for Low Stock
- Slicers for Month and Channel Filters
- Line Chart: Monthly Sales Trends

---

## 💻 How to Use

1. Clone the repo
2. Import `healthcare_sales_data.sql` into your SQL tool
3. Use Excel to connect to SQL or import CSVs
4. Build dashboards using PivotTables + formulas

---

## 🏁 Output Preview

![Image](https://github.com/user-attachments/assets/d9f8f289-9797-4745-840c-dd90c0156494)

![Image](https://github.com/user-attachments/assets/aebaaec3-643c-438b-a018-1e61557403c0)

---

## 📁 File Structure

```
├── healthcare_sales_data.sql
├── excel_dashboard.xlsx
├── images/
│   ├── dashboard_preview.png
│   └── pivot_preview.png
├── README.md
```

---

## 🧠 Skills Applied

- SQL Joins & Aggregation
- Excel Pivot Tables & Charts
- Data Cleaning & Transformation
- Business Intelligence Strategy

---

## 📞 Contact

Made with ❤️ by Tanuja Somvanshi  
🌐 LinkedIn: [linkedin.com/in/tanuja-somvanshi/](https://www.linkedin.com/in/tanuja-somvanshi/)

---

