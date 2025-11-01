# Database Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## Tools Used
- `EXPLAIN ANALYZE` (PostgreSQL)
- Indexes for optimization

---

## Queries Monitored

### 1. Booking Details Query
```sql
SELECT b.booking_id, u.name, p.property_name, b.start_date, b.amount
FROM Booking b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id;
