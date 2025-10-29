-- seed.sql
-- Task 3: Sample Data Population Script for ALX Airbnb Database

-- ==========================
-- Insert sample users
-- ==========================
INSERT INTO users (user_id, first_name, last_name, email, phone_number, created_at)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '+2348012345678', NOW()),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '+2348098765432', NOW()),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '+2348088888888', NOW()),
(4, 'Aisha', 'Olawale', 'aisha.olawale@example.com', '+2348077777777', NOW());

-- ==========================
-- Insert sample properties
-- ==========================
INSERT INTO properties (property_id, user_id, title, description, location, price_per_night, created_at)
VALUES
(1, 1, 'Seaside Villa', 'Beautiful villa facing the Atlantic Ocean.', 'Lagos, Nigeria', 75000, NOW()),
(2, 2, 'Mountain Retreat', 'Cozy cabin in the hills with scenic views.', 'Jos, Nigeria', 55000, NOW()),
(3, 3, 'City Apartment', 'Modern 2-bedroom apartment in city center.', 'Abuja, Nigeria', 45000, NOW());

-- ==========================
-- Insert sample bookings
-- ==========================
INSERT INTO bookings (booking_id, user_id, property_id, check_in_date, check_out_date, total_amount, status, created_at)
VALUES
(1, 2, 1, '2025-10-15', '2025-10-20', 375000, 'confirmed', NOW()),
(2, 3, 2, '2025-11-01', '2025-11-05', 220000, 'pending', NOW()),
(3, 4, 3, '2025-12-10', '2025-12-15', 225000, 'confirmed', NOW());

-- ==========================
-- Insert sample payments
-- ==========================
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method, status)
VALUES
(1, 1, 375000, '2025-10-10', 'credit_card', 'completed'),
(2, 2, 220000, '2025-10-30', 'bank_transfer', 'pending'),
(3, 3, 225000, '2025-12-05', 'paypal', 'completed');

-- ==========================
-- Insert sample reviews
-- ==========================
INSERT INTO reviews (review_id, user_id, property_id, rating, comment, created_at)
VALUES
(1, 2, 1, 5, 'Fantastic villa, very clean and relaxing stay!', NOW()),
(2, 3, 2, 4, 'Great views and cozy atmosphere.', NOW()),
(3, 4, 3, 3, 'Good apartment but could improve cleanliness.', NOW());
