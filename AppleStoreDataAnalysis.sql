CREATE TABLE appleStore_description_combined AS

SELECT * FROM appleStore_description1 

UNION ALL

SELECT * FROM appleStore_description2 

UNION ALL

SELECT * FROM appleStore_description3

UNION ALL

SELECT * FROM appleStore_description4

** EXPLORATORY DATA ANALYSIS **

-- check number of unique apps in both tableAppleStore

SELECT COUNT (DIStinct id) AS UniqueAppIDs
FROM AppleStore

SELECT COUNT (DIStinct id) AS UniqueAppIDs
FROM appleStore_description_combined

-- check for any missing values in main key fields

SELECT COUNT(*) AS MissingValues
FROM AppleStore
WHERE track_name is null 
OR user_rating IS null
OR prime_genre is null 

SELECT COUNT(*) AS MissingValues
FROM appleStore_description_combined
WHERE app_desc IS null

-- Finding the number of apps per genre

SELECT prime_genre, COUNT(*) AS NumApps
FROM AppleStore
GROUP BY prime_genre 
ORDER BY NumApps DESC

-- Find the overview of the apps ratings

SELECT min(user_rating) AS MinRating,
	   max(user_rating) AS MaxRating,
       avg(user_rating) AS AvgRating
FROM AppleStore    

** Data Analysis ** 

-- Try to understand whether paid apps have higher rating than free appsAppleStore

SELECT CASE 
			WHEN price > 0 THEN 'Paid'
            ELSE 'Free'
       END AS App_Type,
       avg(user_rating) as Avg_Rating
FROM AppleStore
GROUP BY App_Type

-- Check if apps supporting more languages have higher ratings

SELECT CASE 
			WHEN lang_num < 10 THEN '<10 langs'
            WHEN lang_num BETWEEN 10 AND 30 THEN '10-30 Langs'
            ELSE '>30 Langs'
        END AS language_bucket,
        avg(user_rating) as Avg_Rating
FROM AppleStore
GROUP BY language_bucket 
ORDER BY Avg_Rating DESC

-- check genre with low ratings

SELECT prime_genre,avg(user_rating) AS Avg_Rating 
FROm AppleStore 
GROUP BY prime_genre
ORDER BY Avg_Rating ASC
LIMIT 5

-- means in these genres the users gave low ratings means create an app in these genresAppleStore

-- Check if there is a correlation between the length of the app desc and user ratings

SELECT CASE 
		WHEN length(b.app_desc) < 500 THEN 'Short'
        WHEN length(b.app_desc) BETWEEN 500 AND 100 THEN 'Medium'
        ELSE 'Long'
	END AS description_length_bucket,
	avg(a.user_rating) as average_rating
FROM AppleStore As a 
JOIN appleStore_description_combined AS b 
ON a.id = b.id 
GROUP BY description_length_bucket
ORDER by average_rating DESC

--Check the top-rated apps for each genre
-- Window Function 

SELECT prime_genre, track_name, user_rating
FROM (SELECT prime_genre, track_name,user_rating,
      RANK() OVER(PARTITION BY prime_genre
                  ORDER BY user_rating DESC, rating_count_tot DESC) AS rank
      FROM AppleStore) AS a 
      WHERE a.rank = 1