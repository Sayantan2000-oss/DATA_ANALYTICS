# HR Attrition & Retention Dashboard - Detailed Project Documentation


This project is a **comprehensive HR Analytics Dashboard** created in Power BI to analyze **employee attrition, retention, and workforce trends**. 
The goal is to provide HR teams and decision-makers with actionable insights into workforce dynamics, enabling data-driven strategies 
to improve employee satisfaction and reduce attrition rates.

The dashboard was designed with a **portfolio and recruiter-friendly focus** — showcasing skills in data preparation, modeling, DAX, and visualization.


## Project Scope & Objectives

**Project Scope & Objectives:**
1. Analyze overall **employee attrition and retention rates**.
2. Identify **high-attrition departments, job roles, and demographic groups**.
3. Provide **KPI-driven insights** on headcount, tenure, and satisfaction.
4. Enable **drillthrough reports** to inspect employee-level details.
5. Showcase advanced Power BI capabilities such as **DAX measures, dynamic filters, and Top N rankings**.


## Data Preparation & Modeling

**Data Preparation & Modeling:**
- Imported raw employee dataset (CSV) into **Power Query**.
- Performed **data cleaning**: handled missing values, standardized data types, and derived new fields like **Tenure Category**.
- Split data into **Fact and Dimension tables**:
  - `FactEmployees`: Performance metrics, salary, attrition, job satisfaction.
  - `DimDepartment`, `DimJobRole`, `DimEducation`, `DimAgeGroup`, etc.
- Created **surrogate keys (DepartmentID, JobRoleID)** and built a **star schema model**.
- Established **One-to-Many relationships** between dimension and fact tables for accurate filtering.


## Skills & Tools Demonstrated

**Skills & Tools Demonstrated:**
- **Power BI** for end-to-end dashboarding.
- **Power Query** for data cleaning and ETL processes.
- **DAX (Data Analysis Expressions)** for calculated measures:
  - `Attrition Rate %`
  - `Retention Rate %`
  - `Average Tenure by Department`
  - `Rank by Retention` (Top N logic)
- **Star Schema Data Modeling** for scalable reporting.
- **Interactive Visualizations**: Slicers, drillthrough pages, stacked charts, KPIs.


## Key Features

**Key Features of the Dashboard:**
- **Executive Summary Page**: KPIs for Attrition %, Retention %, Headcount, and Tenure.
- **Attrition Insights Page**: Breakdown by department, gender, age group, and tenure category.
- **Retention Ranking Page**: Top 5/10 departments or managers by retention, with drillthrough functionality.
- **Employee Details Page**: Interactive drillthrough to view individual employee data.


## Why This Project Matters

**Value of This Project:**
This dashboard replicates **real-world HR analytics use cases**, demonstrating expertise in **data cleaning, modeling, DAX, and dashboard design**. 
It can serve as a **portfolio project** to showcase Power BI proficiency to recruiters and hiring managers.


## How to Open and Explore the Dashboard

**How to Open the Project:**
1. Download the Power BI file: `HR_Attrition_Dashboard.pbix` (available in this repository).
2. Open it using **Power BI Desktop** (free to download from Microsoft).
3. Use the pre-built filters and drillthrough features to explore the data.

**Note:** Since Power BI Service isn't used, this README provides detailed documentation, screenshots, and guidance for offline review.

