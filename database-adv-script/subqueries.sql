-- ==========================================
-- SQL Subqueries Practice
-- ==========================================

-- 1️⃣ Non-correlated Subquery
-- Find all properties where the average rating is greater than 4.0
SELECT 
    name AS property_name
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- 🧠 Explanation:
-- The subquery calculates average ratings per property.
-- The main query then shows properties whose IDs appear in that result.

-- ==========================================

-- 2️⃣ Correlated Subquery
-- Find users who have made more than 3 bookings
SELECT 
    name AS user_name
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;

-- 🧠 Explanation:
-- For each user (u), we count how many bookings (b) they have.
-- If that count is greater than 3, we include them in the result.
