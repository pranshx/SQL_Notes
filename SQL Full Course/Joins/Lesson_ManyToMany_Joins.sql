-- TV SERIES CHALLENGE #1
SELECT title, rating
FROM series
JOIN reviews ON series.id = reviews.series_id;

-- TV SERIES CHALLENGE #2
SELECT title, ROUND(AVG(rating), 2) AS avg_rating
FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating;

-- TV SERIES CHALLENGE #3
SELECT first_name, last_name, rating 
FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id;

-- TV SERIES CHALLENGE #4
SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE rating IS NULL;

-- TV SERIES CHALLENGE #5
SELECT genre, ROUND(AVG(rating), 2) AS avg_rating
FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY genre;

-- TV SERIES CHALLENGE #6
SELECT first_name, last_name, IFNULL(COUNT(rating),0), MIN(rating), Max(rating), AVG(rating),
CASE
	WHEN COUNT(rating) = 0 THEN 'Inactive'
    ELSE 'Active'
END AS 'Status' 
FROM reviewers
LEFT JOIN reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name,last_name;