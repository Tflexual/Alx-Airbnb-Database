-- ==========================================
-- SQL Aggregations and Window Functions Practice
-- ==========================================

-- 1️⃣ Aggregation Query
-- Find the total number of bookings made by each user
SELECT 
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM users
JOIN bookings
    ON users.id = bookings.user_id
GROUP BY users.name
ORDER BY total_bookings DESC;

-- 🧠 Explanation:
-- COUNT(bookings.id) counts how many bookings each user made.
-- GROUP BY groups the results per user.
-- ORDER BY shows the most active users first.

-- ==========================================

-- 2️⃣ Window Function Query
-- Rank properties based on the total number of bookings they have received
SELECT 
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS property_rank
FROM properties
LEFT JOIN bookings
    ON properties.id = bookings.property_id
GROUP BY properties.name
ORDER BY property_rank;

-- 🧠 Explanation:
-- We count bookings per property using COUNT().
-- Then we use RANK() OVER(...) to give each property a ranking.
-- RANK() gives the same rank to properties with equal booking counts.

