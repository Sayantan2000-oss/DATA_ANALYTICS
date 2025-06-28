
-- TASK 1: How many passengers were in each class (Pclass)?

SELECT COUNT(PASSENGERID), PCLASS
FROM titanic
GROUP BY PCLASS;

-- TASK 2:  How many passengers were on the Titanic?


SELECT COUNT(PASSENGERID)
FROM TITANIC;

-- TASK 3: What is the average age of the passengers?


SELECT AVG(AGE) AS AVERAGE_AGE
FROM TITANIC;

-- TASK 4:  How many male and female passengers were there?

SELECT COUNT(*), SEX
FROM titanic
GROUP BY SEX;

-- TASK 5:  What was the survival rate by gender?

SELECT SEX, SUM(SURVIVED) AS TOTAL_SURVIVORS,
ROUND(100*SUM(SURVIVED)/(SELECT SUM(SURVIVED) FROM TITANIC),2) AS RATE_
FROM titanic
GROUP  BY SEX;

-- TASK 6: Which cabin had the most survivors?

SELECT COUNT(SURVIVED), CABIN
FROM TITANIC
WHERE SURVIVED>=1
GROUP BY CABIN;

-- TASK 7:  Categorize passengers based on their class (Pclass) into "Economy", "Business", and "First Class" groups.


SELECT PASSENGERID,PCLASS,AGE,
CASE WHEN PCLASS=1 THEN 'ECONOMY' END AS ECONOMY,
CASE WHEN PCLASS=2 THEN 'BUSINESS-CLASS' END AS BUSINESS,
CASE WHEN PCLASS=3 THEN 'FIRST-CLASS' END AS FIRST_CLASS
FROM TITANIC;

-- TASK 8:  What is the rank of passengers based on their fare within each class (Pclass)?

SELECT PASSENGERID,PCLASS,FARE,
DENSE_RANK() OVER(PARTITION BY PCLASS ORDER BY FARE DESC) AS DNS_RNK
FROM titanic;


-- TASK 9:  What is the first (lowest) fare paid by passengers in each class (Pclass)?


SELECT PASSENGERID,PCLASS,
FIRST_VALUE(FARE) OVER(PARTITION BY PCLASS ORDER BY FARE  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS FIRST_FARE
FROM TITANIC;







