-- ==========================================
-- Database Index Optimization
-- ==========================================

-- 1️⃣ Index for User Table
-- Users are often joined with bookings via user_id
CREATE INDEX idx_users_id ON users(id);

-- 2️⃣ Index for Booking Table
-- Used frequently in JOINs and lookups
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- 3️⃣ Index for Property Table
-- Often joined with bookings or reviews
CREATE INDEX idx_properties_id ON properties(id);

-- 4️⃣ Index for Reviews Table
-- Used in WHERE and GROUP BY (for average rating)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- 5️⃣ Optional: For sorting or filtering by date
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- ==========================================
-- Performance Analysis
-- ==========================================
-- Use EXPLAIN or ANALYZE to compare performance before and after indexing
-- Example:
-- EXPLAIN ANALYZE
-- SELECT * FROM bookings WHERE user_id = 5;
--
-- Observe how the query plan changes (look for "Index Scan" instead of "Seq Scan").
