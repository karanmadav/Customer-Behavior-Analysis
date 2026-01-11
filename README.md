# Customer Behavior Analysis

## Project Overview
This project focuses on analyzing customer transaction data to uncover behavior patterns, segmentation, repeat usage, revenue trends, and key business drivers. The analysis uses Python for data cleaning and EDA, SQL for advanced queries, and Power BI for interactive KPI dashboards. Insights are derived for internal projects and a US client (Oxbo).

---

## Repository Structure
Customer-Behavior-Analysis/
│
├── data/
│ ├── raw/ # Original datasets
│ └── cleaned/ # Cleaned/processed datasets
├── notebooks/
│ ├── 1_data_cleaning.ipynb
│ └── 2_analysis.ipynb
├── sql/
│ ├── 01_create_tables.sql
│ ├── 02_advanced_queries.sql
│ └── 03_reporting_queries.sql
├── powerbi/
│ └── Customer_Behavior_Dashboard.pbix
├── docs/
│ └── README.md
├── requirements.txt
└── .gitignore

markdown
Copy code

---

## Tools & Technologies
- **Python:** Pandas, NumPy, Matplotlib, Seaborn (for data cleaning, analysis, and visualizations)  
- **SQL (MySQL):** Data aggregation, segmentation, revenue analysis, repeat vs new customer analysis  
- **Power BI:** Interactive dashboards and KPI reporting  
- **Excel:** Advanced formulas, pivot tables for supplementary analysis  

---

## Project Steps

1. **Data Cleaning (Python)**
   - Handle missing values, duplicates, and outliers
   - Create calculated columns like `age_group` and `purchase_frequency`
   - Save cleaned datasets for SQL and Power BI usage

2. **Data Analysis (Python)**
   - Perform Exploratory Data Analysis (EDA)
   - Identify key metrics such as total revenue, average order value, and customer distribution
   - Generate summary tables for dashboard consumption

3. **SQL Analytics**
   - Create database and tables
   - Write advanced queries for:
     - Revenue by category and season
     - Customer segmentation and top customers
     - Repeat vs new customer analysis
     - Discount and subscription impact
     - Purchase frequency and loyalty

4. **Power BI Dashboard**
   - Connect to cleaned datasets or SQL views
   - Visualize:
     - Revenue trends and KPIs
     - Customer segmentation and behavior
     - Repeat vs new customers
     - Discount & subscription analysis
     - Loyalty insights
   - Provide interactive filters and slicers for detailed exploration

---

## Key Insights
- Customers segmented by **age, gender, and purchase behavior**
- **Revenue trends** analyzed by category and season
- Identification of **repeat vs new customers**
- Impact of **discounts and subscription status** on revenue
- **Top customers** and loyalty patterns highlighted

---

## Repository Usage

1. Clone the repository:
```bash
git clone https://github.com/<your-username>/Customer-Behavior-Analysis.git
