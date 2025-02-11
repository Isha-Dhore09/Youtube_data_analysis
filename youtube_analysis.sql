DROP TABLE IF EXISTS youtube_data;
CREATE TABLE youtube_data
(
   rank INT, 
   Video VARCHAR(110), 
   Video_Views BIGINT, 
   Likes BIGINT, 
   Dislikes BIGINT, 
   Category VARCHAR(30), 
   published INT
);

--Business problems & Solutions
--1. Find the Top 10 Most Viewed Videos

SELECT * FROM youtube_data;

SELECT Rank, Video, Video_Views, Category 
FROM youtube_data
ORDER BY Video_Views DESC 
LIMIT 10;

--2. Find the Average Number of Views Per Category

SELECT Category,
AVG(Video_Views) AS Avg_Views 
FROM youtube_data
GROUP BY Category
ORDER BY Avg_Views DESC;


--3. Find the 5 Most Liked Videos

SELECT Rank, Video, likes, Category 
FROM youtube_data
ORDER BY likes DESC 
LIMIT 5;

--4. Find the Engagement Rate for Each Video
--(Engagement Rate = (Likes + Dislikes) / Views)
SELECT * FROM youtube_data;

SELECT Rank, Video, 
       (Likes + Dislikes) * 100.0 / Video_Views AS Engagement_Rate 
FROM youtube_data
ORDER BY Engagement_Rate DESC 
LIMIT 10;


--5. Find the Category with the Highest Average Likes
SELECT * FROM youtube_data;
SELECT Category, AVG(Likes) AS Avg_Likes 
FROM youtube_data
GROUP BY Category 
ORDER BY Avg_Likes DESC;


--6. Which category has the most evenly distributed video rankings?
SELECT * FROM youtube_data;

SELECT 
    Category, 
    COUNT(*) AS Total_Videos,
    ROUND(AVG(Rank), 2) AS Avg_Rank,
    ROUND(STDDEV(Rank), 2) AS Rank_StdDev
FROM youtube_data
GROUP BY Category
ORDER BY Rank_StdDev ASC;


--7. Find the Dislike Ratio for Each Video
--(Dislike Ratio = (Dislikes / Video Views) * 100)
SELECT * FROM youtube_data;

SELECT Rank, Video, 
       (Dislikes * 100.0) / Video_Views AS Dislike_Ratio 
FROM youtube_data
ORDER BY Dislike_Ratio DESC 
LIMIT 10;


--8. Find the Most Popular Video Category (Based on Views)
SELECT * FROM youtube_data;

SELECT Category, SUM(Video_Views) AS Total_Views 
FROM youtube_data 
GROUP BY Category 
ORDER BY Total_Views DESC 
LIMIT 1;

--9. How do videos in the same category compare in terms of views, likes, and dislikes?
SELECT * FROM youtube_data;

SELECT 
    Category, 
    COUNT(*) AS Total_Videos, 
    AVG(Video_Views) AS Avg_Views, 
    MAX(Video_Views) AS Max_Views, 
    MIN(Video_Views) AS Min_Views, 
    AVG(Likes) AS Avg_Likes, 
    AVG(Dislikes) AS Avg_Dislikes
FROM youtube_data
GROUP BY Category
ORDER BY Avg_Views DESC;


--10. Find the Percentage of Videos with a Dislike Ratio > 10%
SELECT * FROM youtube_data;

SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM youtube_data) AS Percentage 
FROM youtube_data
WHERE (Dislikes * 100.0 / Video_Views) > 10;

--11.

SELECT * FROM youtube_data;













