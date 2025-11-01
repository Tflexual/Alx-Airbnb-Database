1. INNER JOIN – show bookings with user details :

-- INNER JOIN: bookings + users
SELECT 
  bookings.id AS booking_id,
  users.name AS user_name,
  bookings.property_id
FROM bookings
INNER JOIN users
  ON bookings.user_id = users.id;


2. LEFT JOIN – show all properties and their reviews


-- LEFT JOIN: properties + reviews
SELECT 
  properties.name AS property_name,
  reviews.rating
FROM properties
LEFT JOIN reviews
  ON properties.id = reviews.property_id;


3. FULL OUTER JOIN – show all users and all bookings

-- FULL OUTER JOIN: users + bookings
SELECT 
  users.name AS user_name,
  bookings.id AS booking_id
FROM users
FULL OUTER JOIN bookings
  ON users.id = bookings.user_id;

