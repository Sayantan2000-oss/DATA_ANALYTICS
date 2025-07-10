DROP TABLE Netflix

CREATE TABLE Netflix(
	show_id	VARCHAR(10),
	type	VARCHAR(30),
	title	VARCHAR(300),
	director VARCHAR(215),
	casts	VARCHAR(1000),
	country VARCHAR(150),
	date_added	VARCHAR(50),
	release_year INT,	
	rating	VARCHAR(10),
	duration VARCHAR(15),	
	listed_in	VARCHAR(100),
	description VARCHAR(250)
	)

-- Business Problem Questions

--1. Count the number of Movies vs TV Shows

SELECT TYPE,
		COUNT(*) AS TOTAL_CONTENT
FROM NETFLIX
		GROUP BY TYPE
		
--2. Find the most common rating for movies and TV shows

SELECT TYPE,
		RATING,
		COUNT(*),RANK() OVER (PARTITION BY TYPE ORDER BY COUNT(*) DESC ) AS RNK
FROM NETFLIX
GROUP BY 1,2
ORDER BY 1, 3 DESC


--3. List all movies released in a specific year (e.g., 2020)

SELECT title,
		TYPE,
		RELEASE_YEAR
FROM NETFLIX
WHERE TYPE='Movie' AND RELEASE_YEAR=2020

--4. Find the top 5 countries with the most content on Netflix

SELECT COUNT(*) AS total_content,
UNNEST(STRING_TO_ARRAY(COUNTRY,',')) AS country_name
FROM NETFLIX
GROUP BY country_name
ORDER BY 1 desc
LIMIT 5


--5. Identify the longest movie

SELECT *
FROM NETFLIX
WHERE TYPE='Movie'
AND Duration =
			(SELECT MAX(DURATION) AS MAX_DUR 
			FROM
			NETFLIX)


--6. Find content added in the last 5 years

SELECT *,
TO_DATE(DATE_ADDED , 'Month DD,YYYY') AS year_
FROM NETFLIX
WHERE
TO_DATE(DATE_ADDED , 'Month DD,YYYY') >= CURRENT_DATE - INTERVAL '5 YEARS'


--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT TITLE 
FROM NETFLIX
WHERE DIRECTOR LIKE '%Rajiv Chilaka%'


--8. List all TV shows with more than 5 seasons

SELECT *,
SPLIT_PART(DURATION,' ',1) AS sess
FROM NETFLIX
WHERE TYPE = 'TV Show'
AND
SPLIT_PART(DURATION,' ',1)::numeric > 5


--9. Count the number of content items in each genre

SELECT COUNT(*),
UNNEST(STRING_TO_ARRAY(Listed_in,',')) AS genre
FROM NETFLIX
GROUP BY 2
ORDER BY 2


--10.Find each year and the average numbers of content release in India on netflix. 

SELECT COUNT(show_id),
ROUND((COUNT(*)::numeric/(SELECT count(*) FROM NETFLIX WHERE COUNTRY='India')) * 100,2) AS avg_content,
EXTRACT(YEAR FROM TO_DATE(DATE_ADDED , 'Month DD,YYYY') ) AS year_
FROM NETFLIX
WHERE COUNTRY = 'India'
GROUP BY year_


--11. List all movies that are documentaries 

SELECT * FROM NETFLIX
WHERE TYPE='Movie'
AND listed_in LIKE '%Documentaries%'

--12. Find all content without a director


SELECT * FROM NETFLIX
WHERE DIRECTOR IS NULL


--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT *,
TO_DATE(DATE_ADDED,'Month DD,YYYY') AS year_
FROM NETFLIX
WHERE TYPE='Movie'
AND CASTS ILIKE '%Salman Khan%'
AND TO_DATE(DATE_ADDED,'Month DD,YYYY')>= CURRENT_DATE - INTERVAL '10 years'


--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

WITH CTE AS(SELECT *,
UNNEST(STRING_TO_ARRAY(CASTS,',')) AS INDV_CAST
FROM NETFLIX
WHERE TYPE='Movie'
AND Country='India')
SELECT 
TRIM(INDV_CAST) AS ACTOR_NAMES,
COUNT(*) AS NO_OF_TIMES
FROM CTE
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


/*15.
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.*/

 WITH CTE AS 
 (SELECT *,
	(CASE 
	WHEN  DESCRIPTION ILIKE '%KILL%' THEN 'BAD'
	WHEN DESCRIPTION ILIKE '%VIOLENCE%' THEN 'BAD'
	ELSE 'GOOD'
	END) AS CATEGORY_
FROM NETFLIX)
SELECT  CATEGORY_,COUNT(CATEGORY_)
FROM CTE
GROUP BY CATEGORY_


--END OF PROJECT


















































