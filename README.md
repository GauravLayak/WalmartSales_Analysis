# Walmart Sales Analysis - SQL Project

## 📌 Project Overview
This SQL project analyzes sales data for **Walmart**, extracting key insights related to revenue, customer behavior, and product performance.

## 📊 Database Schema
### **Table: `walmart_sales`**
#### **Columns:**
- `InvoiceID` (Primary Key)
- `Branch` (Store Branch)
- `City`
- `Customertype`
- `Gender`
- `Productline`
- `Unitprice`
- `Quantity`
- `VAT`
- `Total`
- `Date`
- `Time`
- `Payment`
- `cogs` (Cost of Goods Sold)
- `grossmargin_percent`
- `grossincome`
- `Rating`

## 🔍 Data Exploration
- Checked for `NULL` values in key columns.
- Added new columns:
  - **`time_of_day`** (Morning, Afternoon, Evening)
  - **`day_name`** (Day of the week)
  - **`month_name`** (Month of the year)

## 📈 Data Analysis & Findings
### **1️⃣ General Insights**
- Number of unique **cities**: `SELECT COUNT(DISTINCT city) FROM walmart_sales;`
- Unique **cities and branches**: `SELECT DISTINCT city, branch FROM walmart_sales;`
- Number of unique **product lines**: `SELECT DISTINCT productline FROM walmart_sales;`

### **2️⃣ Revenue & Profit Analysis**
- **Total revenue by month**: `SUM(total)` grouped by `month_name`
- **Month with the largest COGS**: `SUM(cogs)` grouped by `month_name`
- **City with the highest revenue**: `SUM(total)` grouped by `city`
- **Customer type bringing the most revenue**: `SUM(total)` grouped by `customertype`

### **3️⃣ Customer Behavior & Trends**
- **Most common payment method**: `COUNT(payment)` grouped by `payment`
- **Most popular product line**:
  - By **total sales**: `SUM(total)` grouped by `productline`
  - By **quantity sold**: `SUM(quantity)` grouped by `productline`
- **Branch selling more than the average product quantity**: `SUM(quantity) > AVG(quantity)`
- **Most common product line by gender**: `COUNT(gender)` grouped by `productline`
- **Most common customer type**: `COUNT(customertype)`
- **Gender distribution per branch**: `COUNT(gender)` grouped by `branch`

### **4️⃣ Tax & Cost Analysis**
- **Product line with the highest VAT**: `MAX(vat)` grouped by `productline`
- **City with the largest VAT**: `MAX(vat)` grouped by `city`
- **Customer type paying the most VAT**: `MAX(vat)` grouped by `customertype`

### **5️⃣ Customer Experience**
- **Most ratings given at what time of day?**: `AVG(rating)` grouped by `time_of_day`

## 🚀 Key Takeaways
✔ **Revenue Insights:** High revenue months and top-performing branches identified.  
✔ **Customer Trends:** Popular product lines, payment methods, and customer demographics analyzed.  
✔ **Operational Efficiency:** Shipment trends and tax insights provide data-driven strategies for cost management.


🎯 **Next Steps:**
- Integrate real-time sales tracking
- Perform advanced segmentation on customer behavior
- Optimize database performance for large datasets



