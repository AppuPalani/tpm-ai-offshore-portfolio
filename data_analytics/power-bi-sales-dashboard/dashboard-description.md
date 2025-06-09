
# Power BI Dashboard: Pizza Sales Analysis (2024–25)

## 📊 Overview
This Power BI dashboard provides insights into pizza sales across various restaurants in different U.S. cities.

### 👓 Key KPIs Displayed
- **Total Sales**: Sum of all pizza sales.
- **Total Orders**: Count of orders placed.
- **Average Order Value**: Total Sales / Total Orders.
- **Average Rating**: Mean customer rating from all orders.

### 📈 Visualizations Included
- **Bar Chart**: Sales by Pizza Type (Veg, Non-Veg, Vegan, Cheese Burst)
- **Pie Chart**: Order Distribution by Pizza Size (Small, Medium, Large, XL)
- **Line Chart**: Monthly Sales Trend (Jan–Dec)
- **Bar Chart**: Top Restaurants by Total Sales
- **Table**: Top 10 Pizzas (by Sale/Quantity)

### 🧰 Filters/Slicers
- **Order Date Range**
- **Pizza Size**
- **Pizza Type**
- **Restaurant Name**

## 🔄 Data Model
The dashboard is based on a single table from `pizza_sales_data_cleaned.csv`.

## 🧮 DAX Measures Used
```
Total Sales = SUM('PizzaData'[Total Sale])
Total Orders = COUNT('PizzaData'[Order ID])
Average Order Value = DIVIDE([Total Sales], [Total Orders])
Average Rating = AVERAGE('PizzaData'[Customer Rating])
Top Pizza = CALCULATE(MAX('PizzaData'[Pizza Type]), TOPN(1, SUMMARIZE('PizzaData', 'PizzaData'[Pizza Type], "Sales", SUM('PizzaData'[Total Sale])), [Sales], DESC))
```

## 🧼 Power Query (M) Steps
- Loaded data from CSV
- Changed data types appropriately
- Extracted date components (Order Month, Order Hour)
- Removed nulls and duplicates (if any)
------
