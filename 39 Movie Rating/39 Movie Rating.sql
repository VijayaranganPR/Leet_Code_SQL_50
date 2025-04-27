WITH user_reviews AS (
    SELECT 
        u.name,
        COUNT(r.rating) AS review_count
    FROM 
        MovieRating r
    JOIN 
        Users u ON r.user_id = u.user_id
    GROUP BY 
        u.name
),
movie_reviews AS (
    SELECT 
        m.title,
        AVG(CAST(r.rating AS FLOAT)) AS review_avg
    FROM 
        MovieRating r
    JOIN 
        Movies m ON r.movie_id = m.movie_id
    WHERE 
        r.created_at LIKE '2020-02%'
    GROUP BY 
        m.title
)

SELECT results
FROM (
    SELECT TOP 1 
        u.name AS results
    FROM 
        user_reviews u
    WHERE 
        review_count = (SELECT MAX(review_count) FROM user_reviews)
    ORDER BY 
        u.name
) AS t1

UNION ALL

SELECT results
FROM (
    SELECT TOP 1 
        m.title AS results
    FROM 
        movie_reviews m
    WHERE 
        review_avg = (SELECT MAX(review_avg) FROM movie_reviews)
    ORDER BY 
        m.title
) AS t2;
