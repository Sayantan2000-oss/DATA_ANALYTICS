
# 📁 Netflix Data Analysis using PostgreSQL

## 📋 Overview
This project explores and analyzes the Netflix dataset using **advanced SQL queries in PostgreSQL**. The goal is to uncover meaningful business insights, understand content distribution, and segment data based on various factors like type, country, cast, genre, duration, and more.

## 🛠️ Tools & Technologies
- **SQL**: PostgreSQL
- **Dataset**: Netflix shows and movies metadata
- **Environment**: pgAdmin / PostgreSQL CLI

---

## 🔍 Key Objectives
- Identify trends in content type (Movies vs TV Shows)
- Discover the most frequent ratings
- Analyze genre and cast diversity
- Detect content with sensitive themes (e.g., "kill", "violence")
- Extract India-specific Netflix insights
- Time-based content addition trends
- Actor and director specific filtering

---

## 📊 SQL Tasks Performed

| # | Description |
|--|-------------|
| 1 | Counted the number of **Movies vs TV Shows** |
| 2 | Identified the **most common rating** per content type |
| 3 | Fetched all **movies released in 2020** |
| 4 | Found **top 5 countries** with the most content |
| 5 | Retrieved the **longest movie** |
| 6 | Filtered content **added in the last 5 years** |
| 7 | Listed content by **director Rajiv Chilaka** |
| 8 | Extracted **TV shows with more than 5 seasons** |
| 9 | Counted content per **genre** |
| 10 | Computed **year-wise content distribution in India** |
| 11 | Listed all **documentaries** |
| 12 | Identified content **without directors** |
| 13 | Tracked movies with **Salman Khan** in the past 10 years |
| 14 | Found **top 10 Indian actors** based on movie appearances |
| 15 | Categorized content as '**Good**' or '**Bad**' based on keywords `'kill'` and `'violence'` in descriptions |

---

## 🧠 Skills Demonstrated
- CTE (Common Table Expressions)
- Aggregate functions (COUNT, MAX, RANK)
- Window functions
- Date and string manipulation
- Filtering and classification using conditions
- Data cleaning and unnesting arrays

---

## 📌 What Makes This Project Unique?
- Used **PostgreSQL’s UNNEST & STRING_TO_ARRAY** to normalize multi-valued fields like `casts` and `country`.
- Built **dynamic filters** for violence-related content using `ILIKE`.
- Applied **real-world business logic** like identifying key content contributors and categorizing sensitive themes.

---

## 🔗 GitHub Repository
[🔗 View Full Project on GitHub](#) *(Insert your repo link here)*

---

## 📄 CV / LinkedIn Summary

> **Netflix Content Analysis using PostgreSQL**  
> Conducted in-depth SQL-based analysis on Netflix’s content dataset using PostgreSQL. Extracted insights on content distribution, genre trends, sensitive content classification, and actor/director contributions. Demonstrated expertise in writing optimized queries using CTEs, window functions, and data transformation techniques. Delivered 15+ actionable queries, highlighting real-world business intelligence scenarios.
