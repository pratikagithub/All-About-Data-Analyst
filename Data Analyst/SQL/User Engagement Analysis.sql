#Questions like User Engagement Analysis are popular SQL questions in Data Science interviews.To solve this problem, you have to analyze 
#user engagement to find the most engaging posts and users based on the given conditions.
#User Engagement Analysis: Problem Statement
#Write SQL queries to gain insights into user engagement by addressing the following problems:

#1. Retrieve the comprehensive count of likes, comments, and shares garnered by a specific post identified by its unique post ID.
#2. Calculate the mean number of reactions, encompassing likes, comments, and shares, per distinct user within a designated time period.
#3. Identify the three most engaging posts, measured by the aggregate sum of reactions, within the preceding week.
#Below are the input tables for solving these problems:
-- Create Posts Table
CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    post_content TEXT,
    post_date DATETIME
);

-- Insert sample data into Posts Table
INSERT INTO Posts (post_id, post_content, post_date)
VALUES
    (1, 'Lorem ipsum dolor sit amet...', '2023-08-25 10:00:00'),
    (2, 'Exploring the beauty of nature...', '2023-08-26 15:30:00'),
    (3, 'Unveiling the latest tech trends...', '2023-08-27 12:00:00'),
    (4, 'Journey into the world of literature...', '2023-08-28 09:45:00'),
    (5, 'Capturing the essence of city life...', '2023-08-29 16:20:00');

-- Create User Reactions Table
CREATE TABLE UserReactions (
    reaction_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    reaction_type ENUM('like', 'comment', 'share'),
    reaction_date DATETIME,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

-- Insert sample data into User Reactions Table
INSERT INTO UserReactions (reaction_id, user_id, post_id, reaction_type, reaction_date)
VALUES
    (1, 101, 1, 'like', '2023-08-25 10:15:00'),
    (2, 102, 1, 'comment', '2023-08-25 11:30:00'),
    (3, 103, 1, 'share', '2023-08-26 12:45:00'),
    (4, 101, 2, 'like', '2023-08-26 15:45:00'),
    (5, 102, 2, 'comment', '2023-08-27 09:20:00'),
    (6, 104, 2, 'like', '2023-08-27 10:00:00'),
    (7, 105, 3, 'comment', '2023-08-27 14:30:00'),
    (8, 101, 3, 'like', '2023-08-28 08:15:00'),
    (9, 103, 4, 'like', '2023-08-28 10:30:00'),
    (10, 105, 4, 'share', '2023-08-29 11:15:00'),
    (11, 104, 5, 'like', '2023-08-29 16:30:00'),
    (12, 101, 5, 'comment', '2023-08-30 09:45:00');

#Retrieving the comprehensive count of likes, comments, and shares garnered by a specific post identified by its unique post ID:
SELECT
    p.post_id,
    p.post_content,
    COUNT(CASE WHEN ur.reaction_type = 'like' THEN 1 END) AS num_likes,
    COUNT(CASE WHEN ur.reaction_type = 'comment' THEN 1 END) AS num_comments,
    COUNT(CASE WHEN ur.reaction_type = 'share' THEN 1 END) AS num_shares
FROM
    Posts p
LEFT JOIN
    UserReactions ur ON p.post_id = ur.post_id
WHERE
    p.post_id = 2 -- Replace with the desired post_id
GROUP BY
    p.post_id, p.post_content;
#The above query retrieves information about a specific post by counting the number of likes, comments, and shares it has received. It combines data from the Posts table, which holds post details, with the UserReactions table, where user reactions are stored. The counts for each type of reaction are calculated using conditional statements and then grouped together for the given post. The result shows the post’s ID, content, and the counts of likes, comments, and shares it has received, helping to understand the engagement it has generated.

#Calculating the mean number of reactions, encompassing likes, comments, and shares, per distinct user within a designated time period: 
SELECT
    DATE(ur.reaction_date) AS reaction_day,
    COUNT(DISTINCT ur.user_id) AS distinct_users,
    COUNT(*) AS total_reactions,
    AVG(COUNT(*)) OVER (PARTITION BY DATE(ur.reaction_date)) AS avg_reactions_per_user
FROM
    UserReactions ur
WHERE
    ur.reaction_date BETWEEN '2023-08-25' AND '2023-08-31' -- Replace with desired time period
GROUP BY
    reaction_day;
#The above query analyzes user reactions within a specific period by grouping the reactions based on the day they occurred. It calculates the number of distinct users who reacted each day, the total count of reactions on each day, and the average number of reactions per user for each day. It helps understand how engaged users were during that period, with the option to replace “2023-08-25” and “2023-08-31” with the desired start and end dates for the analysis. The result provides insights into daily user interaction and the average level of engagement per user within the chosen timeframe.
#Identifying the three most engaging posts, measured by the aggregate sum of reactions, within the preceding week:
SELECT
    p.post_id,
    p.post_content,
    SUM(CASE WHEN ur.reaction_type = 'like' THEN 1 ELSE 0 END +
        CASE WHEN ur.reaction_type = 'comment' THEN 1 ELSE 0 END +
        CASE WHEN ur.reaction_type = 'share' THEN 1 ELSE 0 END) AS total_reactions
FROM
    Posts p
LEFT JOIN
    UserReactions ur ON p.post_id = ur.post_id
WHERE
    ur.reaction_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 WEEK) AND NOW()
GROUP BY
    p.post_id, p.post_content
ORDER BY
    total_reactions DESC
LIMIT
    3; -- Retrieve the top 3 most engaging posts
#The above query examines the engagement levels of posts within the last week by calculating the total number of reactions (likes, comments, and shares) each post has received. It combines data from the Posts table, which stores post details, with the UserReactions table, which holds information about user reactions. The reactions are grouped by post and summed up to determine the total engagement for each post. The results are then ordered in descending order based on total reactions, and only the top 3 most engaging posts are displayed. In essence, this query helps identify the posts that have generated the highest levels of user interaction in terms of reactions over the past week.
