-- ==========================================
-- Performance Optimization Practice
-- ==========================================

-- 1️⃣ Initial Complex Query (Before Optimization)
-- Retrieves all bookings with user, property, and payment details
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.created_at AS booking_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
ORDER BY b.created_at DESC;

-- 🧠 This query is correct but might be slow if:
-- - Tables are large
-- - No indexes exist on the join columns
-- - We’re selecting unnecessary columns
-- - The ORDER BY adds extra sorting cost

-- ==========================================

-- 2️⃣ Optimized Query (After Refactoring)
-- Simplify and leverage indexes for faster execution
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.created_at >= NOW() - INTERVAL '6 months'
ORDER BY b.created_at DESC;

-- 🧠 Optimization techniques used:
-- ✅ SELECT only necessary columns
-- ✅ Added WHERE clause to limit the dataset
-- ✅ Changed one JOIN to LEFT JOIN (if payments can be missing)
-- ✅ Ensure indexes exist on:
--     - bookings.user_id
--     - bookings.property_id
--     - payments.booking_id
--     - bookings.created_at
