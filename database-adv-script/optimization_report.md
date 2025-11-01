# ⚙️ Query Performance Optimization Report

## 🎯 Objective
Refactor complex SQL queries to improve performance.

---

## 🧾 Initial Query (Before Optimization)
```sql
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
