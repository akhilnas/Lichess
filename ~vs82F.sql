-- SQL Queries to Explore the Chess games played on the Lichess platform

-- Display Column Names of the Table

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = Lichess..games
ORDER BY ORDINAL_POSITION

-- Display Table in General

SELECT * 
FROM Lichess..games
ORDER BY white_rating

-- Check if id are unique

SELECT id, COUNT(id)
FROM Lichess..games
GROUP BY id
HAVING COUNT(id)>1

-- Check Maximum and Minimum Rating of Players

SELECT MAX(white_rating), MAX(black_rating)
FROM Lichess..games

-- Check Popularity of Openings Used

SELECT opening_name, COUNT(opening_name) AS games_used
FROM Lichess..games
GROUP BY opening_name 
ORDER BY games_used DESC

-- Take Top 5 most Popular Openings

SELECT TOP(5) opening_name, COUNT(opening_name) AS games_used
FROM Lichess..games
GROUP BY opening_name
ORDER BY games_used DESC

-- Check Number of Mates 
SELECT victory_status, COUNT(victory_status)
FROM Lichess..games
WHERE victory_status LIKE 'mate'
GROUP BY victory_status 

-- Check All the Types of Endings
SELECT victory_status, COUNT(victory_status)
FROM Lichess..games
GROUP BY victory_status 

-- Maximum Rating Difference Between Opposing Players
SELECT TOP(1) ABS(white_rating - black_rating) AS rating_difference
FROM Lichess..games
ORDER BY rating_difference DESC

-- Average Rating Difference Between Players

SELECT AVG(ABS(white_rating - black_rating)) AS rating_difference_average
FROM Lichess..games

-- Type of Formats of Games Played
SELECT DISTINCT(increment_code)
FROM Lichess..games

-- Total Format Types
SELECT COUNT(DISTINCT(increment_code)) AS Number_of_game_formats
FROM Lichess..games

-- Percentage of Rated AND Unrated Games

SELECT COUNT(rated)/COUNT(*) AS Percentage_games
FROM Lichess..games
WHERE rated = 1


-- Seperate Table into Rated Tables for Chess Games

-- Rated Games being more Serious

SELECT *
INTO Lichess..rated_games
FROM Lichess..games
WHERE rated = 1

-- Display the Rated Games Table

SELECT *
FROM Lichess..rated_games

-- Average Turns for Victory

SELECT AVG(turns) AS average_turns 
FROM Lichess..rated_games

-- Average Turns for Victory Depending on Rating Difference

SELECT AVG(turns) AS average_turns , ABS(white_rating - black_rating) AS rating_difference_average
FROM Lichess..rated_games
GROUP BY ABS(white_rating - black_rating)
ORDER BY ABS(white_rating - black_rating) DESC

-- Number of Games played by Players

SELECT white_id AS ids, COUNT(white_id) AS games
FROM Lichess..rated_games
GROUP BY white_id
UNION ALL
SELECT black_id, COUNT(black_id)
FROM Lichess..rated_games
GROUP BY black_id
ORDER BY games DESC

-- Victory Rate of the Players

SELECT white_id AS ids, COUNT(winner)/COUNT(white_id) AS games
FROM Lichess..rated_games
WHERE winner LIKE 'white'
GROUP BY white_id
UNION ALL
SELECT black_id, COUNT(winner)/COUNT(black_id)
FROM Lichess..rated_games
WHERE winner LIKE 'black'
GROUP BY black_id
ORDER BY games DESC










