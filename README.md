# Youtube_data_analysis
![Youtube_logo](https://github.com/Isha-Dhore09/Youtube_data_analysis/blob/main/youtube%20logo.png)

## Overview of YouTube Data SQL Project
This YouTube Data Analysis SQL project focuses on analyzing video performance metrics using PostgreSQL. The dataset contains the following columns

## Project Goals
The project aims to answer key business questions using SQL queries, helping to understand video performance, trends, and audience engagement.

## Technical SQL Skills Used
1.Data Cleaning: Removing commas in numerical fields, handling missing data
2.Aggregation Functions: COUNT, AVG, MAX, MIN, STDDEV
3.Grouping & Filtering: GROUP BY, ORDER BY
4.Ranking & Distribution Analysis: Finding even ranking spread using STDDEV(Rank)
5.Performance Metrics: Engagement rate analysis (Likes / Views)

## Final Business Takeaways
1. Content creators can focus on winning categories and improve engagement.
2. Advertisers & brands can target high-performing categories for ads.
3. YouTube’s algorithm managers can adjust recommendations based on trends.
4. Businesses can analyze trends to predict the next big thing on YouTube.

## Schema
```sql
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
```

## Business problems & Solutions
## 1. Find the Top 10 Most Viewed Videos
```sql
SELECT * FROM youtube_data;

SELECT Rank, Video, Video_Views, Category 
FROM youtube_data
ORDER BY Video_Views DESC 
LIMIT 10;
```

### 2. Find the Average Number of Views Per Category
```sql
SELECT Category,
AVG(Video_Views) AS Avg_Views 
FROM youtube_data
GROUP BY Category
ORDER BY Avg_Views DESC;
```


## 3. Find the 5 Most Liked Videos
```sql
SELECT Rank, Video, likes, Category 
FROM youtube_data
ORDER BY likes DESC 
LIMIT 5;
```

## 4. Find the Engagement Rate for Each Video
--(Engagement Rate = (Likes + Dislikes) / Views)
```sql

SELECT * FROM youtube_data;

SELECT Rank, Video, 
       (Likes + Dislikes) * 100.0 / Video_Views AS Engagement_Rate 
FROM youtube_data
ORDER BY Engagement_Rate DESC 
LIMIT 10;
```


## 5. Find the Category with the Highest Average Likes
```sql
SELECT * FROM youtube_data;
SELECT Category, AVG(Likes) AS Avg_Likes 
FROM youtube_data
GROUP BY Category 
ORDER BY Avg_Likes DESC;
```


## 6. Which category has the most evenly distributed video rankings?
```sql
SELECT * FROM youtube_data;

SELECT 
    Category, 
    COUNT(*) AS Total_Videos,
    ROUND(AVG(Rank), 2) AS Avg_Rank,
    ROUND(STDDEV(Rank), 2) AS Rank_StdDev
FROM youtube_data
GROUP BY Category
ORDER BY Rank_StdDev ASC;
```


## 7. Find the Dislike Ratio for Each Video
--(Dislike Ratio = (Dislikes / Video Views) * 100)
```sql
SELECT * FROM youtube_data;

SELECT Rank, Video, 
       (Dislikes * 100.0) / Video_Views AS Dislike_Ratio 
FROM youtube_data
ORDER BY Dislike_Ratio DESC 
LIMIT 10;
```


## 8. Find the Most Popular Video Category (Based on Views)
```sql
SELECT * FROM youtube_data;

SELECT Category, SUM(Video_Views) AS Total_Views 
FROM youtube_data 
GROUP BY Category 
ORDER BY Total_Views DESC 
LIMIT 1;
```

## 9. How do videos in the same category compare in terms of views, likes, and dislikes?
```sql
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
```


## 10. Find the Percentage of Videos with a Dislike Ratio > 10%
```sql
SELECT * FROM youtube_data;

SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM youtube_data) AS Percentage 
FROM youtube_data
WHERE (Dislikes * 100.0 / Video_Views) > 10;
```



















