create database meta_glasses_review;
use meta_glasses_review;
-- Step 1: Data Understanding

SELECT COUNT(*) AS total_reviews from meta_glasses_reviews;

SELECT
	Rating,
    COUNT(*) AS review_count
FROM meta_glasses_reviews
GROUP BY rating
ORDER BY rating;

-- Step 2: Review Helpfulness Analysis

 SELECT 
    rating,
    COUNT(reviewID) AS total_reviews,
    AVG(helpful) AS avg_helpful_votes
FROM meta_glasses_reviews_usa
GROUP BY rating
ORDER BY rating DESC;

 SELECT
    CASE
        WHEN LENGTH(review) < 100 THEN 'Short'
        WHEN LENGTH(review) BETWEEN 100 AND 300 THEN 'Medium'
        ELSE 'Long'
    END AS review_length_category,
    ROUND(AVG(helpful), 2) AS avg_helpful_votes
FROM meta_glasses_reviews
GROUP BY review_length_category;

-- STEP 3: Sentimental Analysis

SELECT
    is_positive_review,
    COUNT(*) AS total_reviews
FROM meta_glasses_reviews
GROUP BY is_positive_review;

SELECT
    rating,
    is_positive_review,
    COUNT(*) AS review_count
FROM meta_glasses_reviews
GROUP BY rating, is_positive_review;
