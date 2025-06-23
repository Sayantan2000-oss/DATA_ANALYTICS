-- PROJECT: Industrial Combustion Energy Analysis Using SQL
-- Dataset: PROJECT1

/*------------------------------------------
 Q1: MMBtu_TOTAL for Ethane & Ethanol
-------------------------------------------*/
SELECT SUM(MMBtu_TOTAL) AS Total_MMBtu
FROM PROJECT1
WHERE FUEL_TYPE IN ('ETHANE', 'ETHANOL');


/*------------------------------------------
 Q2: Average GWht_TOTAL for 3M Company Facility
-------------------------------------------*/
SELECT AVG(GWht_TOTAL) AS Avg_GWht
FROM PROJECT1
WHERE FACILITY_NAME LIKE '%3M COMPANY%';


/*------------------------------------------
 Q3: Unit Name Trend (1950–2020) vs GWht_TOTAL
-------------------------------------------*/
SELECT UNIT_NAME, SUM(GWHT_TOTAL) AS Total_GWht
FROM PROJECT1
WHERE REPORTING_YEAR BETWEEN 1950 AND 2020
GROUP BY UNIT_NAME;


/*------------------------------------------
 Q4: % Share of MMBtu_TOTAL and GWht_TOTAL by MECS_Region
-------------------------------------------*/
SELECT 
  MECS_REGION,
  ROUND(100 * SUM(MMBTU_TOTAL) / (SELECT SUM(MMBTU_TOTAL) FROM PROJECT1), 2) AS MMBtu_Share,
  ROUND(100 * SUM(GWHT_TOTAL) / (SELECT SUM(GWHT_TOTAL) FROM PROJECT1), 2) AS GWht_Share
FROM PROJECT1
GROUP BY MECS_REGION;


/*------------------------------------------
 Q5: PRIMARY_NAICS_TITLE vs Facility Name and Fuel Type Stats
-------------------------------------------*/
SELECT 
  PRIMARY_NAICS_TITLE,
  FACILITY_NAME,
  FUEL_TYPE,
  SUM(MMBTU_TOTAL) AS M_TOTAL,
  SUM(GWHT_TOTAL) AS G_TOTAL,
  COUNT(*) AS Record_Count
FROM PROJECT1
GROUP BY PRIMARY_NAICS_TITLE, FUEL_TYPE, FACILITY_NAME;
