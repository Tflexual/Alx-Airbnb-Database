-- Drop table if it already exists
DROP TABLE IF EXISTS Booking CASCADE;

-- Step 1: Create a partitioned parent table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount DECIMAL(10,2),
    status VARCHAR(20)
)
PARTITION BY RANGE (start_date);

-- Step 2: Create child partitions by year
CREATE TABLE booking_2023 PARTITION OF Booking
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF Booking
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF Booking
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Test inserting data
INSERT INTO Booking (user_id, property_id, start_date, end_date, amount, status)
VALUES
(1, 101, '2023-02-10', '2023-02-12', 100.00, 'confirmed'),
(2, 102, '2024-07-15', '2024-07-18', 250.00, 'pending'),
(3, 103, '2025-01-05', '2025-01-10', 180.00, 'confirmed');

-- Step 4: Query using partition pruning (fast!)
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
