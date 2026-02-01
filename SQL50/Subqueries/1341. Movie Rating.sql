WITH MovieRatingsInFebruary AS (
    SELECT 
        m.movie_id, 
        m.title, 
        mr.rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
),
UserRatings AS (
    SELECT 
        u.name, 
        COUNT(DISTINCT mr.movie_id) AS num_ratings
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
),
AverageMovieRatings AS (
    SELECT 
        movie_id, 
        title, 
        AVG(rating) AS avg_rating
    FROM MovieRatingsInFebruary
    GROUP BY movie_id, title
)

-- Select the user with the most ratings
SELECT name AS results
FROM UserRatings
ORDER BY num_ratings DESC, name
LIMIT 1

UNION

-- Select the movie with the highest average rating in February 2020
SELECT title AS results
FROM AverageMovieRatings
ORDER BY avg_rating DESC, title
LIMIT 1

-- Now, apply a final ORDER BY to the combined results
ORDER BY results;
