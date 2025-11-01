-- ==========================================
-- SQL Joins Practice Project
-- ==========================================

-- 1️⃣ INNER JOIN
-- Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    users.name AS user_name,
    bookings.property_id
FROM bookings
INNER JOIN users
    ON bookings.user_id = users.id;

-- 2️⃣ LEFT JOIN
-- Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.name AS property_name,
    reviews.rating
FROM properties
LEFT JOIN reviews
    ON properties.id = reviews.property_id;

-- 3️⃣ FULL OUTER JOIN
-- Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
    users.name AS user_name,
    bookings.id AS booking_id
FROM users
FULL OUTER JOIN bookings
    ON users.id = bookings.user_id;
